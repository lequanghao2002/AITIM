class MedicineModel {
  MedicineModel({
    this.yeuThich = false,
    required this.hinhAnh,
    this.tenVietNam = 'Chưa cập nhật',
    this.tenKhoaHoc = 'Chưa cập nhật',
    this.moTa = 'Chưa cập nhật',
    this.cheBien = 'Chưa cập nhật',
    this.tinhVi = 'Chưa cập nhật',
    this.congNang = 'Chưa cập nhật',
    this.cachDung = 'Chưa cập nhật',
    this.kiengKi = 'Chưa cập nhật',
  });

  bool yeuThich;
  final String hinhAnh;
  final String tenVietNam;
  final String tenKhoaHoc;
  final String moTa;
  final String cheBien;
  final String tinhVi;
  final String congNang;
  final String cachDung;
  final String kiengKi;
}
