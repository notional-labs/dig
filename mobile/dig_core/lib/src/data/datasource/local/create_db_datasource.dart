import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

abstract class CreateDBDatasource {
  /// Open a new or existing database.
  Future<Database> create();
}

@Injectable(as: CreateDBDatasource)
class CreateDBDatasourceImpl implements CreateDBDatasource {
  final String dbPath = 'dig.db';

  @override
  Future<Database> create() async {
    final DatabaseFactory dbFactory = databaseFactoryIo;
    final Database db = await dbFactory.openDatabase(dbPath);
    return db;
  }
}
