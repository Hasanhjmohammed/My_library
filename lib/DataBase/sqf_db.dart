import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MySql{
  static Database ?_db;
  Future<Database?>  get db async{
    if(_db  ==  null)
    {  _db=await initedatabase();
    return _db;}
    else
    {     return _db;}
  }
  _onCreate (Database db, int version) async {
    await db.execute(
        'CREATE TABLE Book (id INTEGER PRIMARY KEY, title TEXT, subtitle TEXT ,path TEXT,author TEXT ,date TEXT)');
  }
  _onUpgrade(Database db, int old,int newversion){}
  Future<Database?> initedatabase()async {
    String Databasepath=await getDatabasesPath();
    String path = join(Databasepath, 'Notes.db');
    Database database = await openDatabase(path, version: 1,onCreate: _onCreate,onUpgrade: _onUpgrade
    );
    print ("**************************************");
    return database;
  }
  readdatabase(String sql)async{
    Database? my=await db;
    List <Map<String ,Object ?>>res=await my!.rawQuery(sql);
    return res;
  }
  adddatabase(String sql)async{
    Database? my=await db;
    int res= await my!.rawInsert(sql);
    return res;
  }
  deletdatabase(String sql)async{
    Database? my=await db;
    int res=await my!.rawDelete(sql);
    print (res);
    return res;

  }
  updatedatabase(String sql)async{
    Database? my=await db;
    int res=await my!.rawUpdate(sql);
    return res;
  }


}