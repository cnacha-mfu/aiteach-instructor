import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksRecord extends FirestoreRecord {
  TasksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "activity" field.
  String? _activity;
  String get activity => _activity ?? '';
  bool hasActivity() => _activity != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "course_id" field.
  String? _courseId;
  String get courseId => _courseId ?? '';
  bool hasCourseId() => _courseId != null;

  // "lesson" field.
  String? _lesson;
  String get lesson => _lesson ?? '';
  bool hasLesson() => _lesson != null;

  // "thought" field.
  String? _thought;
  String get thought => _thought ?? '';
  bool hasThought() => _thought != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "progress" field.
  int? _progress;
  int get progress => _progress ?? 0;
  bool hasProgress() => _progress != null;

  // "course_title" field.
  String? _courseTitle;
  String get courseTitle => _courseTitle ?? '';
  bool hasCourseTitle() => _courseTitle != null;

  // "lesson_seq" field.
  String? _lessonSeq;
  String get lessonSeq => _lessonSeq ?? '';
  bool hasLessonSeq() => _lessonSeq != null;

  // "course_ref" field.
  DocumentReference? _courseRef;
  DocumentReference? get courseRef => _courseRef;
  bool hasCourseRef() => _courseRef != null;

  // "lesson_ref" field.
  DocumentReference? _lessonRef;
  DocumentReference? get lessonRef => _lessonRef;
  bool hasLessonRef() => _lessonRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _activity = snapshotData['activity'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _courseId = snapshotData['course_id'] as String?;
    _lesson = snapshotData['lesson'] as String?;
    _thought = snapshotData['thought'] as String?;
    _status = snapshotData['status'] as String?;
    _progress = castToType<int>(snapshotData['progress']);
    _courseTitle = snapshotData['course_title'] as String?;
    _lessonSeq = snapshotData['lesson_seq'] as String?;
    _courseRef = snapshotData['course_ref'] as DocumentReference?;
    _lessonRef = snapshotData['lesson_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tasks')
          : FirebaseFirestore.instance.collectionGroup('tasks');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('tasks').doc(id);

  static Stream<TasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasksRecord.fromSnapshot(s));

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasksRecord.fromSnapshot(s));

  static TasksRecord fromSnapshot(DocumentSnapshot snapshot) => TasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasksRecordData({
  String? activity,
  DateTime? timestamp,
  String? courseId,
  String? lesson,
  String? thought,
  String? status,
  int? progress,
  String? courseTitle,
  String? lessonSeq,
  DocumentReference? courseRef,
  DocumentReference? lessonRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'activity': activity,
      'timestamp': timestamp,
      'course_id': courseId,
      'lesson': lesson,
      'thought': thought,
      'status': status,
      'progress': progress,
      'course_title': courseTitle,
      'lesson_seq': lessonSeq,
      'course_ref': courseRef,
      'lesson_ref': lessonRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class TasksRecordDocumentEquality implements Equality<TasksRecord> {
  const TasksRecordDocumentEquality();

  @override
  bool equals(TasksRecord? e1, TasksRecord? e2) {
    return e1?.activity == e2?.activity &&
        e1?.timestamp == e2?.timestamp &&
        e1?.courseId == e2?.courseId &&
        e1?.lesson == e2?.lesson &&
        e1?.thought == e2?.thought &&
        e1?.status == e2?.status &&
        e1?.progress == e2?.progress &&
        e1?.courseTitle == e2?.courseTitle &&
        e1?.lessonSeq == e2?.lessonSeq &&
        e1?.courseRef == e2?.courseRef &&
        e1?.lessonRef == e2?.lessonRef;
  }

  @override
  int hash(TasksRecord? e) => const ListEquality().hash([
        e?.activity,
        e?.timestamp,
        e?.courseId,
        e?.lesson,
        e?.thought,
        e?.status,
        e?.progress,
        e?.courseTitle,
        e?.lessonSeq,
        e?.courseRef,
        e?.lessonRef
      ]);

  @override
  bool isValidKey(Object? o) => o is TasksRecord;
}
