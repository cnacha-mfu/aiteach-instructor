import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start github Group Code

class GithubGroup {
  static String baseUrl = 'https://api.github.com';
  static Map<String, String> headers = {
    'Authorization': 'Bearer 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',
  };
  static GetGithubGradeCall getGithubGradeCall = GetGithubGradeCall();
}

class GetGithubGradeCall {
  Future<ApiCallResponse> call({
    String? asgId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetGithubGrade',
      apiUrl: '${GithubGroup.baseUrl}/assignments/$asgId/grades',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer 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',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].assignment_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? username(dynamic response) => (getJsonField(
        response,
        r'''$[:].github_username''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? pointsawarded(dynamic response) => (getJsonField(
        response,
        r'''$[:].points_awarded''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? pointsavailable(dynamic response) => (getJsonField(
        response,
        r'''$[:].points_available''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End github Group Code

class CreateTaskCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? courseId = '',
    String? lessonSeq = '',
    String? activityId = '',
    String? thought = '',
  }) async {
    final ffApiRequestBody = '''
{
  "course": "$courseId",
  "lesson_seq": "$lessonSeq",
  "activity_id": "$activityId",
  "thought": "$thought"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateTask',
      apiUrl:
          'https://aiteach-api-worker-vspeiarlpa-uc.a.run.app/task/$userId',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'xY7aLp9bZ4cFg2hV5dRqK1sE8oUjW6iGL3mN9vI8bXz2yH6a',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class QueryCall {
  static Future<ApiCallResponse> call({
    String? courseId = '',
    String? query = '',
  }) async {
    final ffApiRequestBody = '''
{
  "query": "$query"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Query',
      apiUrl:
          'https://aiteach-api-generator-vspeiarlpa-uc.a.run.app/generator/query/$courseId',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'xY7aLp9bZ4cFg2hV5dRqK1sE8oUjW6iGL3mN9vI8bXz2yH6a',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response''',
      ));
}

class ResetCall {
  static Future<ApiCallResponse> call({
    String? courseId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Reset',
      apiUrl:
          'https://aiteach-api-generator-vspeiarlpa-uc.a.run.app/generator/reset/$courseId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'xY7aLp9bZ4cFg2hV5dRqK1sE8oUjW6iGL3mN9vI8bXz2yH6a',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response''',
      ));
}

class IndexCall {
  static Future<ApiCallResponse> call({
    String? courseId = '',
    String? referenceId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Index',
      apiUrl:
          'https://aiteach-api-generator-vspeiarlpa-uc.a.run.app/generator/index/$courseId/$referenceId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'xY7aLp9bZ4cFg2hV5dRqK1sE8oUjW6iGL3mN9vI8bXz2yH6a',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response''',
      ));
}

class GenerateContentCall {
  static Future<ApiCallResponse> call({
    String? courseId = '',
    String? activityId = '',
    int? lessonSeq,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GenerateContent',
      apiUrl:
          'https://aiteach-api-generator-vspeiarlpa-uc.a.run.app/generator/content/$courseId/$activityId/$lessonSeq',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'xY7aLp9bZ4cFg2hV5dRqK1sE8oUjW6iGL3mN9vI8bXz2yH6a',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
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
