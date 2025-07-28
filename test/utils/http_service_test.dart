import 'package:dio/dio.dart';
import 'package:yellowrock/core/services/dio_client.dart';
import 'package:yellowrock/core/utils/http_utils/api_response.dart';
import 'package:yellowrock/core/utils/http_utils/enum_methods.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../testing/mocks.dart';

void main() {
  late MockDio mockDio;
  late DioClient dioClient;

  setUp(() {
    mockDio = MockDio();
    dioClient = DioClient(dio: mockDio);
  });
  group('DioClient.request', () {
    test('returns success ApiResponse on 200 response', () async {
      final mockData = {'message': 'hello'};
      final mockParsed = 'hello';

      final mockResponse = ApiResponse.success(
        mockData,
        requestOptions: RequestOptions(path: '/test'),
        statusCode: 200
      );

      when(
        () => mockDio.request(
          any(),
          data: any(named: 'data'),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
        ),
      ).thenAnswer((_) async => mockResponse);

      final result = await dioClient.request<String>(
        path: '/test',
        method: HttpMethod.get,
        parser: (json) => json['message'] as String,
      );

      expect(result.success, isTrue);
      expect(result.data, equals(mockParsed));
      expect(result.statusCode, 200);
    });

    test('returns failure ApiResponse on DioError', () async {
      when(
        () => mockDio.request(
          any(),
          data: any(named: 'data'),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
        ),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/test'),
          type: DioExceptionType.connectionTimeout,
        ),
      );

      final result = await dioClient.request<String>(
        path: '/test',
        method: HttpMethod.get,
        parser: (_) => '',
      );

      expect(result.success, isFalse);
      expect(result.message, isNotNull);
    });
  });
}
