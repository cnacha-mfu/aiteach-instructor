import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContentRecord extends FirestoreRecord {
  ContentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "lesson_ref" field.
  DocumentReference? _lessonRef;
  DocumentReference? get lessonRef => _lessonRef;
  bool hasLessonRef() => _lessonRef != null;

  // "activity_ref" field.
  DocumentReference? _activityRef;
  DocumentReference? get activityRef => _activityRef;
  bool hasActivityRef() => _activityRef != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "lesson_name" field.
  String? _lessonName;
  String get lessonName => _lessonName ?? '';
  bool hasLessonName() => _lessonName != null;

  // "activity_name" field.
  String? _activityName;
  String get activityName => _activityName ?? '';
  bool hasActivityName() => _activityName != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "gen_prompt" field.
  String? _genPrompt;
  String get genPrompt => _genPrompt ?? '';
  bool hasGenPrompt() => _genPrompt != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "github_asg_id" field.
  String? _githubAsgId;
  String get githubAsgId => _githubAsgId ?? '';
  bool hasGithubAsgId() => _githubAsgId != null;

  // "points" field.
  int? _points;
  int get points => _points ?? 0;
  bool hasPoints() => _points != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _content = snapshotData['content'] as String?;
    _lessonRef = snapshotData['lesson_ref'] as DocumentReference?;
    _activityRef = snapshotData['activity_ref'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _lessonName = snapshotData['lesson_name'] as String?;
    _activityName = snapshotData['activity_name'] as String?;
    _status = snapshotData['status'] as String?;
    _genPrompt = snapshotData['gen_prompt'] as String?;
    _type = snapshotData['type'] as String?;
    _githubAsgId = snapshotData['github_asg_id'] as String?;
    _points = castToType<int>(snapshotData['points']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('content')
          : FirebaseFirestore.instance.collectionGroup('content');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('content').doc(id);

  static Stream<ContentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContentRecord.fromSnapshot(s));

  static Future<ContentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContentRecord.fromSnapshot(s));

  static ContentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContentRecordData({
  String? content,
  DocumentReference? lessonRef,
  DocumentReference? activityRef,
  DateTime? timestamp,
  String? lessonName,
  String? activityName,
  String? status,
  String? genPrompt,
  String? type,
  String? githubAsgId,
  int? points,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content': content,
      'lesson_ref': lessonRef,
      'activity_ref': activityRef,
      'timestamp': timestamp,
      'lesson_name': lessonName,
      'activity_name': activityName,
      'status': status,
      'gen_prompt': genPrompt,
      'type': type,
      'github_asg_id': githubAsgId,
      'points': points,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContentRecordDocumentEquality implements Equality<ContentRecord> {
  const ContentRecordDocumentEquality();

  @override
  bool equals(ContentRecord? e1, ContentRecord? e2) {
    return e1?.content == e2?.content &&
        e1?.lessonRef == e2?.lessonRef &&
        e1?.activityRef == e2?.activityRef &&
        e1?.timestamp == e2?.timestamp &&
        e1?.lessonName == e2?.lessonName &&
        e1?.activityName == e2?.activityName &&
        e1?.status == e2?.status &&
        e1?.genPrompt == e2?.genPrompt &&
        e1?.type == e2?.type &&
        e1?.githubAsgId == e2?.githubAsgId &&
        e1?.points == e2?.points;
  }

  @override
  int hash(ContentRecord? e) => const ListEquality().hash([
        e?.content,
        e?.lessonRef,
        e?.activityRef,
        e?.timestamp,
        e?.lessonName,
        e?.activityName,
        e?.status,
        e?.genPrompt,
        e?.type,
        e?.githubAsgId,
        e?.points
      ]);

  @override
  bool isValidKey(Object? o) => o is ContentRecord;
}
