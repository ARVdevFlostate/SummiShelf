import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'save_new_note_component_model.dart';
export 'save_new_note_component_model.dart';

class SaveNewNoteComponentWidget extends StatefulWidget {
  const SaveNewNoteComponentWidget({
    super.key,
    String? actionTitle,
    String? actionSubtitle,
    String? buttonTitle,
    this.currentNoteDocument,
  })  : actionTitle = actionTitle ?? '',
        actionSubtitle = actionSubtitle ?? ' ',
        buttonTitle = buttonTitle ?? 'Create / Save';

  final String actionTitle;
  final String actionSubtitle;
  final String buttonTitle;
  final NotesRecord? currentNoteDocument;

  @override
  State<SaveNewNoteComponentWidget> createState() =>
      _SaveNewNoteComponentWidgetState();
}

class _SaveNewNoteComponentWidgetState
    extends State<SaveNewNoteComponentWidget> {
  late SaveNewNoteComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SaveNewNoteComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.psvCurrentDateTime = null;
      });
    });

    _model.notesTitleTextFieldController ??= TextEditingController();
    _model.notesTitleTextFieldFocusNode ??= FocusNode();

    _model.notesDescriptionTextFieldController ??= TextEditingController();
    _model.notesDescriptionTextFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      constraints: const BoxConstraints(
        maxWidth: 530.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 3.0,
            color: Color(0x33000000),
            offset: Offset(0.0, 1.0),
          )
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 36.0,
                  height: 6.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.actionTitle,
                  style: FlutterFlowTheme.of(context).displaySmall,
                ),
                Text(
                  widget.actionSubtitle,
                  style: FlutterFlowTheme.of(context).labelLarge,
                ),
              ],
            ),
          ),
          Expanded(
            child: Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.notesTitleTextFieldController,
                        focusNode: _model.notesTitleTextFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.notesTitleTextFieldController',
                          const Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        autofillHints: const [AutofillHints.email],
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Title',
                          labelStyle: FlutterFlowTheme.of(context).labelLarge,
                          hintText: 'Enter your notes title',
                          hintStyle: FlutterFlowTheme.of(context).labelLarge,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 0.0, 20.0),
                          suffixIcon: _model.notesTitleTextFieldController!.text
                                  .isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.notesTitleTextFieldController
                                        ?.clear();
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.clear,
                                    color: Color(0xFF757575),
                                    size: 18.0,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge,
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        validator: _model.notesTitleTextFieldControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.notesDescriptionTextFieldController,
                        focusNode: _model.notesDescriptionTextFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.notesDescriptionTextFieldController',
                          const Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        autofillHints: const [AutofillHints.email],
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: FlutterFlowTheme.of(context).labelLarge,
                          hintText: 'Enter your notes description',
                          hintStyle: FlutterFlowTheme.of(context).labelLarge,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 0.0, 20.0),
                          suffixIcon: _model
                                  .notesDescriptionTextFieldController!
                                  .text
                                  .isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.notesDescriptionTextFieldController
                                        ?.clear();
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.clear,
                                    color: Color(0xFF757575),
                                    size: 18.0,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge,
                        maxLines: 2,
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        validator: _model
                            .notesDescriptionTextFieldControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ].divide(const SizedBox(height: 24.0)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'Cancel',
                  options: FFButtonOptions(
                    height: 44.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  showLoadingIndicator: false,
                ),
                FFButtonWidget(
                  onPressed: () async {
                    if (_model.formKey.currentState == null ||
                        !_model.formKey.currentState!.validate()) {
                      return;
                    }
                    setState(() {
                      _model.psvCurrentDateTime = getCurrentTimestamp;
                    });
                    if (widget.buttonTitle == 'Create') {
                      var notesRecordReference = NotesRecord.collection.doc();
                      await notesRecordReference.set(createNotesRecordData(
                        createdBy: currentUserReference,
                        uid: currentUserUid,
                        created: _model.psvCurrentDateTime,
                        title: _model.notesTitleTextFieldController.text,
                        description:
                            _model.notesDescriptionTextFieldController.text,
                        lastUpdated: _model.psvCurrentDateTime,
                      ));
                      _model.newNotesRef = NotesRecord.getDocumentFromData(
                          createNotesRecordData(
                            createdBy: currentUserReference,
                            uid: currentUserUid,
                            created: _model.psvCurrentDateTime,
                            title: _model.notesTitleTextFieldController.text,
                            description:
                                _model.notesDescriptionTextFieldController.text,
                            lastUpdated: _model.psvCurrentDateTime,
                          ),
                          notesRecordReference);

                      await UpdationsRecord.createDoc(
                              _model.newNotesRef!.reference)
                          .set(createUpdationsRecordData(
                        updated: _model.psvCurrentDateTime,
                        uid: currentUserUid,
                      ));
                      setState(() {
                        _model.psvCurrentDateTime = null;
                      });
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'New note has been created.',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).info,
                                ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                    } else {
                      await widget.currentNoteDocument!.reference
                          .update(createNotesRecordData(
                        title: _model.notesTitleTextFieldController.text,
                        description:
                            _model.notesDescriptionTextFieldController.text,
                      ));
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Your note changes are saved.',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).info,
                                ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                    }

                    setState(() {});
                  },
                  text: widget.buttonTitle,
                  options: FFButtonOptions(
                    height: 44.0,
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
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  showLoadingIndicator: false,
                ),
              ].divide(const SizedBox(width: 16.0)),
            ),
          ),
        ]
            .divide(const SizedBox(height: 12.0))
            .addToStart(const SizedBox(height: 12.0))
            .addToEnd(const SizedBox(height: 12.0)),
      ),
    );
  }
}
