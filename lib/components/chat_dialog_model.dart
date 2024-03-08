import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_dialog_widget.dart' show ChatDialogWidget;
import 'package:flutter/material.dart';

class ChatDialogModel extends FlutterFlowModel<ChatDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  List<MessagesRecord>? listViewPreviousSnapshot;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  MessagesRecord? userquery;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  MessagesRecord? newbotmsg;
  // Stores action output result for [Backend Call - API (Query)] action in IconButton widget.
  ApiCallResponse? response;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    listViewController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
