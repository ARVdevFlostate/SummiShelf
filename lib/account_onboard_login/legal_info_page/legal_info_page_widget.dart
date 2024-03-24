import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'legal_info_page_model.dart';
export 'legal_info_page_model.dart';

class LegalInfoPageWidget extends StatefulWidget {
  const LegalInfoPageWidget({super.key});

  @override
  State<LegalInfoPageWidget> createState() => _LegalInfoPageWidgetState();
}

class _LegalInfoPageWidgetState extends State<LegalInfoPageWidget> {
  late LegalInfoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LegalInfoPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.psvSelectedChip = 'Privacy Policy';
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: Align(
        alignment: AlignmentDirectional(0.0, -1.0),
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxWidth: 570.0,
          ),
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // This row exists for when the "app bar" is hidden on desktop, having a way back for the user can work well.
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 64.0, 0.0, 8.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed('ProfilePage');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 16.0,
                          buttonSize: 60.0,
                          icon: Icon(
                            Icons.arrow_back_outlined,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            context.goNamed('ProfilePage');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Legal Information',
                    style: FlutterFlowTheme.of(context).displaySmall,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 16.0),
                  child: FlutterFlowChoiceChips(
                    options: [
                      ChipData('Privacy Policy'),
                      ChipData('Terms & Conditions')
                    ],
                    onChanged: (val) async {
                      setState(
                          () => _model.choiceChipsValue = val?.firstOrNull);
                      setState(() {
                        _model.psvSelectedChip = _model.choiceChipsValue!;
                      });
                    },
                    selectedChipStyle: ChipStyle(
                      backgroundColor: FlutterFlowTheme.of(context).accent1,
                      textStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.w500,
                              ),
                      iconColor: FlutterFlowTheme.of(context).primaryText,
                      iconSize: 18.0,
                      labelPadding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 12.0, 6.0),
                      elevation: 0.0,
                      borderColor: FlutterFlowTheme.of(context).primary,
                      borderWidth: 2.0,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    unselectedChipStyle: ChipStyle(
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Readex Pro',
                                fontWeight: FontWeight.normal,
                              ),
                      iconColor: FlutterFlowTheme.of(context).secondaryText,
                      iconSize: 18.0,
                      labelPadding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 12.0, 6.0),
                      elevation: 0.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    chipSpacing: 16.0,
                    rowSpacing: 12.0,
                    multiselect: false,
                    initialized: _model.choiceChipsValue != null,
                    alignment: WrapAlignment.start,
                    controller: _model.choiceChipsValueController ??=
                        FormFieldController<List<String>>(
                      ['Privacy Policy'],
                    ),
                    wrapped: false,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Builder(
                            builder: (context) {
                              if (_model.psvSelectedChip == 'Privacy Policy') {
                                return MarkdownBody(
                                  data: '''---
Amit Vidyasagar built the SummiShelf app as an ad-supported app. This service is provided by Amit Vidyasagar at no cost and is intended for use as is.

This page is used to inform visitors regarding my policies with the collection, use, and disclosure of personal information if anyone decided to use my service.

If you choose to use my service, then you agree to the collection and use of information in relation to this policy. The personal information that I collect is used for providing and improving the service. I will not use or share your information with anyone except as described in this privacy policy.

The terms used in this privacy policy have the same meanings as in our terms and conditions, which are accessible at SummiShelf unless otherwise defined in this privacy policy.

**Information Collection and Use**

For a better experience, while using our service, I may require you to provide us with certain personally identifiable information, including but not limited to name, email. The information that I request will be retained on your device and is not collected by me in any way.

The app does use third-party services that may collect information used to identify you.

Link to the privacy policy of third-party service providers used by the app
*   Google Play Services - (https://www.google.com/policies/privacy/)
*   AdMob - (https://support.google.com/admob/answer/6128543?hl=en)
*   Google Analytics for Firebase - (https://firebase.google.com/support/privacy)
*   Firebase Crashlytics - (https://firebase.google.com/support/privacy/)

**Log Data**

I want to inform you that whenever you use my service, in a case of an error in the app I collect data and information (through third-party products) on your phone called log data. This log data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my service, the time and date of your use of the service, and other statistics.

**Cookies**

Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.

This service does not use these “cookies” explicitly. However, the app may use third-party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this service.

**Service Providers**

I may employ third-party companies and individuals due to the following reasons:
*   To facilitate our service;
*   To provide the service on our behalf;
*   To perform service-related activities; or
*   To analyze how our service is used.

I want to inform users of this service that these third parties have access to their personal information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.

**Security**

I value your trust in providing us your personal information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.

**Links to Other Sites**

This service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the privacy policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.

**Children’s Privacy**

These services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13 years of age. In the case I discover that a child under 13 has provided me with personal information, I'll immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do the necessary actions.

**Changes to This Privacy Policy**

I may update our privacy policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new privacy policy on this page.

**Contact Us**

If you have any questions, suggestions about my privacy policy, or need support for my service/ app, do not hesitate to contact me at arv.dev.flostate@gmail.com
 
''',
                                  selectable: true,
                                  onTapLink: (_, url, __) => launchURL(url!),
                                );
                              } else {
                                return MarkdownBody(
                                  data: '''---
By downloading or using the SummiShelf app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages or make derivative versions. The app itself, and all the trademarks, copyright, database rights, and other intellectual property rights related to it, still belong to Amit Vidyasagar.

Amit Vidyasagar is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.

The SummiShelf app stores and processes personal data that you have provided to us, to provide my service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the SummiShelf app won’t work properly or at all.

The app does use third-party services that declare their terms and conditions.

Link to terms and conditions of third-party service providers used by the app

*   Google Play Services - (https://policies.google.com/terms)
*   AdMob - (https://developers.google.com/admob/terms)
*   Google Analytics for Firebase - (https://www.google.com/analytics/terms/)
*   Firebase Crashlytics - (https://firebase.google.com/terms/crashlytics)

You should be aware that there are certain things that Amit Vidyasagar will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi or provided by your mobile network provider, but Amit Vidyasagar cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left.

If you’re using the app outside of an area with Wi-Fi, you should remember that the terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third-party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.

Along the same lines, Amit Vidyasagar cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, Amit Vidyasagar cannot accept responsibility.

With respect to Amit Vidyasagar’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavour to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. Amit Vidyasagar accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.

At some point, we may wish to update the app. The app is currently available on Android & iOS – the requirements for the both systems (and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. Amit Vidyasagar does not promise that it will always update the app so that it is relevant to you and/or works with the Android & iOS version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.

**Changes to this Terms & Conditions**

I may update our terms and conditions from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new terms and conditions on this page.

These terms and conditions are effective as of 2024-02-27

**Contact Us**

If you have any questions, suggestions about terms and conditions, or need support for my service/ app, do not hesitate to contact me at arv.dev.flostate@gmail.com.
''',
                                  selectable: true,
                                  onTapLink: (_, url, __) => launchURL(url!),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
