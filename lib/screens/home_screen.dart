import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lookup_app/core/constants/dimension_contants.dart';
import 'package:lookup_app/data/medicine_data.dart';
import 'package:lookup_app/models/medicine_model.dart';

import '../core/constants/color_constants.dart';
import '../widgets/item_medicine_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MedicineModel> list = [];

  @override
  void initState() {
    list = listMedicine;
    super.initState();
  }

  List<MedicineModel> result = [];

  void runFilter(String keyWord) {
    if (keyWord.isEmpty) {
      result = listMedicine;
    } else {
      result = listMedicine
          .where(
            (element) => element.tenVietNam.toLowerCase().contains(
                  keyWord.toLowerCase(),
                ),
          )
          .toList();
    }
  }

  TextEditingController textEditingController = TextEditingController();

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
                  // ignore: prefer_const_literals_to_create_immutables
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
          list.isEmpty
              ? Container(
                  margin: EdgeInsets.only(top: 206),
                  padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                  child: Center(
                    child: Text(
                      'Không tìm thấy dược liệu nào phù hợp với từ khóa',
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
                  margin: EdgeInsets.only(top: 206),
                  padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                  child: SingleChildScrollView(
                    child: Column(
                      children: list
                          .map(
                            (e) => ItemMedicineWidget(
                              medicineModel: e,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
          Container(
            height: 50,
            margin: EdgeInsets.only(top: 156),
            padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
            child: TextField(
              controller: textEditingController,
              onChanged: (value) {
                runFilter(value);
                setState(() {
                  list = result;
                });
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
                    setState(() {
                      list = listMedicine;
                    });
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
