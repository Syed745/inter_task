part of 'product_cubit_cubit.dart';

@immutable
sealed class ProductCubitState {}

final class ProductCubitInitial extends ProductCubitState {}

final class ProductLoaded extends ProductCubitState {
  final Product product;

  ProductLoaded(this.product);
}

final class ProductLoading extends ProductCubitState {}

final class ProductError extends ProductCubitState {
  final String errorMessage;
  ProductError(this.errorMessage);
}
