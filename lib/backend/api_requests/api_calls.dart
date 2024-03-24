import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetBookByISBNCall {
  static Future<ApiCallResponse> call({
    String? isbn = 'isbn:',
    String? apiKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getBookByISBN',
      apiUrl: 'https://www.googleapis.com/books/v1/volumes',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'q': isbn,
        'key': apiKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].volumeInfo.title''',
      ));
  static String? subtitle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].volumeInfo.subtitle''',
      ));
  static String? description(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.items[:].volumeInfo.description''',
      ));
  static String? thumbnail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].volumeInfo.imageLinks.thumbnail''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
