abstract class AddProductStates {}

class ProductInitialState extends AddProductStates {}

class ProductAppNewProductLoadingState extends AddProductStates {}
class CheckSubmit extends AddProductStates {}

class ProductAppNewProductSuccessState extends AddProductStates {}

class ProductAppNewProductErrorState extends AddProductStates {
  final String error;

  ProductAppNewProductErrorState(this.error);
}

