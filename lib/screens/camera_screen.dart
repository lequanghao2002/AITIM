import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lookup_app/core/constants/color_constants.dart';
import 'package:tflite/tflite.dart';

import '../core/constants/dimension_contants.dart';

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

  // List<MedicineModel> list = [];
  // late MedicineModel medicineModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    Tflite.close();
    String res;
    res = (await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      //useGpuDelegate: true,
    ))!;
    // ignore: avoid_print
    print("Models loading status: $res");
  }

  Future imageClassification(File image) async {
    var recongitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,

      // path: image.path,
      // numResults: 2,
      // threshold: 0.2,
      // imageMean: 0.0,
      // imageStd: 255.0,
    );

    setState(() {
      _results = recongitions!;
      _image = image;
      imageSelect = true;
    });
  }

  // @override
  // void setState(VoidCallback fn) {
  //   // TODO: implement setState
  //   super.setState(fn);
  //   medicineModel = list.where((element) => element.tenVietNam
  //           .toLowerCase()
  //           .contains(_results[0]['label'].toString().toLowerCase()))
  //       as MedicineModel;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(top: 100),
            children: [
              (imageSelect)
                  ? Container(
                      margin: const EdgeInsets.all(15),
                      child: Image.file(_image),
                    )
                  : Container(),
              SingleChildScrollView(
                child: Column(children: [
                  (imageSelect)
                      ? Container(
                          margin: EdgeInsets.all(10),
                          child: Column(children: [
                            // Text(
                            //   "${_results[0]['confidence'].toStringAsFixed(3)}",
                            //   style: const TextStyle(
                            //       color: Colors.black, fontSize: 24),
                            // ),
                            _results[0]['confidence'] < 0.9
                                ? Text(
                                    'Không nhận diện được',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 24),
                                  )
                                : Column(
                                    children: [
                                      Text(
                                        "${_results[0]['label']}",
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 24),
                                      ),
                                      if (_results[0]['label'].toString() ==
                                          'Thiên niên kiện')
                                        Column(children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Homalomena aromatica',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 30,
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
                                              'Thân rễ bò dài, mập (đường kính khoảng 1 - 2cm), màu xanh, có mùi thơm, khi bẻ ngang thấy có các xơ như kim.',
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
                                              'Thân rễ già, rửa sạch, làm sạch vỏ, bỏ các rễ con rồi đem phơi hoặc sấy khô. ',
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
                                              'Vị cay, đắng, tính ấm, mùi thơm',
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
                                              'Điều trị bệnh thấp khớp, giúp mạnh gân hoạt cốt, giảm đau nhức xương khớp; thống kinh.',
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
                                              'Ngày 6 - 12g, dưới dạng thuốc sắc, ngâm rượu thuốc hoặc dạng bột phối hợp với nhiều vị thuốc khác',
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
                                              'Không nên dùng dược liệu này đối với người âm hư nội nhiệt, táo bón, nhức đầu.',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 120,
                                          ),
                                        ]),
                                      if (_results[0]['label'].toString() ==
                                          'Hoàng bá')
                                        Column(children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Phellodendron amurense Rupr',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 30,
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
                                              'Loại cây thân gỗ, sống lâu năm, khi trưởng thành cây cao khoảng 10 - 30 mét. Lá kép mọc đối, có hình trứng hoặc hình bầu dục, gồm có 7 - 13 lá chét dày, gốc tròn rồi thuôn nhọn dần phần đầu',
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
                                              'Những vỏ cây thu hoạch về cần cạo đi lớp đần bên ngoài, rửa sạch bằng nước để loại bỏ bụi bẩn, đất cát, tạp chất còn bám vào. Sau đó thái thành từng miếng nhỏ, đem đi phơi hoặc sấy khô rồi đem chế biến theo nhiêu cách khác nhau',
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
                                              'Vị đắng, tính hàn . Vị đắng, cay. Không độc',
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
                                              'Chữa viêm gan cấp tính, sốt, bụng trướng, đau vùng gan, tiểu tiện đỏ. Chữa tiêu hóa kém, hoàng đản do viêm đường mật',
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
                                              'Ngày 10-16g. Sắc uống ngày 1 tháng',
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
                                              'Chưa cập nhật',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 120,
                                          ),
                                        ]),
                                      if (_results[0]['label'].toString() ==
                                          'Tô mộc')
                                        Column(children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Caesalpinia sappan L.',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 30,
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
                                              'Cây cao khoảng 7-10m, thân có gai. Cành non có lông mịn, có gai ngắn và những lỗ hình chấm trắng. Lá kép lông chim, mọc so le, đầu hơi tròn, mặt trên nhẵn và có lông mịn ở mặt dưới.',
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
                                              'Người ta chặt những cây già, đẽo bỏ phần vỏ và lấy phần gỗ đỏ ở bên trong, cưa thành từng khúc và làm thành từng thanh nhỏ. Cuối cùng đem đi phơi hay sấy khô. ',
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
                                              'Vị ngọt, tính bình.',
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
                                              'Hành huyết, thông kinh lạc, hoá ứ, khu phong, có chất kháng sinh.',
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
                                              'Ngày  dùng 4 - 20g (thuốc sắc).',
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
                                              'Chưa cập nhật',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 120,
                                          ),
                                        ]),
                                      if (_results[0]['label'].toString() ==
                                          'Đỗ Trọng')
                                        Column(children: [
                                          SizedBox(
                                            height: 30,
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
                                              'Chỉ thu hái ở những cây có tuổi từ 10 năm trở lên. Thường thu hái vào tháng 4 - 5 hằng năm, dùng cưa cắt đứt xung quanh vỏ cây rồi tách vỏ thành những đoạn dài ngắn. Tuy nhiên chỉ bóc 1/3 vỏ để cây tiếp tục phát triển.',
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
                                              'Vỏ bóc về đem luộc nước sôi rồi trải ở chỗ bằng phẳng, lót rơm bên dưới, bên trên nén chặt làm cho vỏ phẳng, lấy rơm phủ kín xung quanh để nhựa chảy hết ra. Sau một tuần, nếu thấy vỏ có màu tím thì có thể dừng ủ, dỡ ra đem phơi, cạo thật sạch lớp vỏ bên ngoài, làm cho vỏ nhẵn bóng, cuối cùng cắt thành từng miếng.',
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
                                              'Không mùi, vị hơi đắng, nhai có bã keo',
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
                                              'Thuốc bổ can thận, cường gân cốt, chủ trị chứng đau lưng, mỏi gối,đau thần kinh tọa, động thai, liệt dương do thận hư, là thành phần không thể thiếu trong các bài thuốc chữa vô sinh, hiếm muộn.',
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
                                              'Ngày 6 - l0g, dạng thuốc sắc, bột, cao lỏng hay ngâm rượu.',
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
                                              'Không sử dụng cho người mắc chứng khó cầm máu, máu khó đông. Không dùng cho người có chứng âm hư.Phụ nữ mang thai hoặc cho con bú cần tham khảo ý kiến của bác sĩ trước khi sử dụng, vì thuốc có thể truyền qua đường cho con bú.',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 120,
                                          ),
                                        ]),
                                      if (_results[0]['label'].toString() ==
                                          'Hoàng Liên')
                                        Column(children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Coptis chinensis Franch',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 30,
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
                                              'Thuộc loài cây thân thảo, sống nhiều năm, thân cao chừng 15 - 35cm. Lá cây mọc so le, mọc từ thân rễ lên, có cuống dài khoảng từ 6 - 12cm. Mỗi phiến lá có 3 - 5 lá chét, chia thành nhiều thùy xẻ sâu, mép lá có hình răng cưa, màu xanh mướt.',
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
                                              'Cách 1: Phơi để nguyên củ. Mang dược liệu phơi khô trong bóng mát chừng 1 - 2 tháng đến khi khô hoàn toàn. Cách 2: Cắt dược liệu thành những lát mỏng rồi phơi trong bóng mát cho khô để bảo quản dùng dần.',
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
                                              'Vị đắng, tính hàn, vào 5 kinh: tâm, can, đởm, vị và đại trường',
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
                                              'Tác dụng tả hỏa, táo thấp, giải độc,chữa sốt, tả lỵ, tâm phiền, nôn ra máu, tiêu khát, đau mắt đỏ, loét miệng, ngộ độc do ba đậu, khinh phấn. Bệnh nhân huyết ít, khí hư, tỳ vị hư nhược, trẻ con lên đậu,đi tả cấm dùng.',
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
                                              'Ngày dùng 2-12g, thuốc sắc hoặc cao lỏng.',
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
                                              'Chưa cập nhật',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 120,
                                          ),
                                        ]),
                                      if (_results[0]['label'].toString() ==
                                          'Câu Đằng')
                                        Column(children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Ramulus cum Unco Uncariae',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 30,
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
                                              'Thân vuông, màu nâu sẫm, được cắt đoạn 2-3cm đường kính 2-5mm',
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
                                              'Lấy các dây Câu Đằng bánh tẻ, chặt lấy đoạn có móc câu theo kích thước quy định, đem phơi nắng hoặc sấy đến khô',
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
                                              'Cam, lương. Vào hai kinh can, tâm bào',
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
                                              'Bình can, tức phong,trần kinh',
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
                                              'Ngày dùng từ 12g đến 16g, dạng thuốc sắc. Thời gian sắc thuốc không quá 10 min',
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
                                              'Chưa cập nhật',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 120,
                                          ),
                                        ]),
                                    ],
                                  )
                          ]))
                      : Container()
                ]),
              ),
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
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
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
    // ignore: no_leading_underscores_for_local_identifiers
    final ImagePicker _picker = ImagePicker();
    final XFile? pickFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    // ignore: unused_local_variable
    File image = File(pickFile!.path);
    imageClassification(image);
  }

  Future pickImageFromGallery() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final ImagePicker _picker = ImagePicker();
    final XFile? pickFile =
        await _picker.pickImage(source: ImageSource.gallery);
    // ignore: unused_local_variable
    File image = File(pickFile!.path);
    imageClassification(image);
  }
}
