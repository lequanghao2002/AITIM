// ignore_for_file: unnecessary_string_interpolations

import 'dart:io';

import 'package:lookup_app/models/medicine_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../data/medicine_data.dart';

class MedicineDatabase {
  MedicineDatabase._privateConstructor();
  static final MedicineDatabase instance =
      MedicineDatabase._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'medicine.db');

    return await openDatabase(
      path,
      version: 3,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onCreate(Database db, int version) async {
    print('Create');

    await db.execute('''
      CREATE TABLE Medicines(
        Id INTEGER PRIMARY KEY,
        YeuThich INTEGER,
        HinhAnh TEXT,
        TenVietNam TEXT,
        TenKhoaHoc TEXT,
        Ho TEXT,
        MoTa TEXT,
        CheBien TEXT,
        TinhVi TEXT,
        CongNang TEXT,
        CachDung TEXT,
        KiengKi TEXT
      )
    ''');

    // final List<MedicineModel> listMedicineData = medicineData;

    // listMedicineData.forEach((m) async {
    //   await db.insert('Medicines', {
    //     'Id': '${m.id}',
    //     'YeuThich': '${m.yeuThich}',
    //     'HinhAnh': '${m.hinhAnh}',
    //     'TenVietNam': '${m.tenVietNam}',
    //     'TenKhoaHoc': '${m.tenKhoaHoc}',
    //     'Ho': '${m.ho}',
    //     'MoTa': '${m.moTa}',
    //     'CheBien': '${m.cheBien}',
    //     'TinhVi': '${m.tinhVi}',
    //     'CongNang': '${m.congNang}',
    //     'CachDung': '${m.cachDung}',
    //     'KiengKi': '${m.kiengKi}',
    //   });
    // });
  }

  Future _onUpgrade(Database db, int version, int versionNew) async {
    print('Update');

    final List<MedicineModel> listMedicineData = medicineData;

    listMedicineData.forEach((m) async {
      await db.insert('Medicines', {
        'Id': '${m.id}',
        'YeuThich': '${m.yeuThich}',
        'HinhAnh': '${m.hinhAnh}',
        'TenVietNam': '${m.tenVietNam}',
        'TenKhoaHoc': '${m.tenKhoaHoc}',
        'Ho': '${m.ho}',
        'MoTa': '${m.moTa}',
        'CheBien': '${m.cheBien}',
        'TinhVi': '${m.tinhVi}',
        'CongNang': '${m.congNang}',
        'CachDung': '${m.cachDung}',
        'KiengKi': '${m.kiengKi}',
      });
    });
  }

  Future<List<MedicineModel>> getListMedicines() async {
    print('Get list medicines');

    MedicineDatabase.instance._initDatabase();

    Database db = await instance.database;

    var medicines = await db.query('Medicines', orderBy: 'Id');
    List<MedicineModel> listMedicines = medicines.isNotEmpty
        ? medicines.map((c) => MedicineModel.fromMap(c)).toList()
        : [];

    return listMedicines;
  }

  Future<List<MedicineModel>> getListMedicinesByLove() async {
    print('Get list medicines by love');

    MedicineDatabase.instance._initDatabase();

    Database db = await instance.database;

    var medicines =
        await db.query('Medicines', orderBy: 'Id', where: 'YeuThich = 1');
    List<MedicineModel> listMedicines = medicines.isNotEmpty
        ? medicines.map((c) => MedicineModel.fromMap(c)).toList()
        : [];

    return listMedicines;
  }

  void updateMedicines(int id) async {
    print('update medicines ${id}');

    MedicineDatabase.instance._initDatabase();

    Database db = await instance.database;

    db.update(
      'Medicines',
      {'YeuThich': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  void updateMedicines2(int id) async {
    print('update medicines ${id}');

    MedicineDatabase.instance._initDatabase();

    Database db = await instance.database;

    db.update(
      'Medicines',
      {'YeuThich': 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
