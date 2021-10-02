import 'package:bin_2_dec/providers/calculo.dart';
import 'package:bin_2_dec/providers/colors_providers.dart';
import 'package:bin_2_dec/routes/app_routes.dart';
import 'package:bin_2_dec/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Calcular>(create: (_) => Calcular()),
        ChangeNotifierProvider<ColorsProvider>(create: (_) => ColorsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          Routes.homePage: (ctx) => const HomePage(),
        },
      ),
    );
  }
}
