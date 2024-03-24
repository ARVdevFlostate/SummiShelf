import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'save_book_component_widget.dart' show SaveBookComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
