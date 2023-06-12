import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lookup_app/core/constants/dimension_contants.dart';
import 'package:lookup_app/core/helpers/image_helper.dart';
import 'package:lookup_app/models/medicine_model.dart';
import 'package:lookup_app/screens/detail_screen.dart';

class ItemMedicineWidget extends StatefulWidget {
  const ItemMedicineWidget({super.key, required this.medicineModel});

  final MedicineModel medicineModel;

  @override
  State<ItemMedicineWidget> createState() => _ItemMedicineWidgetState();
}

class _ItemMedicineWidgetState extends State<ItemMedicineWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
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
              widget.medicineModel.hinhAnh,
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 160,
                  child: Text(
                    'Tên: ${widget.medicineModel.tenVietNam}',
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
                  width: 160,
                  child: Text(
                    'Mô tả: ${widget.medicineModel.moTa}',
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
                    widget.medicineModel.yeuThich == 0
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                //widget.medicineModel.yeuThich = 1;
                              });
                            },
                            child: Icon(
                              FontAwesomeIcons.heart,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                //widget.medicineModel.yeuThich = 0;
                              });
                            },
                            child: Icon(
                              FontAwesomeIcons.solidHeart,
                              color: Colors.red,
                            ),
                          ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          DetailScreen.routeName,
                          arguments: widget.medicineModel,
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
    );
  }
}
