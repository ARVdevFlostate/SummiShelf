import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'save_book_component_widget.dart' show SaveBookComponentWidget;
import 'package:flutter/material.dart';

class SaveBookComponentModel extends FlutterFlowModel<SaveBookComponentWidget> {
  ///  Local state fields for this component.

  bool isFav = false;

  int readBeforeCount = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for ReadBeforeCheckbox widget.
  bool? readBeforeCheckboxValue;
  // Stores action output result for [Backend Call - Create Document] action in SaveButton widget.
  BooksRecord? newBookRef;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
