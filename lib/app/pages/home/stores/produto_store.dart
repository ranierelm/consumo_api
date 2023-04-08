import 'package:flutter/foundation.dart';
import 'package:study_api/app/data/http/exceptions.dart';
import 'package:study_api/app/data/models/produto_model.dart';
import 'package:study_api/app/data/repositories/produto_repository.dart';

class ProdutoStore {
  final IProdutoRepository repository;

  //loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  //state
  final ValueNotifier<List<ProdutoModel>> state =
      ValueNotifier<List<ProdutoModel>>([]);

  //error
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  ProdutoStore({required this.repository});

  Future getProdutos() async {
    isLoading.value = true;

    try {
      final result = await repository.getProdutos();

      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } on UnauthorizedException catch (e) {
      erro.value = e.message;
    } on InternalErrorException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}
