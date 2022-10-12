import 'package:bloc/bloc.dart';
import 'package:log_registration_bloc/http_post/bloc/app_event.dart';
import 'package:log_registration_bloc/http_post/bloc/app_state.dart';
import 'package:log_registration_bloc/http_post/repo/product_repo.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository}) : super(InitialState()) {
    on<Create>((event, emit) async {
      emit(ProductAdding());
      await Future.delayed(const Duration(seconds: 1));
      try {
        await productRepository.create(name: event.name, price: event.price);
        emit(ProductAdded());
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
