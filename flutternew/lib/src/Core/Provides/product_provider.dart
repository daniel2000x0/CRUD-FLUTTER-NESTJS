import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutternew/src/Data/controllers/product_controller.dart';
import '../../Data/models/product_models.dart';


//roverpod  manejo de  estados  de  la aplicacion
//statanotifierProvide forma de  manejar reactiva 
//statenotifier  una  clase que puede cambiar de estado los  widgets observan  para que se actualizen cuando el  estado cambie
///prodcutController manejo de la logica de la aplicion
// AsyncValue<List<Product>>estado  que maneja  el  controller Asyncvalue proporcionada por  riverpod  representa  estado  asyncromaticos 

final productControllerProvider =
    StateNotifierProvider<ProductController, AsyncValue<List<Product>>>(
  (ref) => ProductController(ref),
);

final productsProvider = productControllerProvider;