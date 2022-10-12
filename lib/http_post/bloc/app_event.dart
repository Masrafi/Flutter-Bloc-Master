import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Create extends ProductEvent {
  final String name;
  final String price;

  Create(this.name, this.price);
}
