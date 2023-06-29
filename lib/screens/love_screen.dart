import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lookup_app/models/medicine_model.dart';

import '../core/constants/color_constants.dart';
import '../core/constants/dimension_contants.dart';
import '../core/helpers/image_helper.dart';
import '../database/medicine_database.dart';
import 'detail_screen.dart';

class LoveScreen extends StatefulWidget {
  const LoveScreen({super.key});

  static const String routeName = '/love_screen';

  @override
  State<LoveScreen> createState() => _LoveScreenState();
}

class _LoveScreenState extends State<LoveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            // height: 186
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
                      'Danh sách yêu thích',
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
          //---
          FutureBuilder<List<MedicineModel>>(
            future: MedicineDatabase.instance.getListMedicinesByLove(),
            builder: (BuildContext context,
                AsyncSnapshot<List<MedicineModel>> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text(
                    'Loading....',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                );
              }
              return snapshot.data!.isEmpty
                  ? Center(
                      child: Text(
                      'Chưa có dược liệu nào được thêm vào danh sách yêu thích',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ))
                  : Container(
                      margin: EdgeInsets.only(top: 100),
                      padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                      child: SingleChildScrollView(
                        child: Column(
                          children: snapshot.data!
                              .map((medicine) => Container(
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          kDefaultPadding),
                                      color: Colors.white,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.1),
                                          offset: Offset(1.0, 2.0),
                                          blurRadius: 3.0,
                                        )
                                      ],
                                    ),
                                    margin:
                                        EdgeInsets.only(top: kMediumPadding),
                                    child: Row(
                                      children: [
                                        // Bug
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          child: ImageHelper.loadFromAsset(
                                            medicine.hinhAnh,
                                            radius: BorderRadius.all(
                                              Radius.circular(kDefaultPadding),
                                            ),
                                            fit: BoxFit.fitWidth,
                                            width: 160,
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
                                                width: 160,
                                                child: Text(
                                                  'Tên: ${medicine.tenVietNam}',
                                                  style: TextStyle(
                                                    fontSize: kDefaultPadding,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Spacer(),
                                              SizedBox(
                                                width: 160,
                                                child: Text(
                                                  'Mô tả: ${medicine.moTa}',
                                                  style: TextStyle(
                                                    fontSize: kDefaultPadding,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Spacer(),
                                              Row(
                                                children: [
                                                  medicine.yeuThich == 0
                                                      ? GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              MedicineDatabase
                                                                  .instance
                                                                  .updateMedicines(
                                                                      medicine
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
                                                            setState(() {
                                                              MedicineDatabase
                                                                  .instance
                                                                  .updateMedicines2(
                                                                      medicine
                                                                          .id);
                                                            });
                                                          },
                                                          child: Icon(
                                                            FontAwesomeIcons
                                                                .solidHeart,
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pushNamed(
                                                        DetailScreen.routeName,
                                                        arguments: medicine,
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
                                  ))
                              .toList(),
                          // .map((medicine) =>
                          //     ItemMedicineWidget(medicineModel: medicine))
                          // .toList(),
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
