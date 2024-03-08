import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'content_dialog_model.dart';
export 'content_dialog_model.dart';

class ContentDialogWidget extends StatefulWidget {
  const ContentDialogWidget({
    super.key,
    required this.courseId,
    this.content,
  });

  final DocumentReference? courseId;
  final ContentRecord? content;

  @override
  State<ContentDialogWidget> createState() => _ContentDialogWidgetState();
}

class _ContentDialogWidgetState extends State<ContentDialogWidget> {
  late ContentDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContentDialogModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.content != null) {
        _model.queryActInit = await ActivitiesRecord.getDocumentOnce(
            widget.content!.activityRef!);
        setState(() {
          _model.selectedActivity = _model.queryActInit;
        });
        _model.queryLessonInit =
            await LessonsRecord.getDocumentOnce(widget.content!.lessonRef!);
        setState(() {
          _model.selectedLesson = _model.queryLessonInit;
        });
      }
    });

    _model.textController1 ??=
        TextEditingController(text: widget.content?.githubAsgId);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: widget.content?.points.toString());
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textFieldContentController ??= TextEditingController(
        text: widget.content?.content);
    _model.textFieldContentFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Text(
                            'Lesson:',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                        StreamBuilder<List<LessonsRecord>>(
                          stream: queryLessonsRecord(
                            parent: widget.courseId,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 40.0,
                                  height: 40.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<LessonsRecord>
                                dropDownLessonLessonsRecordList =
                                snapshot.data!;
                            return FlutterFlowDropDown<String>(
                              controller:
                                  _model.dropDownLessonValueController ??=
                                      FormFieldController<String>(
                                _model.dropDownLessonValue ??=
                                    widget.content?.lessonName,
                              ),
                              options: dropDownLessonLessonsRecordList
                                  .map((e) => e.name)
                                  .toList(),
                              onChanged: (val) async {
                                setState(
                                    () => _model.dropDownLessonValue = val);
                                _model.queryLesson =
                                    await queryLessonsRecordOnce(
                                  parent: widget.courseId,
                                  queryBuilder: (lessonsRecord) =>
                                      lessonsRecord.where(
                                    'name',
                                    isEqualTo: _model.dropDownLessonValue,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                setState(() {
                                  _model.selectedLesson = _model.queryLesson;
                                });

                                setState(() {});
                              },
                              width: 300.0,
                              height: 50.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'Please select lesson...',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              disabled: widget.content != null,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Text(
                            'Acivity:',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                        StreamBuilder<List<ActivitiesRecord>>(
                          stream: queryActivitiesRecord(
                            parent: widget.courseId,
                          ),
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
                            List<ActivitiesRecord>
                                dropDownActivityActivitiesRecordList =
                                snapshot.data!;
                            return FlutterFlowDropDown<String>(
                              controller:
                                  _model.dropDownActivityValueController ??=
                                      FormFieldController<String>(
                                _model.dropDownActivityValue ??=
                                    widget.content?.activityName,
                              ),
                              options: dropDownActivityActivitiesRecordList
                                  .map((e) => e.name)
                                  .toList(),
                              onChanged: (val) async {
                                setState(
                                    () => _model.dropDownActivityValue = val);
                                _model.queryAct =
                                    await queryActivitiesRecordOnce(
                                  parent: widget.courseId,
                                  queryBuilder: (activitiesRecord) =>
                                      activitiesRecord.where(
                                    'name',
                                    isEqualTo: _model.dropDownActivityValue,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                setState(() {
                                  _model.selectedActivity = _model.queryAct;
                                });

                                setState(() {});
                              },
                              width: 300.0,
                              height: 50.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'Please select activity...',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              disabled: widget.content != null,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  if (_model.selectedActivity?.integration ==
                      'Github Classroom')
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController1,
                                focusNode: _model.textFieldFocusNode1,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'GitHub Assignment ID:',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintText:
                                      'Enter your assignment ID from GitHub Classroom here.',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontStyle: FontStyle.italic,
                                      ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.textController1Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController2,
                                focusNode: _model.textFieldFocusNode2,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Points:',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintText: 'Enter total points to be awarded',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontStyle: FontStyle.italic,
                                      ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.textController2Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textFieldContentController,
                    focusNode: _model.textFieldContentFocusNode,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Content:',
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintText:
                          'Enter the content for this. Leave it blank if you AI to generate this.',
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
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
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall,
                    maxLines: 10,
                    minLines: 10,
                    validator: _model.textFieldContentControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    if (widget.content != null) {
                      await widget.content!.reference
                          .update(createContentRecordData(
                        content: _model.textFieldContentController.text,
                        status: _model.textFieldContentController.text == ''
                            ? 'blank'
                            : 'ready',
                        githubAsgId: _model.textController1.text,
                        points: int.tryParse(_model.textController2.text),
                      ));
                    } else {
                      var contentRecordReference =
                          ContentRecord.createDoc(widget.courseId!);
                      await contentRecordReference.set(createContentRecordData(
                        content: _model.textFieldContentController.text,
                        lessonRef: _model.queryLesson?.reference,
                        activityRef: _model.selectedActivity?.reference,
                        lessonName: _model.queryLesson?.name,
                        activityName: _model.selectedActivity?.name,
                        timestamp: getCurrentTimestamp,
                        status: _model.textFieldContentController.text == ''
                            ? 'blank'
                            : 'ready',
                        type: _model.selectedActivity?.type,
                        githubAsgId: _model.textController1.text,
                        points: int.tryParse(_model.textController2.text),
                      ));
                      _model.newcontent = ContentRecord.getDocumentFromData(
                          createContentRecordData(
                            content: _model.textFieldContentController.text,
                            lessonRef: _model.queryLesson?.reference,
                            activityRef: _model.selectedActivity?.reference,
                            lessonName: _model.queryLesson?.name,
                            activityName: _model.selectedActivity?.name,
                            timestamp: getCurrentTimestamp,
                            status: _model.textFieldContentController.text == ''
                                ? 'blank'
                                : 'ready',
                            type: _model.selectedActivity?.type,
                            githubAsgId: _model.textController1.text,
                            points: int.tryParse(_model.textController2.text),
                          ),
                          contentRecordReference);
                    }

                    Navigator.pop(context);

                    setState(() {});
                  },
                  text: 'Save',
                  icon: const Icon(
                    Icons.save,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: 'Close',
                    icon: const Icon(
                      Icons.close,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
