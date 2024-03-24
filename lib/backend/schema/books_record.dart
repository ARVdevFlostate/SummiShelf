import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BooksRecord extends FirestoreRecord {
  BooksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "subtitle" field.
  String? _subtitle;
  String get subtitle => _subtitle ?? '';
  bool hasSubtitle() => _subtitle != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "thumbnail" field.
  String? _thumbnail;
  String get thumbnail => _thumbnail ?? '';
  bool hasThumbnail() => _thumbnail != null;

  // "added_at" field.
  DateTime? _addedAt;
  DateTime? get addedAt => _addedAt;
  bool hasAddedAt() => _addedAt != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "isfavourite" field.
  bool? _isfavourite;
  bool get isfavourite => _isfavourite ?? false;
  bool hasIsfavourite() => _isfavourite != null;

  // "publication_year" field.
  int? _publicationYear;
  int get publicationYear => _publicationYear ?? 0;
  bool hasPublicationYear() => _publicationYear != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "read_count" field.
  int? _readCount;
  int get readCount => _readCount ?? 0;
  bool hasReadCount() => _readCount != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _subtitle = snapshotData['subtitle'] as String?;
    _description = snapshotData['description'] as String?;
    _thumbnail = snapshotData['thumbnail'] as String?;
    _addedAt = snapshotData['added_at'] as DateTime?;
    _summary = snapshotData['summary'] as String?;
    _category = snapshotData['category'] as String?;
    _isfavourite = snapshotData['isfavourite'] as bool?;
    _publicationYear = castToType<int>(snapshotData['publication_year']);
    _uid = snapshotData['uid'] as String?;
    _readCount = castToType<int>(snapshotData['read_count']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('books');

  static Stream<BooksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BooksRecord.fromSnapshot(s));

  static Future<BooksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BooksRecord.fromSnapshot(s));

  static BooksRecord fromSnapshot(DocumentSnapshot snapshot) => BooksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BooksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BooksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BooksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BooksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBooksRecordData({
  String? title,
  String? subtitle,
  String? description,
  String? thumbnail,
  DateTime? addedAt,
  String? summary,
  String? category,
  bool? isfavourite,
  int? publicationYear,
  String? uid,
  int? readCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'thumbnail': thumbnail,
      'added_at': addedAt,
      'summary': summary,
      'category': category,
      'isfavourite': isfavourite,
      'publication_year': publicationYear,
      'uid': uid,
      'read_count': readCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class BooksRecordDocumentEquality implements Equality<BooksRecord> {
  const BooksRecordDocumentEquality();

  @override
  bool equals(BooksRecord? e1, BooksRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.subtitle == e2?.subtitle &&
        e1?.description == e2?.description &&
        e1?.thumbnail == e2?.thumbnail &&
        e1?.addedAt == e2?.addedAt &&
        e1?.summary == e2?.summary &&
        e1?.category == e2?.category &&
        e1?.isfavourite == e2?.isfavourite &&
        e1?.publicationYear == e2?.publicationYear &&
        e1?.uid == e2?.uid &&
        e1?.readCount == e2?.readCount;
  }

  @override
  int hash(BooksRecord? e) => const ListEquality().hash([
        e?.title,
        e?.subtitle,
        e?.description,
        e?.thumbnail,
        e?.addedAt,
        e?.summary,
        e?.category,
        e?.isfavourite,
        e?.publicationYear,
        e?.uid,
        e?.readCount
      ]);

  @override
  bool isValidKey(Object? o) => o is BooksRecord;
}
