import '../models/medicine_model.dart';

final List<MedicineModel> listMedicine = [
  MedicineModel(
    id: 1,
    hinhAnh: 'assets/images/bakich.png',
    tenVietNam: 'Ba Kích',
    tenKhoaHoc: 'Radix Morindae offcinalis',
    // ho: ,
    moTa: 'Rễ, hình trụ tròn dài 3cm trở lên',
    cheBien:
        'Có thể đào lấy rễ quanh năm. Rễ được rửa sạch đất cát, loại bỏ rễ con, phơi khô tới khi không dính tay ',
    tinhVi: 'Cam, tân, vi ôn. Vào kinh thận',
    congNang: 'Bổ thận dương, mạnh gân xương',
    cachDung: 'Ngày dùng từ 3g đến 9g. Dạng sắc uống',
    kiengKi: 'Âm hư hỏa vượng, táo bón không nên dùng',
  ),
  MedicineModel(
    id: 2,
    hinhAnh: 'assets/images/bachbo.jpg',
    tenVietNam: 'Bách bộ ',
    tenKhoaHoc: 'Stemonatuberosa Lour',
    // ho: ,
    moTa: 'Rễ củ hình trụ cong queo, dài 10cm đến 20cm',
    cheBien:
        'Đào lấy rễ củ lúc trời khô ráo, rửa sạch đất cát, cắt bỏ rễ ở hai đầu ',
    tinhVi: 'Cam, khồ, vi ôn.Vào kinh phế',
    congNang: 'Ôn phế, nhuận phế, trị ho, sát trùng',
    cachDung: 'Ngày dùng từ 8g đến 12g. Dạng sắc uống, cao, viên hoặc bột',
    kiengKi: 'Tỳ vị hư hàn không dùng',
  ),
  MedicineModel(
    id: 3,
    hinhAnh: 'assets/images/bachchi.jpg',
    tenVietNam: 'Bạch chỉ ',
    tenKhoaHoc: 'Angelica dahurica',
    // ho: ,
    moTa: 'Rễ hình chùy, dài từ 10cm - 20 cm',
    cheBien:
        'Thu hoạch vào mùa hạ, thu.Khi trời ráo, đào lấy rễ cù. Rửa nhanh, cắt bỏ rễ con, phơi nắng  ',
    tinhVi: 'Tân ôn. Vào các kinh vị, đại trường, phế',
    congNang: 'Giải biểu, khu phong, hoạt huyết tống mủ ra, sinh cơ chi đau ',
    cachDung: 'Ngày dùng 3g - 9g, dạng thuốc sắc hoặc tán bột.',
    kiengKi: 'Âm hư hỏa vượng, nhiệt thịnh không nên dùng',
  ),
  MedicineModel(
    id: 4,
    hinhAnh: 'assets/images/bachthuoc.jpg',
    tenVietNam: 'Bạch thược',
    tenKhoaHoc: 'Paeonia lactiflora Pall',
    // ho: ,
    moTa: 'Rễ hình trụ tròn,thẳng hoặc đôi khi hơi uốn cong, hai đầu phẳng',
    cheBien:
        'Đào lấy rễ, rửa sạch đất cát, cắt bỏ đầu đuôi và rễ con, cạo sạch ở ngoài sau đó luộc chín phơi khô',
    tinhVi: 'Khô, toan, vi hàn. Vào các kinh tỳ, can, phế',
    congNang: 'Bổ huyết, dưỡng ẩm,thư cân, bình can, chi thống',
    cachDung: 'Ngày dùng từ 8g đến 12g Dạng sắc uống, cao, viên hoặc bột',
    kiengKi: 'Đầy bụng không nên dùng. Không dùng cùng Lê lô',
  ),
  MedicineModel(
      id: 5,
      hinhAnh: 'assets/images/CamThao.jpg',
      tenVietNam: 'Cam thảo nam',
      tenKhoaHoc: 'Herba et Radix Scopariae',
      // ho: ,
      moTa: 'Phần trên mặt đất cao khoảng 0,4m đến 0,7m ',
      cheBien:
          'Thu hái vào mùa xuân và mùa hạ, đào cả rễ, rửa sạch, phơi hay sấy khô',
      tinhVi: 'Cam, vi khổ, hàn. Vào kinh tỳ, phế, can',
      congNang: 'Bổ tỳ, sinh tân nhuận phế, thanh nhiệt, giải độc, lợi niệu.',
      cachDung:
          'Dùng tươi : ngày dùng 20 g đến 40g, dạng dịch ép. Dùng khô : ngày dùng từ 8g đến 12g. Dạng thuốc hãm hoặc thuốc sắc',
      kiengKi: 'Đầy bụng không nên dùng. Không dùng cùng Lê lô'),
  MedicineModel(
    id: 6,
    hinhAnh: 'assets/images/CanKhuong.jpg',
    tenVietNam: 'Can khương ( gừng khô)',
    tenKhoaHoc: 'Zingiber officinale',
    ho: 'Thân Rễ',
    moTa:
        'Cây cao khoảng 1m. Thân rễ mọc phình lên thành củ, khi già thì có xơ. Lá hình mũi mác, dài tới 20cm',
    cheBien:
        'Có dạng ngón tay phẳng dẹt, phân nhánh, có đốt rõ ràng. Vỏ ngoài màu xám trắng hoặc xám vàng. Đỉnh có vết rễ và vết mầm. Chất cứng giòn, mặt cắt có chất xơ.',
    tinhVi: 'Vị cay, tính nhiệt.',
    congNang: 'Ấm trung tiêu, ấm phổi,hồi dương, trừ hàn, tiêu đàm,',
    cachDung:
        'Ngày 2-10g, sắc hoặc hoàn tán, thường phối hợp với các vị thuốc khác.',
    kiengKi:
        'Can khương vị đại cay, người âm hư có nhiệt, có thai không nên dùng.Vì cay nên tán khi tẩu huyết, uống lâu tổn hại tới phần âm, thương tổn mắt. ',
  ),
  MedicineModel(
    id: 7,
    hinhAnh: 'assets/images/caudang.JPG',
    tenVietNam: 'Câu đằng',
    tenKhoaHoc: 'Ramulus cum Unco Uncariae',
    ho: 'Thân',
    moTa: 'Thân vuông, màu nâu sẫm, được cắt đoạn 2-3cm đường kính 2-5mm',
    cheBien:
        'Lấy các dây Câu Đằng bánh tẻ, chặt lấy đoạn có móc câu theo kích thước quy định, đem phơi nắng hoặc sấy đến khô',
    tinhVi: 'Cam, lương. Vào hai kinh can, tâm bào',
    congNang: 'Bình can, tức phong,trần kinh ',
    cachDung:
        'Ngày dùng từ 12g đến 16g, dạng thuốc sắc. Thời gian sắc thuốc không quá 10 min',
    //kiengKi:
  ),
  MedicineModel(
    id: 8,
    hinhAnh: 'assets/images/CatCanh.jpg',
    tenVietNam: 'Cát cánh',
    tenKhoaHoc: 'Radix Platycodi grandiflori',
    ho: 'Rễ',
    moTa: "Rễ hình trụ thuôn dần về phía dưới hoặc có dạng hình trụ nhỏ và dài",
    cheBien:
        'Thu hoạch vào mùa thu đông hoặc mùa xuân. Đào lấy rễ, cắt bỏ đầu rễ và rễ co, rửa sạch, để ráo nước hoặc ủ khoảng 12h, thái lát mỏng phơi hoặc sấy khô',
    tinhVi: 'Khô, tân, hơi ôn. Vào kinh phổ',
    congNang: 'Ôn hóa hàn đàm, trừ mủ, lợi hầu họng. ',
    cachDung: 'Ngày dùng từ 3g đến 9g. Dạng thuốc sắc',
    kiengKi:
        'Can khương vị đại cay, người âm hư có nhiệt, có thai không nên dùng.Vì cay nên tán khi tẩu huyết, uống lâu tổn hại tới phần âm, thương tổn mắt. ',
  ),
  MedicineModel(
    id: 9,
    hinhAnh: 'assets/images/chitu.jpg',
    tenVietNam: 'Chi tử',
    tenKhoaHoc: 'Fructus Gardeniae',
    // ho: ,
    moTa:
        'Quả Chi tử khô hình trứng hoặc bầu dục. Vỏ ngoài màu vàng đỏ hoặc nâu hơi bóng mượt, có nhiều gân nhỏ. Chất cứng mỏng. Trong có hai buồng gồm nhiều hạt hình tròn trứng, dẹt, phẳng, vỏ hạt màu đỏ vàng, ngoài có vật chặt dính đã khô, giữa chúng liên kết thành khối hơi có mùi thơm đặc biệt.',
    cheBien:
        'Vào sau tiết Hàn lộ hàng năm, lúc này vỏ quả ngả dần thành màu vàng lá có thể hái được. Hái quả sớm hay quá muộn đều có thể ảnh hưởng tới phẩm chất.',
    tinhVi: 'Vị đắng, tính hàn',
    congNang: 'Thanh nhiệt, lợi thấp, lương huyết',
    cachDung:
        'Ngày 5 - 10g, dạng thuốc sắc dùng phối hợp với các vị thuốc khác',
    kiengKi: 'Không dùng đối với chứng tiêu lỏng hư hàn.',
  ),
  MedicineModel(
    id: 10,
    hinhAnh: 'assets/images/cuchoa.JPG',
    tenVietNam: 'Cúc hoa',
    tenKhoaHoc: 'Flos Chrysanthemi',
    // ho: ,
    moTa: """Cụm hoa hình đầu, màu vàng hơi nâu, đôi khi còn đính cuống; 
đường kính 0,5 – 1,2 cm. Tổng bao gồm 4 – 5 hàng lá bắc, mặt ngoài màu xanh hơi xám hoặc nâu nhạt, ở giữa hai bên mép rất nhạt và khô xác. Có 2 loại hoa: Hoa hình lưỡi nhỏ một vòng, đơn tính, không đều ở phía ngoài; nhiều hoa hình ống, đều, mẫu năm, lưỡng tính ở phía trong. Chất nhẹ, mùi thơm, vị đắng.""",
    cheBien:
        'Lúc hoa mới chớm nở, hái về, phơi nắng nhẹ hoặc phơi trong râm, dùng tươi tốt hơn.Muốn để được lâu thì xông hơi Lưu hoàng 2-3 giờ, thấy hoa chín mềm là được, rồi đem nén độ một đêm, thấy nước đen chảy ra, phơi khô cất dùng.',
    tinhVi: 'Vị ngọt, đắng, tính bình, hơi hàn',
    congNang:
        'Tác dụng kháng khuẩn. Điều trị huyết áp cao. Bạch cúc hoa có tác dụng ức chế phần nào các loại nấm ngoài da',
    cachDung: 'Ngày 9 - 15g dưới dạng thuốc sắc',
    kiengKi: 'Không dùng đối với chứng tiêu lỏng hư hàn.',
  ),
  MedicineModel(
    id: 11,
    hinhAnh: 'assets/images/dotrong.JPG',
    tenVietNam: 'Đỗ Trọng',
    //tenKhoaHoc: ,
    moTa:
        'Chỉ thu hái ở những cây có tuổi từ 10 năm trở lên. Thường thu hái vào tháng 4 - 5 hằng năm, dùng cưa cắt đứt xung quanh vỏ cây rồi tách vỏ thành những đoạn dài ngắn. Tuy nhiên chỉ bóc 1/3 vỏ để cây tiếp tục phát triển.',
    cheBien:
        'Vỏ bóc về đem luộc nước sôi rồi trải ở chỗ bằng phẳng, lót rơm bên dưới, bên trên nén chặt làm cho vỏ phẳng, lấy rơm phủ kín xung quanh để nhựa chảy hết ra. Sau một tuần, nếu thấy vỏ có màu tím thì có thể dừng ủ, dỡ ra đem phơi, cạo thật sạch lớp vỏ bên ngoài, làm cho vỏ nhẵn bóng, cuối cùng cắt thành từng miếng.',
    tinhVi: 'Không mùi, vị hơi đắng, nhai có bã keo',
    congNang:
        'Thuốc bổ can thận, cường gân cốt, chủ trị chứng đau lưng, mỏi gối,đau thần kinh tọa, động thai, liệt dương do thận hư, là thành phần không thể thiếu trong các bài thuốc chữa vô sinh, hiếm muộn.',
    cachDung: 'Ngày 6 - l0g, dạng thuốc sắc, bột, cao lỏng hay ngâm rượu.',
    kiengKi:
        'Không sử dụng cho người mắc chứng khó cầm máu, máu khó đông. Không dùng cho người có chứng âm hư.Phụ nữ mang thai hoặc cho con bú cần tham khảo ý kiến của bác sĩ trước khi sử dụng, vì thuốc có thể truyền qua đường cho con bú.',
  ),
  MedicineModel(
    id: 12,
    hinhAnh: 'assets/images/hoaison.JPG',
    tenVietNam: 'Hoài Sơn',
    tenKhoaHoc: 'Dioscorea persimilis Prain et Burk',
    // ho: ,
    moTa:
        'Hình trụ hơi dẹt, thuôn dần về phía đầu như hình quả bầu, dài chừng 30 - 50cm (có thể đến 1m), ăn sâu xuống đất',
    cheBien:
        'Chọn củ to trắng, rửa sạch rồi đồ hoặc ủ cho mềm, thái lát hoặc bào mỏng, sấy khô để dùng (dùng sống). Nếu dùng chín, đem sao nhỏ lửa cho đến khi dược liệu có màu vàng đều.',
    tinhVi: 'Vị ngọt, tính bình, quy vào các kinh phế, tỳ vị và thận',
    congNang:
        'Chữa tỳ vị hư nhược, ăn ít, tiểu nhiều, tiêu chảy lâu ngày không khỏi',
    cachDung: ' Ngày 10 - 20g, dưới dạng thuốc sắc, thuốc bột.',
    //kiengKi: '',
  ),
  MedicineModel(
    id: 13,
    hinhAnh: 'assets/images/hoangba.jpg',
    tenVietNam: 'Hoàng Bá',
    tenKhoaHoc: 'Phellodendron amurense Rupr',
    // ho: ,
    moTa:
        'Loại cây thân gỗ, sống lâu năm, khi trưởng thành cây cao khoảng 10 - 30 mét. Lá kép mọc đối, có hình trứng hoặc hình bầu dục, gồm có 7 - 13 lá chét dày, gốc tròn rồi thuôn nhọn dần phần đầu',
    cheBien:
        'Những vỏ cây thu hoạch về cần cạo đi lớp đần bên ngoài, rửa sạch bằng nước để loại bỏ bụi bẩn, đất cát, tạp chất còn bám vào. Sau đó thái thành từng miếng nhỏ, đem đi phơi hoặc sấy khô rồi đem chế biến theo nhiêu cách khác nhau',
    tinhVi: 'Vị đắng, tính hàn . Vị đắng, cay. Không độc',
    congNang:
        'Chữa viêm gan cấp tính, sốt, bụng trướng, đau vùng gan, tiểu tiện đỏ. Chữa tiêu hóa kém, hoàng đản do viêm đường mật',
    cachDung: 'Ngày 10-16g. Sắc uống ngày 1 tháng',
    //kiengKi: '',
  ),
  MedicineModel(
    id: 14,
    hinhAnh: 'assets/images/hoangdang.JPG',
    tenVietNam: 'Hoàng đằng',
    tenKhoaHoc: 'Caulis Fibraureae',
    // ho: ,
    moTa:
        'Những đoạn thân và rễ hình trụ thẳng hoặc hơi cong, dài 10 - 30 cm, đường kính 1 - 3 cm, có khi tới 10 cm. Mặt ngoài màu nâu có nhiều vân dọc và sẹo của cuống lá (đoạn thân) hay sẹo của rễ con (đoạn rễ)',
    cheBien:
        'Rễ và thân cây vào tháng 8-9, cạo sạch lớp bần bên ngoài, chặt từng đoạn, phơi khô hay sấy khô.',
    tinhVi: 'Vị đắng, tính hàn',
    congNang:
        'Làm giảm viêm, chữa viêm ruột, viêm bàng quang, viêm gan, đau mắt, mụn nhọt, sốt nóng, kiết lỵ, hồi hộp,mất ngủ. Làm nguyên liệu chiết palmatin',
    cachDung: 'Ngày 6-12g, dạng thuốc sắc.',
    kiengKi: 'Bệnh thuộc hàn không nên dùng.',
  ),
  MedicineModel(
    id: 15,
    hinhAnh: 'assets/images/hoanglien.JPG',
    tenVietNam: 'Hoàng liên',
    tenKhoaHoc: 'Coptis chinensis Franch',
    // ho: ,
    moTa:
        'Thuộc loài cây thân thảo, sống nhiều năm, thân cao chừng 15 - 35cm. Lá cây mọc so le, mọc từ thân rễ lên, có cuống dài khoảng từ 6 - 12cm. Mỗi phiến lá có 3 - 5 lá chét, chia thành nhiều thùy xẻ sâu, mép lá có hình răng cưa, màu xanh mướt.',
    cheBien:
        'Cách 1: Phơi để nguyên củ. Mang dược liệu phơi khô trong bóng mát chừng 1 - 2 tháng đến khi khô hoàn toàn. Cách 2: Cắt dược liệu thành những lát mỏng rồi phơi trong bóng mát cho khô để bảo quản dùng dần.',
    tinhVi: 'Vị đắng, tính hàn, vào 5 kinh: tâm, can, đởm, vị và đại trường',
    congNang:
        'Tác dụng tả hỏa, táo thấp, giải độc,chữa sốt, tả lỵ, tâm phiền, nôn ra máu, tiêu khát, đau mắt đỏ, loét miệng, ngộ độc do ba đậu, khinh phấn. Bệnh nhân huyết ít, khí hư, tỳ vị hư nhược, trẻ con lên đậu,đi tả cấm dùng.',
    cachDung: 'Ngày dùng 2-12g, thuốc sắc hoặc cao lỏng.',
    //kiengKi: '',
  ),
  MedicineModel(
    id: 16,
    hinhAnh: 'assets/images/lactien.JPG',
    tenVietNam: 'Lạc tiên',
    tenKhoaHoc: 'Passiflora foetida L.',
    // ho: ,
    moTa:
        'Loại dây leo bằng tua cuốn. Thân mềm tròn và rỗng, có lông thưa. Lá mọc so le, chia 3 thùy, thùy giữa lớn hơn hai thùy bên, mép uốn lượn có lông mịn. Hoa to, đều, lưỡng tính có 5 cánh, màu trắng hoặc hơi tím.',
    cheBien:
        ' Thu hái các bộ phận trên mặt đất, rửa sạch, phơi khô, cắt đoạn 3-5 cm. Trước khi dùng sao hơi vàng cho thơm',
    tinhVi: 'Cam, vi khổ, lương. Vào các kinh tâm can.',
    congNang: 'Tác dụng an thần, gây ngủ',
    cachDung:
        'Ngày 20g - 40g, dạng thuốc sắc, cao lỏng, siro, rượu thuốc, nên uống trước khi đi ngủ.',
    //kiengKi: '',
  ),
  MedicineModel(
    id: 17,
    hinhAnh: 'assets/images/thachxuongbo.JPG',
    tenVietNam: 'Thạch xương bồ',
    tenKhoaHoc: 'Rhizoma Acori graminei',
    // ho: ,
    moTa:
        'Chiều cao trung bình khoảng 0.5m, thân rễ phân nhánh, mọc ngang, dài 5 - 30cm, gồm nhiều đốt.',
    cheBien:
        'Thu hoạch phần thân rễ ưu tiên chọn loại to, cứng chắc rồi rửa sạch tạp chất, xếp lên giàn. Tiếp theo, đốt lửa cho cháy hết rễ con và để giảm bớt độ ẩm. Sau đó, cắt thành đoạn ngắn khoảng 8 - 15cm, đem  phơi nắng hoặc sấy khô ở 50 - 60 độ C.',
    tinhVi: 'Cay, đắng, tính ấm, mùi thơm đặc trưng, quy kinh Tâm, Can, Đởm',
    congNang:
        'Khai khiếu, hóa đờm, thông khí, lợi tiêu hóa, sát trùng, tán phong hàn, trừ thấp, mạnh tâm thần',
    cachDung:
        'Ngày 3 - 8g, dưới dạng thuốc sắc. Dạng bột nên dùng liều 0,5 - 2g/ngày.',
    kiengKi:
        'Đối tượng hoạt tinh, ra nhiều mồ hôi trong ngày hoặc người đang điều trị bệnh lý đặc biệt.',
  ),
  MedicineModel(
    id: 18,
    hinhAnh: 'assets/images/ThienNienKien.JPG',
    tenVietNam: 'Thiên niên kiện',
    tenKhoaHoc: 'Homalomena aromatica',
    // ho: ,
    moTa:
        'Thân rễ bò dài, mập (đường kính khoảng 1 - 2cm), màu xanh, có mùi thơm, khi bẻ ngang thấy có các xơ như kim.',
    cheBien:
        'Thân rễ già, rửa sạch, làm sạch vỏ, bỏ các rễ con rồi đem phơi hoặc sấy khô. ',
    tinhVi: 'Vị cay, đắng, tính ấm, mùi thơm',
    congNang:
        'Điều trị bệnh thấp khớp, giúp mạnh gân hoạt cốt, giảm đau nhức xương khớp; thống kinh.',
    cachDung:
        'Ngày 6 - 12g, dưới dạng thuốc sắc, ngâm rượu thuốc hoặc dạng bột phối hợp với nhiều vị thuốc khác',
    kiengKi:
        'Không nên dùng dược liệu này đối với người âm hư nội nhiệt, táo bón, nhức đầu.',
  ),
  MedicineModel(
    id: 19,
    hinhAnh: 'assets/images/ToMoc.JPG',
    tenVietNam: 'Tô mộc',
    tenKhoaHoc: 'Caesalpinia sappan L.',
    // ho: ,
    moTa:
        'Cây cao khoảng 7-10m, thân có gai. Cành non có lông mịn, có gai ngắn và những lỗ hình chấm trắng. Lá kép lông chim, mọc so le, đầu hơi tròn, mặt trên nhẵn và có lông mịn ở mặt dưới.',
    cheBien:
        'Người ta chặt những cây già, đẽo bỏ phần vỏ và lấy phần gỗ đỏ ở bên trong, cưa thành từng khúc và làm thành từng thanh nhỏ. Cuối cùng đem đi phơi hay sấy khô. ',
    tinhVi: 'Vị ngọt, tính bình.',
    congNang:
        'Hành huyết, thông kinh lạc, hoá ứ, khu phong, có chất kháng sinh.',
    cachDung: 'Ngày  dùng 4 - 20g (thuốc sắc).',
    //kiengKi:,
  ),
  MedicineModel(
    id: 20,
    hinhAnh: 'assets/images/CauKyTu.jpg',
    tenVietNam: 'Câu kỷ tử',
    tenKhoaHoc: 'Fructus Lycii',
    // ho: ,
    moTa:
        "Quả hình trứng dài hay trái xoan, hai đầu hơi lõm, dài 6 mm đến 20 mm, đường kính 3 mm đến 10 mm",
    cheBien:
        'Thu hoạch vào mùa hè và mùa thu khi quả đã chuyển màu đỏ vàng. Sau khi phơi âm can để vỏ ngoài nhăn lại, lấy ra phơi nắng hoặc sấy nhẹ đến khi vỏ ngoài quả khô và cứng, thịt quả mềm. Loại bỏ cuống.',
    tinhVi: 'Cam, binh. Quy vào các kinh phế, can, thận.',
    congNang: 'Tư bổ can, thận, ích tinh, sáng mắt.',
    cachDung: 'Ngày dùng từ 6 g đến 12 g, dạng thuốc sắc, ngâm rượu, hoàn tán.',
    kiengKi: 'Tỳ vị hư yếu, đại tiện sống phân hoặc phân lỏng không nên dùng.',
  ),
  MedicineModel(
    id: 21,
    hinhAnh: 'assets/images/CamThao.jpg',
    tenVietNam: 'Cam thảo ',
    tenKhoaHoc: 'Glycyrrhiza uralensis',
    // ho: ,
    moTa: """Đoạn rễ hình trụ, thẳng hay hơi  cong queo, thường
        dài 20 cm đến 100 cm, đường kính  0,6 cm đến 3,5 cm.
        """,
    cheBien:
        """Sau khi đào lấy rễ, xếp thành đống để cho hơi lên men làm cho rễ có
          màu vàng sẫm hơn, phơi hoặc sấy khô.""",
    tinhVi: """"Cam, bình. Vào các kinh tâm, phế,
              tỳ, vị và thông 12 kinh.""",
    congNang: """"Kiện tỳ ích khí, nhuận phế chỉ ho, 
          giải độc, chi thống, điều hòa tác dụng các thuốc.""",
    cachDung: 'Ngày dùng từ 4 g đển 12 g, dạng thuốc sắc hoặc bột.',
    kiengKi:
        'Không dùng chung với các vị Đại kích, Nguyên hoa, Hải tảo, Cam toại',
  ),
  MedicineModel(
    id: 22,
    hinhAnh: 'assets/images/DuaCan.jpg',
    tenVietNam: 'Dừa Cạn',
    tenKhoaHoc: 'Radix Catharanthi rosei',
    // ho: ,
    moTa:
        "Rễ cong queo hoặc thảng, dài 10 cm đến 20 cm, đường kính 1 cm đến 2 cm, phía trên có đoạn gốc thân dài 3 cm đến 5 cm, phía dưới có nhiều rễ con nhỏ",
    cheBien: 'Thu lấy rễ, rừa sạch đất cát, phơi hoặc sấy ờ 50 °c tới khô.',
    tinhVi: 'Vi khổ, lương, có độc. Vào các kinh can, tâm, thận.',
    congNang: 'Hoạt huyết, hạ huyết áp, giải độc, an thần.',
    cachDung: 'Ngày dùng từ 8 g đến 12 g. Dạng thuốc sắc hoặc hãm.',
    kiengKi: 'Có thai không dùng.',
  ),
  MedicineModel(
    id: 23,
    hinhAnh: 'assets/images/DaiHoi.jpg',
    tenVietNam: 'Đại hồi',
    tenKhoaHoc: 'Fructus Illicii veri',
    // ho: ,
    moTa:
        "Quả phức, thường gồm 8 đại, đôi khi nhiều đại hơn, màu nâu đỏ đến nâu sẫm, xếp thành hình sao xung quanh một trụ trung tâm. Mỗi đại hình lòng thuyền, dài 1 cm đến 2 cm, rộng 0,5 cm, cao 0,7 cm đến 1 cm",
    cheBien:
        "Quả phức, thường gồm 8 đại, đôi khi nhiều đại hơn, màu nâu đỏ đến nâu sẫm, xếp thành hình sao xung quanh một trụ trung tâm. Mỗi đại hình lòng thuyền, dài 1 cm đến 2 cm, rộng 0,5 cm, cao 0,7 cm đến 1 cm",
    tinhVi: 'Tân, cam, ôn. Vào các kinh can, thận, tỳ vị.',
    congNang: 'Ôn dương, tán hàn, kiện tỳ, tiêu thực, lý khí, chi thông.',
    cachDung:
        'Ngày dùng từ 3 g đến 6 g dạng thuốc sắc, ngâm rượu dừng xoa bóp.',
    kiengKi: 'Âm hư hòa vượng không dùng.',
  ),
  MedicineModel(
    id: 24,
    hinhAnh: 'assets/images/DanSam.jpg',
    tenVietNam: 'Đan Sâm',
    tenKhoaHoc: 'Salvia miltiorrhiza Bunge',
    // ho: ,
    moTa:
        "Thân rễ ngắn, cứng chắc, đôi khi còn sót lại gốc của thân ờ đình. Rễ hình trụ dài, hơi cong, có khi phân nhánh và có rễ con dài 10 cm đến 20 cm, đường kính 0,3 cm đến 1 cm",
    cheBien:
        "Mùa xuân hay mùa thu, đào lấy rễ và thân rễ, rửa sạch, cẳt bỏ rễ con và thân còn sót lại, phơi hoặc sấy khô.",
    tinhVi: 'Khô, ví hàn. Vào các kinh tâm, can',
    congNang: 'Hoạt huyết, thông kinh, giảm đau, thanh tâm lương huyết',
    cachDung: 'Ngày dùng từ 9 g đển 15 g, dạng thuốc sắc.',
    kiengKi: 'Không dùng chung với Lê lô.',
  ),
  MedicineModel(
    id: 25,
    hinhAnh: 'assets/images/DangSam.jpg',
    tenVietNam: 'Đảng Sâm',
    tenKhoaHoc: 'Radix Codonopsis javanicae',
    // ho: ,
    moTa:
        "Rễ nạc hình trụ có khi phân nhánh, đường kính 0,3 cm đến 1,5 cm, dài 6 cm đến 15 cm",
    cheBien:
        "Mùa thu đông, đào lẩy rễ củ, rửa sạch, phơi hoặc sấy nhẹ đến khô.",
    tinhVi: 'Cam, bình (hơi ôn). Vào kinh phế, tỳ.',
    congNang: 'Bổ tỳ, ích khi, sinh tân chỉ khát.',
    cachDung:
        'Ngày dùng từ 20 g đến 40 g, dạng thuốc sắc, thuốc hoàn, bột, ngâm rượu. Thường phối hợp với các vị thuốc khác.',
    //kiengKi: '',
  ),
  MedicineModel(
    id: 26,
    hinhAnh: 'assets/images/DiaLien.jpg',
    tenVietNam: 'Địa liền',
    tenKhoaHoc: 'Kaempferia galanga L',
    // ho: ,
    moTa:
        "Phiến dày khoảng 2 mm đèn 5 mm, đường kính 0.6 cm trở lên, hơi cong lên. Mặt cắt màu trắng ngà có khi hơi ngà vàng",
    cheBien:
        "Đào lấy thân rễ, rửa sạch, thái phiến mỏng, phơi khô. Khi dùng vi sao.",
    tinhVi: 'Tân, ôn. Vào hai kinh tỳ, vị.',
    congNang: 'Hành khí, ôn trung, tiêu thực, chi thống.',
    cachDung: 'Ngày dùng từ 6 g đến 9 g, dạng thuốc sắc. bột hoặc viên',
    kiengKi: 'âm hư, thiếu máu hoặc vị có hỏa uất không dùng.',
  ),
];
