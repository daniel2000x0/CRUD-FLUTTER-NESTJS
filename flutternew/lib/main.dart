import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutternew/src/Page/ui/product_ui.dart';


void main() async {



   runApp(const ProviderScope(child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // oculta  el  banner 
      debugShowCheckedModeBanner: false,
      //titulo de la app
      title: 'CRUD POSTGRESQL FLUTTER - FLUTTER_RIVERPOD',
      //thema  principal
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //  vista de inicio 
      home: const ProductUi(),
    );
  }
}