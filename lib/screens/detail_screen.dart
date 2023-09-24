import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lookup_app/core/constants/dimension_contants.dart';
import 'package:lookup_app/core/helpers/image_helper.dart';
import 'package:lookup_app/models/medicine_model.dart';

import '../core/constants/color_constants.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.medicineModel});

  static const String routeName = '/detail_screen';

  final MedicineModel medicineModel;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (widget.medicineModel.hinhAnh.isNotEmpty)
            Positioned.fill(
              child: ImageHelper.loadFromNetwork(
                widget.medicineModel.hinhAnh,
                //fit: BoxFit.fill,
              ),
            )
          else
            Center(
              child: Text(
                "Chưa cập nhật hình ảnh",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          SizedBox(
            height: 188,
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(kDefaultPadding),
                          ),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(kItemPadding),
                        child: Icon(
                          FontAwesomeIcons.arrowLeft,
                          color: Colors.black,
                          size: kDefaultIconSize,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Chi tiết',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    widget.medicineModel.yeuThich == 0
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(kDefaultPadding),
                              ),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(kItemPadding),
                            child: Icon(
                              FontAwesomeIcons.heart,
                              color: Colors.black,
                              size: kDefaultIconSize,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(kDefaultPadding),
                              ),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(kItemPadding),
                            child: Icon(
                              FontAwesomeIcons.solidHeart,
                              color: Colors.red,
                              size: kDefaultIconSize,
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.25,
            maxChildSize: 0.85,
            minChildSize: 0.1,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kMediumPadding,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 2),
                    topRight: Radius.circular(kDefaultPadding * 2),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                        top: kDefaultPadding,
                      ),
                      child: Icon(
                        FontAwesomeIcons.arrowsUpDown,
                        size: 18,
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 50,
                                child: Text(
                                  widget.medicineModel.tenVietNam.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                              // Text(
                              //   widget.medicineModel.tenVietNam.toUpperCase(),
                              //   style: TextStyle(
                              //     fontSize: 20,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 50,
                                child: Text(
                                  widget.medicineModel.tenKhoaHoc,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Họ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: kMinPadding,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              widget.medicineModel.ho,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            'Mô tả',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: kMinPadding,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              widget.medicineModel.moTa,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            'Chế biến',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: kMinPadding,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              widget.medicineModel.cheBien,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            'Tính vị, quy kinh',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: kMinPadding,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              widget.medicineModel.tinhVi,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            'Công năng',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: kMinPadding,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              widget.medicineModel.congNang,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            'Cách dùng, liều lượng',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: kMinPadding,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              widget.medicineModel.cachDung,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            'Kiêng kị',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: kMinPadding,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              widget.medicineModel.kiengKi,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
