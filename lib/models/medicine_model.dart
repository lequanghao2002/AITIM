class MedicineModel {
  final int id;
  late final int yeuThich;
  final String hinhAnh;
  final String tenVietNam;
  final String tenKhoaHoc;
  final String ho;
  final String moTa;
  final String cheBien;
  final String tinhVi;
  final String congNang;
  final String cachDung;
  final String kiengKi;

  MedicineModel({
    required this.id,
    this.yeuThich = 0,
    required this.hinhAnh,
    this.tenVietNam = 'Chưa cập nhật',
    this.tenKhoaHoc = 'Chưa cập nhật',
    this.ho = 'Chưa cập nhật',
    this.moTa = 'Chưa cập nhật',
    this.cheBien = 'Chưa cập nhật',
    this.tinhVi = 'Chưa cập nhật',
    this.congNang = 'Chưa cập nhật',
    this.cachDung = 'Chưa cập nhật',
    this.kiengKi = 'Chưa cập nhật',
  });
}
