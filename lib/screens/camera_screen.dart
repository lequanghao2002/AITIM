import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lookup_app/core/constants/color_constants.dart';
import 'package:lookup_app/models/medicine_model.dart';
import 'package:tflite/tflite.dart';

import '../core/constants/dimension_contants.dart';
import '../core/helpers/image_helper.dart';
import '../database/medicine_database.dart';
import 'detail_screen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  static const String routeName = '/camera_screen';

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late File _image;
  late List _results;
  bool imageSelect = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    Tflite.close();

    String? res = (await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    ));

    print(res);
  }

  Future imageClassification(File image) async {
    var recongitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 3,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _results = recongitions!;
      _image = image;
      imageSelect = true;
    });
  }

  double convertPercent(double number) {
    return number * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              (imageSelect)
                  ? Container(
                      margin: const EdgeInsets.only(top: 35),
                      padding: const EdgeInsets.all(16),
                      child: Image.file(_image),
                    )
                  : Container(),
              SingleChildScrollView(
                child: Column(children: [
                  (imageSelect)
                      ? (_results[0]['confidence'] > 0.7)
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: _results.length,
                              itemBuilder: (BuildContext context, int index) {
                                var item = MedicineDatabase.instance
                                    .getMedicineByName(
                                        _results[index]['label']);
                                return Column(children: [
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Text(
                                    'Nhận diện: ${_results[index]['label']}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Tỷ lệ: ${convertPercent(_results[index]['confidence']).toStringAsFixed(0)}%',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  FutureBuilder<MedicineModel>(
                                      future: item,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<MedicineModel>
                                              snapshot) {
                                        if (snapshot.hasData) {
                                          return Container(
                                            height: 120,
                                            margin: EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      kDefaultPadding),
                                              color: Colors.white,
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.1),
                                                  offset: Offset(1.0, 2.0),
                                                  blurRadius: 3.0,
                                                )
                                              ],
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.all(10),
                                                  child: ImageHelper
                                                      .loadFromNetwork(
                                                    snapshot.data!.hinhAnh,
                                                    radius: BorderRadius.all(
                                                      Radius.circular(
                                                          kDefaultPadding),
                                                    ),
                                                    fit: BoxFit.fitWidth,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.7,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 14,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      SizedBox(
                                                        width: (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width -
                                                                70) /
                                                            2,
                                                        child: Text(
                                                          'Tên: ${snapshot.data!.tenVietNam}',
                                                          style: TextStyle(
                                                            fontSize:
                                                                kDefaultPadding,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      SizedBox(
                                                        width: (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width -
                                                                70) /
                                                            2,
                                                        child: Text(
                                                          'Mô tả: ${snapshot.data!.moTa}',
                                                          style: TextStyle(
                                                            fontSize:
                                                                kDefaultPadding,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Row(
                                                        children: [
                                                          snapshot.data!
                                                                      .yeuThich ==
                                                                  0
                                                              ? GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      MedicineDatabase
                                                                          .instance
                                                                          .updateMedicines(snapshot
                                                                              .data!
                                                                              .id);
                                                                    });
                                                                  },
                                                                  child: Icon(
                                                                    FontAwesomeIcons
                                                                        .heart,
                                                                  ),
                                                                )
                                                              : GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      MedicineDatabase
                                                                          .instance
                                                                          .updateMedicines2(snapshot
                                                                              .data!
                                                                              .id);
                                                                    });
                                                                  },
                                                                  child: Icon(
                                                                    FontAwesomeIcons
                                                                        .solidHeart,
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pushNamed(
                                                                DetailScreen
                                                                    .routeName,
                                                                arguments:
                                                                    snapshot
                                                                        .data!,
                                                              );
                                                            },
                                                            child: Icon(
                                                              FontAwesomeIcons
                                                                  .circleRight,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        } else {
                                          return Container();
                                        }
                                      })
                                ]);
                              },
                            )
                          : Center(
                              child: Text(
                                'Không nhận diện được hình ảnh, vui lòng thử lại',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red,
                                ),
                              ),
                            )
                      : Container()
                ]),
              ),
              SizedBox(
                height: 130,
              )
            ],
          ),
          SizedBox(
            height: 100,
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
              backgroundColor: ColorPalette.backgroundScaffoldColor,
              title: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Nhận diện hình ảnh',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: Gradients.defaultGradientBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          35,
                        ),
                        bottomRight: Radius.circular(
                          35,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              right: 10,
              bottom: 10,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      color: ColorPalette.primaryColor,
                    ),
                    padding: EdgeInsets.all(3),
                    child: IconButton(
                      onPressed: pickImageFromGallery,
                      icon: Icon(Icons.image),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      color: ColorPalette.primaryColor,
                    ),
                    padding: EdgeInsets.all(3),
                    child: IconButton(
                      onPressed: pickImageFromCamera,
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Future pickImageFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickFile = await _picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickFile == null) {
      return;
    } else {
      File image = File(pickFile.path);
      imageClassification(image);
    }
  }

  Future pickImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickFile == null) {
      return;
    } else {
      File image = File(pickFile.path);
      imageClassification(image);
    }
  }
}
