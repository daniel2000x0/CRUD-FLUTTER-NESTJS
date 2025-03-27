import 'package:flutter/foundation.dart';
import 'package:flutternew/src/Data/service/app_exceptions.dart';
import 'package:flutternew/src/Core/Provides/product_provider.dart';
import 'package:flutternew/src/Data/controllers/product_controller.dart';
import 'package:flutternew/src/Data/models/product_models.dart';
enum ProductState {INITIAL,LOADING, LOADED, EMPTY, ERROR}
class ProductChangeNotifier with ChangeNotifier{
 final _productService = productsProvider;
 ProductState _productState = ProductState.INITIAL;
   List<Product> _products = []; 
  // Si ocurre algun error con las peticiones, la guardaremos aca.
  AppException _appException= AppException(0, '', '');
   ProductsChangeNotifier()
{
loadProductsFromServer();
}  
loadProductsFromServer() async{
     _setState(ProductState.LOADING);
try {
  _products = await  loadProductsFromServer();
  _setState(ProductState.LOADED);
} on AppException catch (appException) {
     _setFailure(appException);
}
     
  }



    // GET de los productos
  List<Product> get products => _products;

  // GET & SET del estado 
  ProductState get state => _productState;

  _setState(ProductState value) {
    _productState = value;
    notifyListeners();
  }

  // GET & SET de los errores
  AppException get failure => _appException;
  _setFailure(AppException value) {
    _appException = value;
    _setState(ProductState.ERROR);
  }
}