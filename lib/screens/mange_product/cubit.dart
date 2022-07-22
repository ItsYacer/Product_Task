import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskwithfirebase/models/product_models.dart';
import 'package:taskwithfirebase/screens/mange_product/states.dart';

class MangeProductCubit extends Cubit<MangeProductStates> {
  static MangeProductCubit get(context) => BlocProvider.of(context);

  final TextEditingController searchController = TextEditingController();

  MangeProductCubit() : super(MangeProductInitialState());

  List<ProductModel> products = [];

  void getAllProduct() {
    products = [];
    emit(ProductGetAllProductsLoadingState());
    FirebaseFirestore.instance
        .collection('products')
        .orderBy('dateTime')
        .get()
        .then((value) {
      for (var element in value.docs) {
        products.add(ProductModel.formJson(element.data()));
      }
      print('products add');
      products = products.reversed.toList();
      emit(ProductGetAllProductsSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(ProductGetAllProductsErrorState(error));
    });
  }

  List<ProductModel> searchList = [];
  String? search;

  void searchItem(String item) {
    emit(ProductSearchStart());
    searchList = [];
    FirebaseFirestore.instance.collection('products').get().then((value) {
      for (var element in value.docs) {
        if (element['name'].toString().startsWith(item) ||
            element['description'].toString().startsWith(item) ||
            element['price'].toString().startsWith(item)) {
          searchList.add(ProductModel.formJson(element.data()));
        }
        searchList = searchList.toSet().toList();
        emit(ProductSearch());
      }

      products =[];
      getAllProduct();
    }).catchError((error) {});
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
