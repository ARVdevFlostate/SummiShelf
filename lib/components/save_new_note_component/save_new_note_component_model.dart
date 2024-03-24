import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'save_new_note_component_widget.dart' show SaveNewNoteComponentWidget;
import 'package:flutter/material.dart';

class SaveNewNoteComponentModel
    extends FlutterFlowModel<SaveNewNoteComponentWidget> {
  ///  Local state fields for this component.

  DateTime? psvCurrentDateTime;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for NotesTitleTextField widget.
  FocusNode? notesTitleTextFieldFocusNode;
  TextEditingController? notesTitleTextFieldController;
  String? Function(BuildContext, String?)?
      notesTitleTextFieldControllerValidator;
  String? _notesTitleTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter a title for your note';
    }

    return null;
  }

  // State field(s) for NotesDescriptionTextField widget.
  FocusNode? notesDescriptionTextFieldFocusNode;
  TextEditingController? notesDescriptionTextFieldController;
  String? Function(BuildContext, String?)?
      notesDescriptionTextFieldControllerValidator;
  String? _notesDescriptionTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter a description';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in SaveButton widget.
  NotesRecord? newNotesRef;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    notesTitleTextFieldControllerValidator =
        _notesTitleTextFieldControllerValidator;
    notesDescriptionTextFieldControllerValidator =
        _notesDescriptionTextFieldControllerValidator;
  }

  @override
  void dispose() {
    notesTitleTextFieldFocusNode?.dispose();
    notesTitleTextFieldController?.dispose();

    notesDescriptionTextFieldFocusNode?.dispose();
    notesDescriptionTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
