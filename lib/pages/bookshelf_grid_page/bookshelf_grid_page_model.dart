import '/flutter_flow/flutter_flow_util.dart';
import 'bookshelf_grid_page_widget.dart' show BookshelfGridPageWidget;
import 'package:flutter/material.dart';

class BookshelfGridPageModel extends FlutterFlowModel<BookshelfGridPageWidget> {
  ///  Local state fields for this page.

  bool psvShowSearchResults = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in BookshelfItemContainer widget.
  bool? interstitialAdSuccess;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
