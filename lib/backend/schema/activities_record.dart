import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ActivitiesRecord extends FirestoreRecord {
  ActivitiesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "condition" field.
  String? _condition;
  String get condition => _condition ?? '';
  bool hasCondition() => _condition != null;

  // "gen_prompt" field.
  String? _genPrompt;
  String get genPrompt => _genPrompt ?? '';
  bool hasGenPrompt() => _genPrompt != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "integration" field.
  String? _integration;
  String get integration => _integration ?? '';
  bool hasIntegration() => _integration != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _condition = snapshotData['condition'] as String?;
    _genPrompt = snapshotData['gen_prompt'] as String?;
    _type = snapshotData['type'] as String?;
    _integration = snapshotData['integration'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('activities')
          : FirebaseFirestore.instance.collectionGroup('activities');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('activities').doc(id);

  static Stream<ActivitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActivitiesRecord.fromSnapshot(s));

  static Future<ActivitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActivitiesRecord.fromSnapshot(s));

  static ActivitiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActivitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActivitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActivitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActivitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActivitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivitiesRecordData({
  String? name,
  String? description,
  String? condition,
  String? genPrompt,
  String? type,
  String? integration,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'condition': condition,
      'gen_prompt': genPrompt,
      'type': type,
      'integration': integration,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActivitiesRecordDocumentEquality implements Equality<ActivitiesRecord> {
  const ActivitiesRecordDocumentEquality();

  @override
  bool equals(ActivitiesRecord? e1, ActivitiesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.condition == e2?.condition &&
        e1?.genPrompt == e2?.genPrompt &&
        e1?.type == e2?.type &&
        e1?.integration == e2?.integration;
  }

  @override
  int hash(ActivitiesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.condition,
        e?.genPrompt,
        e?.type,
        e?.integration
      ]);

  @override
  bool isValidKey(Object? o) => o is ActivitiesRecord;
}
