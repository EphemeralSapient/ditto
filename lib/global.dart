library global;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ditto/database.dart';
import 'package:ditto/routes.dart';
import 'package:ditto/ui/loading.dart';

Map<String, CollectionReference> collectionMap = {};
Map<String, dynamic> hashes = {};
db? database;

void init() async {
  database = db();
  addRoute("/loadingscreen", LoadingScreen());
}
