import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskwithfirebase/screens/mange_product/cubit.dart';
import 'package:taskwithfirebase/screens/mange_product/manage_products.dart';
import 'package:taskwithfirebase/shared/components.dart';
import 'package:taskwithfirebase/screens/add_product/cubit.dart';
import 'package:taskwithfirebase/screens/add_product/status.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

// ignore: must_be_immutable
class AddProduct extends StatelessWidget {
  AddProduct({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductStates>(
      listener: (context, state) {
        if (state is ProductAppNewProductSuccessState) {
          MangeProductCubit.get(context).getAllProduct();
        }
      },
      builder: (context, state) {
        AddProductCubit cubit = AddProductCubit.get(context);
        return Scaffold(
          appBar: buildAppBar(
            title: const Center(child: Text('Add Product        ')),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  cubit.productName.clear();
                  cubit.productPrice.clear();
                  cubit.productDescription.clear();
                  cubit.isActive = false;
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 24,
                )),
          ),
          body: Container(
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    buildTextFormField(
                      context: context,
                      type: TextInputType.text,
                      controller: cubit.productName,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ' Name must be not empty';
                        }
                        if (value.length < 3) {
                          return 'Name should be 3 characters or more';
                        }
                        return null;
                      },
                      text: 'Product Name',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    buildTextFormField(
                      context: context,
                      type: TextInputType.text,
                      controller: cubit.productDescription,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'description must be not empty';
                        }
                        if (value.length < 3) {
                          return 'description should be 3 characters or more';
                        }
                        return null;
                      },
                      text: 'Product Description',
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    buildTextFormField(
                      context: context,
                      type: TextInputType.number,
                      controller: cubit.productPrice,
                      suffix: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 7),
                        child: Text(
                          'K.D',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'price must be not empty';
                        }
                        return null;
                      },
                      text: 'Product Price',
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TapBounceContainer(
                      onTap: cubit.isActive
                          ? () {
                              cubit.checkButton();
                              if (formKey.currentState!.validate()) {
                                cubit.appProduct(
                                    name: cubit.productName.text,
                                    description: cubit.productDescription.text,
                                    price: cubit.productPrice.text,
                                    dateTime: DateTime.now().toString());
                                cubit.productName.clear();
                                cubit.productDescription.clear();
                                cubit.productPrice.clear();
                                cubit.isActive = false;
                                showTopSnackBar(
                                  context,
                                  CustomSnackBar.success(
                                    borderRadius: kDefaultBorderRadius,
                                    boxShadow: const [
                                      BoxShadow(
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                      ),
                                    ],
                                    backgroundColor:
                                        Theme.of(context).cardColor,
                                    messagePadding: EdgeInsets.zero,
                                    message:
                                        " ✔ Product was added successfully",
                                    textStyle: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                    icon: const Text(''),
                                  ),
                                  padding: EdgeInsets.zero,
                                );
                                MangeProductCubit.get(context).getAllProduct();
                                navigateAndFinish(
                                    context, const ManageProducts());
                              }
                            }
                          : null,
                      child: buildButton(context, "Submit"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
