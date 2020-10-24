import 'dart:io';

import 'package:dio/dio.dart';
import 'package:loja_virtual/models/cep_aberto_address.dart';

const token = '0bb497d802b34e7ad764b54b7cc35c16';

class CepAbertoService {
  Future<CepAbertoAddress> GetAddressFromCep(String cep) async {
    final cleanCep = cep.replaceAll('.', '').replaceAll('-', '');

    final endPoint = "https://www.cepaberto.com/api/v3/cep?cep=$cleanCep";

    final Dio dio = Dio();

    dio.options.headers[HttpHeaders.authorizationHeader] = 'Token token=$token';

    try {
      final response = await dio.get<Map<String, dynamic>>(endPoint);

      if (response.data.isEmpty) {
        return Future.error('CEP inválido');
      }

      final CepAbertoAddress address = CepAbertoAddress.fromMap(response.data);

      return address;
    } on DioError catch (e) {
      return Future.error('Erro ao buscar CEP');
    }
  }
}
