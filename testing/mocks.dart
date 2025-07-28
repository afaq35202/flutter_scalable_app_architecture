import 'package:dio/dio.dart';
import 'package:dobby/core/utils/http_utils/api_response.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}
class MockResponse extends Mock implements ApiResponse {}