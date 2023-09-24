import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lookup_app/core/constants/dimension_contants.dart';
import 'package:lookup_app/database/medicine_database.dart';
import 'package:lookup_app/models/medicine_model.dart';

import '../core/constants/color_constants.dart';
import '../core/helpers/image_helper.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textEditingController = TextEditingController();

  var getListMedicines = MedicineDatabase.instance.getListMedicines();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    MedicineDatabase.instance.database;
  }

  Future<List<MedicineModel>> searchFilter(String keyWord) async {
    setState(() {});
    if (keyWord.isEmpty) {
      return MedicineDatabase.instance.getListMedicines();
    } else {
      final medicines = getListMedicines.then((value) => value
          .where(
            (element) => element.tenVietNam.toLowerCase().contains(
                  keyWord.toLowerCase(),
                ),
          )
          .toList());
      return medicines;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 186,
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
                  children: [
                    Text(
                      'AITIM',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 38,
                      ),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(kDefaultPadding),
                        ),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(kItemPadding),
                      child: Icon(
                        FontAwesomeIcons.bars,
                        color: Colors.black,
                        size: kDefaultIconSize,
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
          FutureBuilder<List<MedicineModel>>(
            future: searchFilter(textEditingController.text),
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
                      'Không tìm thấy dược liệu có tên ${textEditingController.text}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ))
                  : Container(
                      margin: EdgeInsets.only(top: 206),
                      padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                      child: SingleChildScrollView(
                        child: Column(
                          children: snapshot.data!
                              .map(
                                (medicine) => Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(kDefaultPadding),
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
                                  margin: EdgeInsets.only(top: kMediumPadding),
                                  child: Row(
                                    children: [
                                      // Bug
                                      // Container(
                                      //   margin: EdgeInsets.all(10),
                                      //   child: ImageHelper.loadFromNetwork(
                                      //     medicine.hinhAnh,
                                      //     radius: BorderRadius.all(
                                      //       Radius.circular(kDefaultPadding),
                                      //     ),
                                      //     fit: BoxFit.fitWidth,
                                      //     width: 160,
                                      //   ),
                                      // ),
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  70,
                                              child: Text(
                                                'Tên: ${medicine.tenVietNam}',
                                                style: TextStyle(
                                                  fontSize: kDefaultPadding,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Spacer(),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  70,
                                              child: Text(
                                                'Mô tả: ${medicine.moTa}',
                                                style: TextStyle(
                                                  fontSize: kDefaultPadding,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
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
                                                  width: 25,
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
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    );
            },
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(top: 156),
            padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
            child: TextField(
              controller: textEditingController,
              onChanged: (value) {
                searchFilter(value);
              },
              decoration: InputDecoration(
                hintText: 'Tìm kiếm...',
                prefixIcon: Padding(
                  padding: EdgeInsets.all(kTopPadding),
                  child: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.black,
                    size: kDefaultPadding,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    textEditingController.clear();
                    setState(() {});
                  },
                  icon: Padding(
                    padding: EdgeInsets.all(kTopPadding),
                    child: Icon(
                      FontAwesomeIcons.xmark,
                      color: Colors.black,
                      size: kDefaultPadding,
                    ),
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      14,
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
