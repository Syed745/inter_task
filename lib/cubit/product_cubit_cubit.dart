import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trainee_test/model/product/product.dart';
import 'package:flutter_trainee_test/repository/product_data_repo.dart';

part 'product_cubit_state.dart';

class ProductCubitCubit extends Cubit<ProductCubitState> {
  ProductCubitCubit() : super(ProductCubitInitial());

  FakeStoreApiService fakeStoreApiService = FakeStoreApiService();

  void productDataFromCubit() async {
    try {
      List<Product> postProduct = await fakeStoreApiService.getProducts();
      emit(ProductLoaded(postProduct as Product));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
