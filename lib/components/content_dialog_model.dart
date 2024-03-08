import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'content_dialog_widget.dart' show ContentDialogWidget;
import 'package:flutter/material.dart';

class ContentDialogModel extends FlutterFlowModel<ContentDialogWidget> {
  ///  Local state fields for this component.

  ActivitiesRecord? selectedActivity;

  LessonsRecord? selectedLesson;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in ContentDialog widget.
  ActivitiesRecord? queryActInit;
  // Stores action output result for [Backend Call - Read Document] action in ContentDialog widget.
  LessonsRecord? queryLessonInit;
  // State field(s) for DropDownLesson widget.
  String? dropDownLessonValue;
  FormFieldController<String>? dropDownLessonValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDownLesson widget.
  LessonsRecord? queryLesson;
  // State field(s) for DropDownActivity widget.
  String? dropDownActivityValue;
  FormFieldController<String>? dropDownActivityValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDownActivity widget.
  ActivitiesRecord? queryAct;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextFieldContent widget.
  FocusNode? textFieldContentFocusNode;
  TextEditingController? textFieldContentController;
  String? Function(BuildContext, String?)? textFieldContentControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ContentRecord? newcontent;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldContentFocusNode?.dispose();
    textFieldContentController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
