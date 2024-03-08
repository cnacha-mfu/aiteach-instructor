import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class QuizzesRecord extends FirestoreRecord {
  QuizzesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "lesson_ref" field.
  DocumentReference? _lessonRef;
  DocumentReference? get lessonRef => _lessonRef;
  bool hasLessonRef() => _lessonRef != null;

  // "choices" field.
  List<String>? _choices;
  List<String> get choices => _choices ?? const [];
  bool hasChoices() => _choices != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  bool hasAnswer() => _answer != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _lessonRef = snapshotData['lesson_ref'] as DocumentReference?;
    _choices = getDataList(snapshotData['choices']);
    _answer = snapshotData['answer'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('quizzes')
          : FirebaseFirestore.instance.collectionGroup('quizzes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('quizzes').doc(id);

  static Stream<QuizzesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizzesRecord.fromSnapshot(s));

  static Future<QuizzesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizzesRecord.fromSnapshot(s));

  static QuizzesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuizzesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizzesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizzesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizzesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizzesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizzesRecordData({
  String? question,
  DocumentReference? lessonRef,
  String? answer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'lesson_ref': lessonRef,
      'answer': answer,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizzesRecordDocumentEquality implements Equality<QuizzesRecord> {
  const QuizzesRecordDocumentEquality();

  @override
  bool equals(QuizzesRecord? e1, QuizzesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.question == e2?.question &&
        e1?.lessonRef == e2?.lessonRef &&
        listEquality.equals(e1?.choices, e2?.choices) &&
        e1?.answer == e2?.answer;
  }

  @override
  int hash(QuizzesRecord? e) => const ListEquality()
      .hash([e?.question, e?.lessonRef, e?.choices, e?.answer]);

  @override
  bool isValidKey(Object? o) => o is QuizzesRecord;
}
