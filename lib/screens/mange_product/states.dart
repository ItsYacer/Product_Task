abstract class MangeProductStates {}

class MangeProductInitialState extends MangeProductStates {}


class ProductGetAllProductsLoadingState extends MangeProductStates {}

class ProductGetAllProductsSuccessState extends MangeProductStates {}

class ProductGetAllProductsErrorState extends MangeProductStates {
  final String error;

  ProductGetAllProductsErrorState(this.error);
}

class ProductSearch extends MangeProductStates {}
class ProductSearchStart extends MangeProductStates {}
class ProductSearchEnd extends MangeProductStates {}