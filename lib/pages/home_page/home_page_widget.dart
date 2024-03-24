import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/save_book_component/save_book_component_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -30.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.psvScanOutput = '0';
      });
    });

    _model.searchTextFieldController ??= TextEditingController();
    _model.searchTextFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            constraints: BoxConstraints(
              maxWidth: 570.0,
            ),
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.asset(
                          'assets/images/business-3d-stack-of-different-books.png',
                          height: 40.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'SummiShelf',
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'DM Serif Display',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 32.0,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) => Text(
                                  'Hi, ${currentUserDisplayName}',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                      ),
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  functions.getGreetings(),
                                  'Good day',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ].divide(SizedBox(height: 4.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          functions.getRandomMessage(),
                          'No Message',
                        ),
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.bold,
                                ),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation']!),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 4.0),
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.searchTextFieldController,
                              focusNode: _model.searchTextFieldFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.searchTextFieldController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Enter book ISBN',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontWeight: FontWeight.w500,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 20.0),
                                prefixIcon: Icon(
                                  Icons.book_outlined,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                suffixIcon: _model.searchTextFieldController!
                                        .text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.searchTextFieldController
                                              ?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 18.0,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context).bodyLarge,
                              keyboardType: TextInputType.number,
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              validator: _model
                                  .searchTextFieldControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            var _shouldSetState = false;
                            if (_model.searchTextFieldController.text != null &&
                                _model.searchTextFieldController.text != '') {
                              _model.apiResultvoi =
                                  await GetBookByISBNCall.call(
                                isbn:
                                    'isbn:${_model.searchTextFieldController.text}',
                                apiKey: FFAppState().apiKey,
                              );
                              _shouldSetState = true;
                              if ((_model.apiResultvoi?.succeeded ?? true)) {
                                if (GetBookByISBNCall.title(
                                          (_model.apiResultvoi?.jsonBody ?? ''),
                                        ) !=
                                        null &&
                                    GetBookByISBNCall.title(
                                          (_model.apiResultvoi?.jsonBody ?? ''),
                                        ) !=
                                        '') {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    useSafeArea: true,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.72,
                                            child: SaveBookComponentWidget(
                                              title: GetBookByISBNCall.title(
                                                (_model.apiResultvoi
                                                        ?.jsonBody ??
                                                    ''),
                                              )!,
                                              subtitle:
                                                  GetBookByISBNCall.subtitle(
                                                (_model.apiResultvoi
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              description:
                                                  GetBookByISBNCall.description(
                                                (_model.apiResultvoi
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              thumbnail:
                                                  GetBookByISBNCall.thumbnail(
                                                (_model.apiResultvoi
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'No matching book found',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                setState(() {
                                  _model.searchTextFieldController?.clear();
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'No matching book found',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                          ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }
                            } else {
                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            if (_shouldSetState) setState(() {});
                          },
                          text: 'Search',
                          options: FFButtonOptions(
                            width: 140.0,
                            height: 44.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          showLoadingIndicator: false,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 4.0),
                          child: Text(
                            'Or search using barcode',
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            var _shouldSetState = false;
                            setState(() {
                              _model.psvScanOutput = '0';
                            });
                            _model.scanOutput =
                                await FlutterBarcodeScanner.scanBarcode(
                              '#C62828', // scanning line color
                              'Cancel', // cancel button text
                              true, // whether to show the flash icon
                              ScanMode.BARCODE,
                            );

                            _shouldSetState = true;
                            setState(() {
                              _model.psvScanOutput = _model.scanOutput!;
                            });
                            if (_model.psvScanOutput != null &&
                                _model.psvScanOutput != '') {
                              _model.apiResultvoiScan =
                                  await GetBookByISBNCall.call(
                                isbn: 'isbn:${_model.psvScanOutput}',
                                apiKey: FFAppState().apiKey,
                              );
                              _shouldSetState = true;
                              if ((_model.apiResultvoiScan?.succeeded ??
                                  true)) {
                                if (GetBookByISBNCall.title(
                                          (_model.apiResultvoiScan?.jsonBody ??
                                              ''),
                                        ) !=
                                        null &&
                                    GetBookByISBNCall.title(
                                          (_model.apiResultvoiScan?.jsonBody ??
                                              ''),
                                        ) !=
                                        '') {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    useSafeArea: true,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.72,
                                            child: SaveBookComponentWidget(
                                              title: GetBookByISBNCall.title(
                                                (_model.apiResultvoiScan
                                                        ?.jsonBody ??
                                                    ''),
                                              )!,
                                              subtitle:
                                                  GetBookByISBNCall.subtitle(
                                                (_model.apiResultvoiScan
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              description:
                                                  GetBookByISBNCall.description(
                                                (_model.apiResultvoiScan
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              thumbnail:
                                                  GetBookByISBNCall.thumbnail(
                                                (_model.apiResultvoiScan
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  setState(() {
                                    _model.psvScanOutput = '0';
                                  });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'No matches found for ISBN [${_model.psvScanOutput}]. Try manual search by using ISBN printed on book.',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  setState(() {
                                    _model.psvScanOutput = '0';
                                  });
                                }

                                if (_shouldSetState) setState(() {});
                                return;
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'A Books API error has occured. Failed to get book information',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                          ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                                if (_shouldSetState) setState(() {});
                                return;
                              }
                            } else {
                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            if (_shouldSetState) setState(() {});
                          },
                          child: Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Container(
                              width: 56.0,
                              height: 56.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 8.0, 8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: SvgPicture.asset(
                                    Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? 'assets/images/barcode_scanner_FILLf_wght400_GRAD0_opsz24.svg'
                                        : 'assets/images/barcode_scanner_FILL0_wght400_GRAD0_opsz24.svg',
                                    width: 32.0,
                                    height: 32.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (valueOrDefault<bool>(
                                currentUserDocument?.isFreeUser, false) ==
                            true)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 50.0,
                                      constraints: BoxConstraints(
                                        minWidth: 530.0,
                                      ),
                                      decoration: BoxDecoration(),
                                      child: FlutterFlowAdBanner(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 50.0,
                                        showsTestAd: true,
                                        iOSAdUnitID:
                                            'ca-app-pub-2902584978304943/4222979098',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                ]
                    .divide(SizedBox(height: 24.0))
                    .addToStart(SizedBox(height: 64.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
