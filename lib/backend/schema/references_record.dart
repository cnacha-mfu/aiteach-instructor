import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ReferencesRecord extends FirestoreRecord {
  ReferencesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "filename" field.
  String? _filename;
  String get filename => _filename ?? '';
  bool hasFilename() => _filename != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _filename = snapshotData['filename'] as String?;
    _url = snapshotData['url'] as String?;
    _status = snapshotData['status'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('references')
          : FirebaseFirestore.instance.collectionGroup('references');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('references').doc(id);

  static Stream<ReferencesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReferencesRecord.fromSnapshot(s));

  static Future<ReferencesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReferencesRecord.fromSnapshot(s));

  static ReferencesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReferencesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReferencesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReferencesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReferencesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReferencesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReferencesRecordData({
  String? filename,
  String? url,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'filename': filename,
      'url': url,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReferencesRecordDocumentEquality implements Equality<ReferencesRecord> {
  const ReferencesRecordDocumentEquality();

  @override
  bool equals(ReferencesRecord? e1, ReferencesRecord? e2) {
    return e1?.filename == e2?.filename &&
        e1?.url == e2?.url &&
        e1?.status == e2?.status;
  }

  @override
  int hash(ReferencesRecord? e) =>
      const ListEquality().hash([e?.filename, e?.url, e?.status]);

  @override
  bool isValidKey(Object? o) => o is ReferencesRecord;
}
