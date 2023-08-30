import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class SavedModel {
  final String path;
  final String text;
  final String uid;
  SavedModel({
    required this.path,
    required this.text,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'path': path,
      'text': text,
      'uid': uid,
    };
  }

  factory SavedModel.fromMap(Map<String, dynamic> map) {
    return SavedModel(
      path: map['path'] as String,
      text: map['text'] as String,
      uid: map['uid'] as String,
    );
  }

  SavedModel copyWith({
    String? path,
    String? text,
    String? uid,
  }) {
    return SavedModel(
      path: path ?? this.path,
      text: text ?? this.text,
      uid: uid ?? this.uid,
    );
  }

  String toJson() => json.encode(toMap());

  factory SavedModel.fromJson(String source) => SavedModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SavedModel(path: $path, text: $text, uid: $uid)';

  @override
  bool operator ==(covariant SavedModel other) {
    if (identical(this, other)) return true;

    return other.path == path && other.text == text && other.uid == uid;
  }

  @override
  int get hashCode => path.hashCode ^ text.hashCode ^ uid.hashCode;
}
