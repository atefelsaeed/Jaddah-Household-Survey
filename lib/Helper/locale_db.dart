import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initializedDB();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> initializedDB() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'zeina.db');
    Database myDB = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return myDB;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {}

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE items(
     id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
     item_id INTEGER NOT NULL,
     itemName TEXT ,
     itemImage TEXT,
     type TEXT,
     itemPrice REAL,
     quantity INTEGER)
    ''');
    log('CREATE DATABASE AND TABLE ====================================>');
  }

  Future<List<Map>> readData(String sql) async {
    Database? myDB = await db;
    List<Map> response = await myDB!.rawQuery(sql);
    return response;
  }

  Future<int> insertData(String sql) async {
    Database? myDB = await db;
    int response = await myDB!.rawInsert(sql);
    return response;
  }

  Future<int> updateData(String sql) async {
    Database? myDB = await db;
    int response = await myDB!.rawUpdate(sql);
    return response;
  }

  Future<int> deleteData(String sql) async {
    Database? myDB = await db;
    int response = await myDB!.rawDelete(sql);
    return response;
  }

  myDeleteDataBase() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'zeina.db');
    await deleteDatabase(path);
  }

//   Future<List<ItemCartModel>> getAllItems() async {
//     Database? mydb = await db;
//     var response = await mydb!.query("items");
//     List<ItemCartModel> list =
//     response.map((c) => ItemCartModel.fromMap(c)).toList();
//     return list;
//   }
//
//   //return single person with id
//   Future<ItemCartModel?> getItemWithId(int id) async {
//     Database? mydb = await db;
//     var response = await mydb!.query("items", where: "id = ?", whereArgs: [id]);
//     return response.isNotEmpty ? ItemCartModel.fromMap(response.first) : null;
//   }
//
//   addItemToDatabase(ItemCartModel person) async {
//     Database? mydb = await db;
//     var raw = await mydb!.insert(
//       "items",
//       person.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//     return raw;
//   }
//
// //delete person with id
//   deletePersonWithId(int id) async {
//     Database? mydb = await db;
//
//     var res =
//     await mydb!.delete("items", where: "item_id = ?", whereArgs: [id]);
//     return res;
//   }
//
//   updatePerson(ItemCartModel person) async {
//     Database? mydb = await db;
//     print('Item name is :: ${person.itemName}');
//     int response = await mydb!.update("items", person.toMap(),
//         where: "item_id = ?", whereArgs: [person.itemID]);
//     print('Updated Successfully !');
//     return response;
//   }

//delete all persons
  deleteAllPersons() async {
    Database? mydb = await db;
    var response = await mydb!.delete("items");
    return response;
  }

//   static Future<void> createTables(sql.Database database) async {
//     await database.execute("""CREATE TABLE items(
//         id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
//         title TEXT,
//         description TEXT,
//         createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
//       )
//       """);
//   }
// // id: the id of a item
// // title, description: name and description of your activity
// // created_at: the time that the item was created. It will be automatically handled by SQLite
//
//   static Future<sql.Database> db() async {
//     return sql.openDatabase(
//       'nabindhakal.db',
//       version: 1,
//       onCreate: (sql.Database database, int version) async {
//         await createTables(database);
//       },
//     );
//   }

// // Create new item
// static Future<int> createItem(String? title, String? descrption) async {
//   final db = await DatabaseHelper.db();
//
//   final data = {'title': title, 'description': descrption};
//   final id = await db.insert('items', data,
//       conflictAlgorithm: sql.ConflictAlgorithm.replace);
//   return id;
// }
//
// // Read all items
// static Future<List<Map<String, dynamic>>> getItems() async {
//   final db = await DatabaseHelper.db();
//   return db.query('items', orderBy: "id");
// }
//
// // Get a single item by id
// //We dont use this method, it is for you if you want it.
// static Future<List<Map<String, dynamic>>> getItem(int id) async {
//   final db = await DatabaseHelper.db();
//   return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
// }
//
// // Update an item by id
// static Future<int> updateItem(
//     int id, String title, String? descrption) async {
//   final db = await DatabaseHelper.db();
//
//   final data = {
//     'title': title,
//     'description': descrption,
//     'createdAt': DateTime.now().toString()
//   };
//
//   final result =
//   await db.update('items', data, where: "id = ?", whereArgs: [id]);
//   return result;
// }
//
// // Delete
// static Future<void> deleteItem(int id) async {
//   final db = await DatabaseHelper.db();
//   try {
//     await db.delete("items", where: "id = ?", whereArgs: [id]);
//   } catch (err) {
//     debugPrint("Something went wrong when deleting an item: $err");
//   }
// }
}
