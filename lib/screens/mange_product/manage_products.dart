import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskwithfirebase/models/product_models.dart';
import 'package:taskwithfirebase/screens/mange_product/cubit.dart';
import 'package:taskwithfirebase/screens/mange_product/states.dart';
import 'package:taskwithfirebase/shared/components.dart';
import 'package:taskwithfirebase/screens/add_product/add_product_screen.dart';

class ManageProducts extends StatelessWidget {
  const ManageProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MangeProductCubit, MangeProductStates>(
      listener: (context, state) {},
      builder: (context, state) {
        MangeProductCubit cubit = MangeProductCubit.get(context);
        List<ProductModel> myList = cubit.searchController.text.isEmpty
            ? cubit.products
            : cubit.searchList;
        return Scaffold(
          appBar:
              buildAppBar(title: const Center(child: Text('Manage Products'))),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              decoration:
                  BoxDecoration(color: Theme.of(context).backgroundColor),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(50.0)),
                      child: buildTextFormField(
                          onChanged: (value) {
                            cubit.searchItem(value);
                          },
                          context: context,
                          type: TextInputType.text,
                          controller:
                              MangeProductCubit.get(context).searchController,
                          text: 'Search product',
                          suffix: Icon(Icons.search,color:Theme.of(context).canvasColor,)),
                    ),
                    const SizedBox(
                      height: 7.0,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return buildProductItem(context, myList[index]);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 7.0,
                      ),
                      itemCount: myList.length,
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 41, right: 9.1),
            child: SizedBox(
              height: 40.0,
              width: double.infinity,
              child: FloatingActionButton.extended(
                onPressed: () {
                  cubit.searchController.clear();
                  navigatorTo(context, AddProduct());
                },
                backgroundColor: Theme.of(context).primaryColor,
                label: Center(
                    child: Text(
                  'Add Product',
                  style: Theme.of(context).textTheme.subtitle2,
                )),
              ),
            ),
          ),
        );
      },
    );
  }
}
