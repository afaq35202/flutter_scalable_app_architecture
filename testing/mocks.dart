import 'package:dio/dio.dart';
import 'package:yellowrock/core/utils/http_utils/api_response.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}
class MockResponse extends Mock implements ApiResponse {}