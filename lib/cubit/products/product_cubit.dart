import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:app/model/shoes.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductInitial()) {
    loadData();
  }
  final ProductRepository productRepository = ProductRepositoryImpl();

  Future<void> loadData() async {
    try {
      emit(const ProductLoading());
      final items = await productRepository.fetchProduct();
      emit(ProductLoaded(shoes: items));
    } catch (_) {
      emit(const ProductError("ERROR"));
    }
  }
}
