import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/hive_flutter.dart';

class InfoService {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  final user = Hive.box("name").get("name");
  Future<String?> saveStatus(String path, String text) async {
    final docRef = firestore.collection(user).doc();
    try {
      await docRef.set({"path": path, "text": text, "uid": docRef.id});
    } catch (_) {
      return null;
    }
    return docRef.id;
  }
}
