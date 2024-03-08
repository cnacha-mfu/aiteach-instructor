import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'generate_dialog_widget.dart' show GenerateDialogWidget;
import 'package:flutter/material.dart';

class GenerateDialogModel extends FlutterFlowModel<GenerateDialogWidget> {
  ///  Local state fields for this component.

  ActivitiesRecord? selectedActivity;

  LessonsRecord? selectedLesson;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in GenerateDialog widget.
  ActivitiesRecord? queryActInit;
  // Stores action output result for [Backend Call - Read Document] action in GenerateDialog widget.
  LessonsRecord? queryLessonInit;
  // State field(s) for TextFieldPrompt widget.
  FocusNode? textFieldPromptFocusNode;
  TextEditingController? textFieldPromptController;
  String? Function(BuildContext, String?)? textFieldPromptControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldPromptFocusNode?.dispose();
    textFieldPromptController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
