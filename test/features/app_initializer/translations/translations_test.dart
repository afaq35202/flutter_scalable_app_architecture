import 'package:dio/dio.dart';
import 'package:dobby/core/services/dio_client.dart';
import 'package:dobby/core/utils/http_utils/api_response.dart';
import 'package:dobby/core/utils/http_utils/enum_methods.dart';
import 'package:dobby/shared/features/translations/data/repositories/translations_reporitory.dart';
import 'package:dobby/shared/features/translations/data/services/translations_service.dart';
import 'package:dobby/shared/features/translations/data/source/app_initializer_end_points.dart';
import 'package:dobby/shared/features/translations/domain/repositories_imp/translations_repository_imp.dart';
import 'package:dobby/shared/features/translations/domain/usecases/get_translations_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../testing/mocks.dart';

void main() {
  late MockDio mockDio;
  late DioClient dioClient;
  late TranslationsService translationsService;
  late TranslationsRepository translationsRepository;
  late GetTranslationsUseCase getTranslationsUseCase;

  setUp(() {
    mockDio = MockDio();
    dioClient = DioClient(dio: mockDio);
    translationsService = TranslationsService(dioClient);
    translationsRepository = TranslationsRepositoryImp(translationsService);
    getTranslationsUseCase = GetTranslationsUseCase(translationsRepository);
  });
  group('DioClient.request', () {
    test('returns success ApiResponse on 200 response', () async {
      final mockData = {
        "message": {"info": "Info"},
      };
      final mockParsed = {"info": "Info"};

      final mockResponse = ApiResponse.success(
        mockData,
        requestOptions: RequestOptions(path: '/test'),
        statusCode: 200,
      );

      when(
        () => mockDio.request(
          "https://uat.selecta.dobby.i${AppInitializerEndPoints.getTranslations}",
          data: any(named: 'data'),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
        ),
      ).thenAnswer((_) async => mockResponse);

      final result = await dioClient.request<Map<String, dynamic>>(
        path:  "https://uat.selecta.dobby.i${AppInitializerEndPoints.getTranslations}",
        method: HttpMethod.get,
        parser: (json) => json['message'] as Map<String, dynamic>,
        headers: {"origin":"mobile"}
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
