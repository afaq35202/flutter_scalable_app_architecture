import 'package:dio/dio.dart';
import 'package:dobby/core/utils/http_utils/api_response.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}
class MockResponse extends Mock implements ApiResponse {}
class MockInterceptors extends Mock implements Interceptors {}
class MockGoRouter extends Mock implements GoRouter {}
