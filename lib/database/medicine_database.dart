import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:lookup_app/models/medicine_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

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
      version: 4,
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

    String data = await rootBundle.loadString('assets/medicine_data.json');

    final json = jsonDecode(data);

    json.forEach((m) async {
      await db.insert('Medicines', {
        'Id': m['Id'],
        'YeuThich': 0,
        'HinhAnh': m['HinhAnh'],
        'TenVietNam': m['TenVietNam'],
        'TenKhoaHoc': m['TenKhoaHoc'],
        'Ho': m['Ho'],
        'MoTa': m['MoTa'],
        'CheBien': m['CheBien'],
        'TinhVi': m['TinhVi'],
        'CongNang': m['CongNang'],
        'CachDung': m['CachDung'],
        'KiengKi': m['KiengKi']
      });
    });
  }

  Future _onUpgrade(Database db, int version, int versionNew) async {
    print('Remove');
    await db.delete('Medicines');

    print('Update');

    String data = await rootBundle.loadString('assets/medicine_data.json');

    final json = jsonDecode(data);

    json.forEach((m) async {
      await db.insert('Medicines', {
        'Id': m['Id'],
        'YeuThich': 0,
        'HinhAnh': m['HinhAnh'],
        'TenVietNam': m['TenVietNam'],
        'TenKhoaHoc': m['TenKhoaHoc'],
        'Ho': m['Ho'],
        'MoTa': m['MoTa'],
        'CheBien': m['CheBien'],
        'TinhVi': m['TinhVi'],
        'CongNang': m['CongNang'],
        'CachDung': m['CachDung'],
        'KiengKi': m['KiengKi']
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
    MedicineDatabase.instance._initDatabase();

    Database db = await instance.database;

    var medicines = await db.query('Medicines',
        orderBy: 'TenVietNam', where: 'YeuThich = 1');
    List<MedicineModel> listMedicines = medicines.isNotEmpty
        ? medicines.map((c) => MedicineModel.fromMap(c)).toList()
        : [];

    return listMedicines;
  }

  void updateMedicines(int id) async {
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
    MedicineDatabase.instance._initDatabase();

    Database db = await instance.database;

    db.update(
      'Medicines',
      {'YeuThich': 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<MedicineModel> getMedicineByName(String name) async {
    MedicineDatabase.instance._initDatabase();

    Database db = await instance.database;

    var medicineByName = await db.query('Medicines',
        where: 'TenVietNam LIKE ? COLLATE NOCASE', whereArgs: ['%$name%']);

    var medicine = MedicineModel.fromMap(medicineByName.first);

    return medicine;
  }
}
