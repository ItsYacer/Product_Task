import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskwithfirebase/screens/mange_product/cubit.dart';
import 'package:taskwithfirebase/shared/bloc_observer.dart';
import 'package:taskwithfirebase/screens/add_product/cubit.dart';
import 'package:taskwithfirebase/shared/themes.dart';
import 'screens/mange_product/manage_products.dart';


Future main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  BlocOverrides.runZoned(
        () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>AddProductCubit()..checkButton(),),
        BlocProvider(
          create: (BuildContext context) =>MangeProductCubit()..getAllProduct(),),
      ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTHeme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system,
          home: const ManageProducts(),
        ),

    );

  }

}
