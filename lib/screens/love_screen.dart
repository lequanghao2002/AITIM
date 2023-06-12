import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/constants/color_constants.dart';
import '../core/constants/dimension_contants.dart';
import '../core/helpers/image_helper.dart';
import '../data/medicine_data.dart';
import '../models/medicine_model.dart';
import 'detail_screen.dart';

class LoveScreen extends StatefulWidget {
  const LoveScreen({super.key});

  static const String routeName = '/love_screen';

  @override
  State<LoveScreen> createState() => _LoveScreenState();
}

class _LoveScreenState extends State<LoveScreen> {
  // Iterable<MedicineModel> loveList =
  //     listMedicine.where((element) => element.yeuThich == true);

  Iterable<MedicineModel> loveList = [];
  @override
  void initState() {
    loveList = medicineData.where((element) => element.yeuThich == true);
    super.initState();
  }

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
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
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
          loveList.isEmpty
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                  child: Center(
                    child: Text(
                      'Chưa có dược liệu nào được thêm vào',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(top: 100),
                  padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                  child: SingleChildScrollView(
                    child: Column(
                      children: loveList
                          .map((e) => Container(
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
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: ImageHelper.loadFromAsset(
                                        e.hinhAnh,
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
                                              'Tên: ${e.tenVietNam}',
                                              style: TextStyle(
                                                fontSize: kDefaultPadding,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          SizedBox(
                                            width: 160,
                                            child: Text(
                                              'Mô tả: ${e.moTa}',
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
                                              e.yeuThich == false
                                                  ? GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          //e.yeuThich = 1;
                                                        });
                                                      },
                                                      child: Icon(
                                                        FontAwesomeIcons.heart,
                                                      ),
                                                    )
                                                  : GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          //e.yeuThich = 0;
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
                                                    arguments: e,
                                                  );
                                                },
                                                child: Icon(
                                                  FontAwesomeIcons.circleRight,
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
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
