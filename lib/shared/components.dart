import 'package:flutter/material.dart';
import 'package:taskwithfirebase/models/product_models.dart';
import 'package:taskwithfirebase/screens/add_product/cubit.dart';

PreferredSizeWidget buildAppBar({
  required Widget title,
  Widget? leading,
}) =>
    AppBar(
      elevation: 0.0,
      title: title,
      leading: leading,
    );

Widget buildProductItem(context, ProductModel model) => Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                model.description,
                style: Theme.of(context).textTheme.caption,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '${model.price}  K.D',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );

Widget buildTextFormField({
  required TextInputType type,
  Widget? suffix,
  required TextEditingController controller,
  ValueChanged<String>? onChanged,
  GestureTapCallback? onTap,
  FormFieldValidator<String>? validator,
  required String text,
  required BuildContext context,
}) =>
    Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(50.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            onTap: onTap,
            onChanged: onChanged,
            keyboardType: type,
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              hintText: text,
              hintStyle: Theme.of(context).textTheme.headline4,
              border: InputBorder.none,
              suffixIcon: Padding(
                  padding: const EdgeInsets.only(top: 6.0), child: suffix,),

            ),
          ),
        ));

Future navigatorTo(context, Widget widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );

Container buildButton(BuildContext context, String text) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        color: AddProductCubit.get(context).isActive
            ? Theme.of(context).primaryColor
            : Theme.of(context).shadowColor.withOpacity(.5),
        borderRadius: BorderRadius.circular(40)),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Center(
        child: Text(text,
            style: AddProductCubit.get(context).isActive
                ? Theme.of(context).textTheme.subtitle2
                : Theme.of(context).textTheme.subtitle1),
      ),
    ),
  );
}
