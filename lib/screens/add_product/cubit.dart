import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskwithfirebase/screens/add_product/status.dart';
import 'package:taskwithfirebase/models/product_models.dart';

class AddProductCubit extends Cubit<AddProductStates> {
  static AddProductCubit get(context) => BlocProvider.of(context);

  final TextEditingController productName = TextEditingController();
  final TextEditingController productDescription = TextEditingController();
  final TextEditingController productPrice = TextEditingController();

  AddProductCubit() : super(ProductInitialState());

  void appProduct({
    required String name,
    required String description,
    required String price,
    required String dateTime,
  }) {
    emit(ProductAppNewProductLoadingState());
    ProductModel model = ProductModel(
        name: name,
        description: description,
        price: price,
        dateTime: dateTime,
        productId: '');
    FirebaseFirestore.instance
        .collection('products')
        .add(model.toMap())
        .then((value) {
      FirebaseFirestore.instance
          .collection('products')
          .doc(value.id)
          .update({'productId': value.id});
      emit(ProductAppNewProductSuccessState());
    }).catchError((error) {
      emit(ProductAppNewProductErrorState(error.toString()));
    });
  }


  bool isActive = false;
  bool nameTrue = false;
  bool descriptionTrue = false;

  void checkButton() {
    productName.addListener(() {
      if (productName.text.isNotEmpty) {
        nameTrue = true;
      } else {
        nameTrue = false;
      }
    });
    productDescription.addListener(() {
      if (productDescription.text.isNotEmpty) {
        descriptionTrue = true;
      } else {
        descriptionTrue = false;
      }
    });
    productPrice.addListener(() {
      if (productPrice.text.isNotEmpty && nameTrue && descriptionTrue) {
        isActive = true;
        emit(CheckSubmit());
      }
    });
  }

  @override
  Future<void> close() {
    productName.dispose();
    productDescription.dispose();
    productPrice.dispose();
    return super.close();
  }
}
