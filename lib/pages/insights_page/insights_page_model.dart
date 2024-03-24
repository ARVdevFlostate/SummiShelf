import '/flutter_flow/flutter_flow_util.dart';
import 'insights_page_widget.dart' show InsightsPageWidget;
import 'package:flutter/material.dart';

class InsightsPageModel extends FlutterFlowModel<InsightsPageWidget> {
  ///  Local state fields for this page.

  int psvBooks = 0;

  int psvFavs = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in InsightsPage widget.
  int? userFavBooksCount;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
