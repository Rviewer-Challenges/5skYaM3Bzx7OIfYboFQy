import 'package:drift/web.dart';
import '../database.dart';

MyDatabase constructDb({bool logStatements = false}) {
  return MyDatabase(WebDatabase('db', logStatements: logStatements));
}
