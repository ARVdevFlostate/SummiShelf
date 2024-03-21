import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String psvScanOutput = '0';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SearchTextField widget.
  FocusNode? searchTextFieldFocusNode;
  TextEditingController? searchTextFieldController;
  String? Function(BuildContext, String?)? searchTextFieldControllerValidator;
  // Stores action output result for [Backend Call - API (getBookByISBN)] action in SearchButton widget.
  ApiCallResponse? apiResultvoi;
  var scanOutput = '';
  // Stores action output result for [Backend Call - API (getBookByISBN)] action in ScanBarcodeContainer widget.
  ApiCallResponse? apiResultvoiScan;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchTextFieldFocusNode?.dispose();
    searchTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
