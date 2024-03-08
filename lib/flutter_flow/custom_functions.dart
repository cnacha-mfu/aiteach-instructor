import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? getPageName(String linktoPage) {
  final List<String> parts = linktoPage.split('/');
  if (parts.isNotEmpty) {
    return parts.last;
  }
  return null;
}

dynamic convertJSONString(String jsonstr) {
  jsonstr = jsonstr.replaceAll("\\n", "");
  jsonstr = jsonstr.replaceAll("\\\"", "\"");
  Map valueMap = json.decode(jsonstr);
  return valueMap;
}
