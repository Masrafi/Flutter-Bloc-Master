import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:log_registration_bloc/http_post/model/model.dart';

@immutable
abstract class ProductState extends Equatable {}

class InitialState extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductAdding extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductAdded extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductError extends ProductState {
  final String error;

  ProductError(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//get
class ProductLoading extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductLoaded extends ProductState {
  List<ProductModel> mydata;
  ProductLoaded(this.mydata);

  @override
  // TODO: implement props
  List<Object?> get props => [mydata];
}
