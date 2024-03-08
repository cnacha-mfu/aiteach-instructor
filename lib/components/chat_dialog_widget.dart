import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'chat_dialog_model.dart';
export 'chat_dialog_model.dart';

class ChatDialogWidget extends StatefulWidget {
  const ChatDialogWidget({
    super.key,
    required this.course,
  });

  final DocumentReference? course;

  @override
  State<ChatDialogWidget> createState() => _ChatDialogWidgetState();
}

class _ChatDialogWidgetState extends State<ChatDialogWidget> {
  late ChatDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatDialogModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CoursesRecord>(
      stream: CoursesRecord.getDocument(widget.course!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).secondary,
                ),
              ),
            ),
          );
        }
        final chatDialogCoursesRecord = snapshot.data!;
        return Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            shape: BoxShape.rectangle,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: StreamBuilder<List<MessagesRecord>>(
                    stream: queryMessagesRecord(
                      parent: currentUserReference,
                      queryBuilder: (messagesRecord) =>
                          messagesRecord.orderBy('timestamp', descending: true),
                    )..listen((snapshot) async {
                        List<MessagesRecord> listViewMessagesRecordList =
                            snapshot;
                        if (_model.listViewPreviousSnapshot != null &&
                            !const ListEquality(
                                    MessagesRecordDocumentEquality())
                                .equals(listViewMessagesRecordList,
                                    _model.listViewPreviousSnapshot)) {
                          await _model.listViewController?.animateTo(
                            0,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.ease,
                          );

                          setState(() {});
                        }
                        _model.listViewPreviousSnapshot = snapshot;
                      }),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).secondary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<MessagesRecord> listViewMessagesRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        reverse: true,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewMessagesRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewMessagesRecord =
                              listViewMessagesRecordList[listViewIndex];
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 15.0, 15.0, 15.0),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      minWidth:
                                          MediaQuery.sizeOf(context).width *
                                              0.1,
                                      maxWidth:
                                          MediaQuery.sizeOf(context).width *
                                              0.8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: listViewMessagesRecord.owner ==
                                              'bot'
                                          ? FlutterFlowTheme.of(context).accent2
                                          : FlutterFlowTheme.of(context)
                                              .accent1,
                                      borderRadius: BorderRadius.circular(10.0),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (listViewMessagesRecord.owner ==
                                              'bot')
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? 'assets/images/aiteach-logo-white.png'
                                                    : 'assets/images/aiteach-logo-grey.png',
                                                width: 40.0,
                                                height: 40.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          Expanded(
                                            child: MarkdownBody(
                                              data: listViewMessagesRecord.text,
                                              selectable: true,
                                              onTapLink: (_, url, __) =>
                                                  launchURL(url!),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        controller: _model.listViewController,
                      );
                    },
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 0.0, 0.0),
                        child: Icon(
                          Icons.chat,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 30.0,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              autofocus: true,
                              readOnly: valueOrDefault<bool>(
                                  currentUserDocument?.chatDisabled, false),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintText: 'Type your question',
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 20.0,
                          borderWidth: 0.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).primary,
                          icon: Icon(
                            Icons.send,
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            size: 24.0,
                          ),
                          showLoadingIndicator: true,
                          onPressed: () async {
                            if (_model.textController.text != '') {
                              var messagesRecordReference1 =
                                  MessagesRecord.createDoc(
                                      currentUserReference!);
                              await messagesRecordReference1
                                  .set(createMessagesRecordData(
                                owner: 'user',
                                text: _model.textController.text,
                                timestamp: getCurrentTimestamp,
                              ));
                              _model.userquery =
                                  MessagesRecord.getDocumentFromData(
                                      createMessagesRecordData(
                                        owner: 'user',
                                        text: _model.textController.text,
                                        timestamp: getCurrentTimestamp,
                                      ),
                                      messagesRecordReference1);

                              await currentUserReference!
                                  .update(createUsersRecordData(
                                chatDisabled: true,
                              ));
                              setState(() {
                                _model.textController?.clear();
                              });
                              await _model.listViewController?.animateTo(
                                0,
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.ease,
                              );

                              var messagesRecordReference2 =
                                  MessagesRecord.createDoc(
                                      currentUserReference!);
                              await messagesRecordReference2
                                  .set(createMessagesRecordData(
                                owner: 'bot',
                                text: 'Thinking...',
                                timestamp: getCurrentTimestamp,
                              ));
                              _model.newbotmsg =
                                  MessagesRecord.getDocumentFromData(
                                      createMessagesRecordData(
                                        owner: 'bot',
                                        text: 'Thinking...',
                                        timestamp: getCurrentTimestamp,
                                      ),
                                      messagesRecordReference2);
                              await _model.listViewController?.animateTo(
                                0,
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.ease,
                              );
                              _model.response = await QueryCall.call(
                                courseId: chatDialogCoursesRecord.id,
                                query: _model.userquery?.text,
                              );

                              await _model.newbotmsg!.reference
                                  .update(createMessagesRecordData(
                                text: getJsonField(
                                  (_model.response?.jsonBody ?? ''),
                                  r'''$.response''',
                                ).toString(),
                              ));
                              await _model.listViewController?.animateTo(
                                0,
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.ease,
                              );

                              await currentUserReference!
                                  .update(createUsersRecordData(
                                chatDisabled: false,
                              ));
                            }

                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
