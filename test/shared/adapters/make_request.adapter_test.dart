import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:growbase_mobile_flutter/shared/adapters/make_request.adapter.dart';
import 'package:growbase_mobile_flutter/shared/dtos/invalid_field.dto.dart';
import 'package:growbase_mobile_flutter/shared/errors/failures.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  final dio = MockDio();
  Future<bool> func() async {
    await dio.get('/any_path');
    return true;
  }

  group('MakeRequest', () {
    test('Deve retornar um Right com true', () async {
      when(() => dio.get(any())).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: {
            'success': true,
            'code': 200,
          },
          statusCode: 200,
        ),
      );

      final result = await makeRequest(() => func());

      expect(result.isRight(), isTrue);
      expect(result.fold(id, id), isTrue);
    });

    test('Deve retornar um Left com BadRequestFailure', () async {
      when(() => dio.get(any())).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          data: {
            'success': false,
            'code': 400,
            'error': {
              'process': 'any',
              'message': 'any_message',
              'details': [
                {
                  'field': 'any_field',
                  'message': 'any_message',
                },
              ],
            }
          },
          statusCode: 400,
        ),
      ));

      final result = await makeRequest(() => func());

      expect(result.isLeft(), isTrue);
      expect(
        result.fold(id, id),
        BadRequestFailure(
          'any_message',
          [
            InvalidFieldDto(
              field: 'any_field',
              message: 'any_message',
            ),
          ],
        ),
      );
    });

    test('Deve retornar um Left com NotFoundFailure', () async {
      when(() => dio.get(any())).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          data: {
            'success': false,
            'code': 404,
            'error': {
              'process': 'any',
              'message': 'any_message',
              'details': [],
            }
          },
          statusCode: 404,
        ),
      ));

      final result = await makeRequest(() => func());

      expect(result.isLeft(), isTrue);
      expect(result.fold(id, id), NotFoundFailure('any_message'));
    });

    test('Deve retornar um Left com UnauthorizedFailure', () async {
      when(() => dio.get(any())).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          data: {
            'success': false,
            'code': 401,
            'error': {
              'process': 'any',
              'message': 'any_message',
              'details': [],
            }
          },
          statusCode: 401,
        ),
      ));

      final result = await makeRequest(() => func());

      expect(result.isLeft(), isTrue);
      expect(result.fold(id, id), UnauthorizedFailure('any_message'));
    });

    test('Deve retornar um Left com ServerFailure', () async {
      when(() => dio.get(any())).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          data: {
            'success': false,
            'code': 500,
            'error': {
              'process': 'any',
              'message': 'any_message',
              'details': [],
            }
          },
          statusCode: 500,
        ),
      ));

      final result = await makeRequest(() => func());

      expect(result.isLeft(), isTrue);
      expect(result.fold(id, id), ServerFailure('any_message'));
    });
  });
}
