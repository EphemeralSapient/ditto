import 'package:ditto/global.dart' as global;
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum db_fetch_status {
  exists,
  nodata,
  error,
  success // Meant for update,set, and delete operations
}

class db_fetch_return {
  db_fetch_status? status;
  Object? data;

  db_fetch_return(db_fetch_status s, Object? d) {
    status = s;
    data = d;
  }
}

class account_obj {
  String pincode = "";
  String areaName = "";
  String name = "";
  int mobileNumber = 0;
  int pass = 0;
  Timestamp date = Timestamp.now();
  String email = "";
  String landmark = "";
  bool accountActivated = false;

  account_obj fromJSON(Map<String, Object?> Data) {
    account_obj newObj = account_obj();

    newObj.pincode = Data["pincode"] as String;
    newObj.areaName = Data["areaName"] as String;
    newObj.name = Data["name"] as String;
    newObj.mobileNumber = Data["mobileNumber"] as int;
    newObj.pass = Data["passcode"] as int;
    newObj.date = Data["date"] as Timestamp;
    newObj.email = Data["email"] as String;
    newObj.landmark = Data["landmark"] as String;
    newObj.accountActivated = Data["accountActivated"] as bool;

    return newObj;
  }

  @override
  String toString() {
    return "$name $date $email $landmark $areaName $pincode $mobileNumber";
  }

  Map<String, Object?> toJson() {
    return {
      //"loginTimeStamp" : timeStamp,
      "pincode": pincode,
      "areaName": areaName,
      "name": name,
      "mobileNumber": mobileNumber,
      "passcode": pass,
      "date": date,
      "email": email,
      "landmark": landmark,
      "accountActivated": accountActivated
    };
  }

  // Gotta remove this needless function
  Map<String, Object?> toJsonUpdateLogin() {
    return {
      //"loginTimeStamp" : timeStamp
    };
  }
}

class db {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  db() {
    firestore.settings = const Settings(
        persistenceEnabled: true,
        cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
    debugPrint("Okay inited");
    //firestore.
  }

  CollectionReference<Object?> addCollection(String name, String path) {
    if (global.collectionMap.containsKey(name) == true)
      return global.collectionMap[name]!; // Returns if exists already
    global.collectionMap[name] =
        firestore.collection(path); // Adding the collection
    return global.collectionMap[name]!;
  }

  Future<db_fetch_return> get(
      CollectionReference<Object?> collection, String id) async {
    try {
      DocumentSnapshot<Object?> snapshot = await collection.doc(id).get();

      if (snapshot.exists) {
        return db_fetch_return(db_fetch_status.exists, snapshot.data());
      } else {
        return db_fetch_return(db_fetch_status.nodata, null);
      }
    } catch (e) {
      // Error occurred [network issue]
      debugPrint("Error on processing $id document ${e.toString()}");
      return db_fetch_return(db_fetch_status.error, e.toString());
    }
  }

  Future<db_fetch_return> create(CollectionReference<Object?> collection,
      String id, Object dataForUpdate) async {
    try {
      await collection.doc(id).set(dataForUpdate);
      return db_fetch_return(db_fetch_status.success, null);
    } catch (e) {
      // Error occurred [network issue]
      debugPrint("Error on processing $id document ${e.toString()}");
      return db_fetch_return(db_fetch_status.error, e.toString());
    }
  }

  Future<db_fetch_return> update(CollectionReference<Object?> collection,
      String id, Map<String, Object?> dataForUpdate) async {
    try {
      await collection.doc(id).update(dataForUpdate);
      return db_fetch_return(db_fetch_status.success, null);
    } catch (e) {
      // Error occurred [network issue]
      debugPrint("Error on processing $id document ${e.toString()}");
      return db_fetch_return(db_fetch_status.error, e.toString());
    }
  }

  Future<db_fetch_return> remove(
      CollectionReference<Object?> collection, String id) async {
    try {
      await collection.doc(id).delete();
      return db_fetch_return(db_fetch_status.success, null);
    } catch (e) {
      // Error occurred [network issue]
      debugPrint("Error on processing $id document ${e.toString()}");
      return db_fetch_return(db_fetch_status.error, e.toString());
    }
  }
}
