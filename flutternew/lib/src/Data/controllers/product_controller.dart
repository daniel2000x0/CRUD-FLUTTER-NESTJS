import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutternew/src/Data/service/api_base_helper.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product_models.dart';

const baseurl = '';
class ProductController extends StateNotifier<AsyncValue<List<Product>>>
{
    ProductController(this.ref): super(const AsyncValue.loading());
final Ref ref; 
// Add a  new  product 
  Future<void> addProduct(Product newProduct) async {
    try {
      final response = await http.post(
        Uri.parse('$baseurl/products'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(newProduct.toJson()),
       
      );
      print(response.statusCode);
      print(newProduct);
         Future.delayed(Duration(seconds: 2), () {
    print('This message is printed after 2 seconds');
  });
      if (response.statusCode == 200) {
        await reloadProducts();
      } else {
       
        throw Exception('Error add new product');
       
      }
    } catch (error) {
      throw Exception('Error addProduct: $error');
    }
  }

  //Funtion for load list products
  Future<void> loadProductsFromServer() async {
    var responseJson;
    try {

      final response =
          await http.get(Uri.parse('$baseurl/products/all'));
       responseJson = returnResponse(response);
      if (response.statusCode == 200) {
           final List<dynamic> data = json.decode(response.body);

      final List<Product> productList = data.map((item) {
        // Asegúrate de convertir 'price' a un double
        double? price = item['price'] != null ? double.tryParse(item['price'].toString()) : 0.0;
        
        return Product(
          id: item['id'],
          code: item['code'],
          description: item['description'],
          price: price,  // Asignar el precio convertido
          quantity: item['quantity']
        );
      }).toList();

      state = AsyncValue.data(productList);
       print(state);
     
      } else {
        throw Exception('Error load products');
      }
    } catch (error) {
      
     state = AsyncValue.error(error.toString(), StackTrace.current);
       throw Exception('Error loadProduct: $error');
    }
  }
/*
*reloadProduct - reload list  products 

*/
  Future<void> reloadProducts() async {
      state = const AsyncValue.loading();
    await loadProductsFromServer();
  }

  //Function for delete product
  Future<void> deleteProduct(int? productId) async {
  
    try {

 final responseID =await http.get(Uri.parse('$baseurl/products/$productId'));

if(responseID.statusCode ==200 ){

   final response = await http.delete(
        Uri.parse('$baseurl/products/$productId'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 204) {
        await reloadProducts();
      } else {
        throw Exception('Error CONTROLLER');
      }
      }else{
        throw Exception('Ya se a eliminado est e  registro !');
        
      }
   
    } catch (error) {
      throw Exception('Error deleteProduct: $error');
    }
 
  }

//edit a  product of the list 
  Future<void> editProduct(int? productId, Product updatedProduct) async {
    try {
      final response = await http.patch(
        Uri.parse('$baseurl/products/$productId'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(updatedProduct.toJson()),
      );
      
      if (response.statusCode == 200) {
        await reloadProducts();
      } else {
        throw Exception('Error update');
      }
    } catch (error) {
      throw Exception('Error editProduct: $error');
    }
  }
}