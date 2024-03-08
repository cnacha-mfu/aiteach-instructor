// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future reassignLessonsNumber(List<LessonsRecord> lessonsList) async {
  // Create a batch to combine multiple Firestore operations into one.
  final batch = FirebaseFirestore.instance.batch();

  // Iterate through the list and update the order field for each document in Firestore.
  for (int i = 0; i < lessonsList.length; i++) {
    final LessonsRecord doc = lessonsList[i];
    // Update the 'seq' field of the document with its new index.
    batch.update(doc.reference, {'seq': i + 1});
  }
  return await batch.commit();
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
