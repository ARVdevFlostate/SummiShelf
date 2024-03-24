import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UpdationsRecord extends FirestoreRecord {
  UpdationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "updated" field.
  DateTime? _updated;
  DateTime? get updated => _updated;
  bool hasUpdated() => _updated != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _updated = snapshotData['updated'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('updations')
          : FirebaseFirestore.instance.collectionGroup('updations');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('updations').doc(id);

  static Stream<UpdationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UpdationsRecord.fromSnapshot(s));

  static Future<UpdationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UpdationsRecord.fromSnapshot(s));

  static UpdationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UpdationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UpdationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UpdationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UpdationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UpdationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUpdationsRecordData({
  DateTime? updated,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'updated': updated,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class UpdationsRecordDocumentEquality implements Equality<UpdationsRecord> {
  const UpdationsRecordDocumentEquality();

  @override
  bool equals(UpdationsRecord? e1, UpdationsRecord? e2) {
    return e1?.updated == e2?.updated && e1?.uid == e2?.uid;
  }

  @override
  int hash(UpdationsRecord? e) =>
      const ListEquality().hash([e?.updated, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is UpdationsRecord;
}
