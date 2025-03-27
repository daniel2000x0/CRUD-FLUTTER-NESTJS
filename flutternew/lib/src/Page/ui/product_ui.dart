import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutternew/src/framework/colors.dart';
import 'package:flutternew/src/Data/service/app_exceptions.dart';
import 'package:flutternew/src/Core/Provides/product_provider.dart';
import 'package:flutternew/src/Data/models/product_models.dart';
import 'package:flutternew/src/Page/Widget/product_list_title.dart';
import 'package:flutternew/src/Page/Widget/show_modal_product.dart';
import 'package:flutternew/src/Data/states/products_state.dart';
import 'package:flutternew/src/Page/Widget/error_container.dart';




class ProductUi extends ConsumerStatefulWidget{
  const ProductUi ({ super.key});
@override
  ProductUiState createState() => ProductUiState();
    // TODO: implement createElement
    
} 

class ProductUiState extends ConsumerState<ProductUi>{
  @override
  void initState ()
{
  super.initState();
  ref.read(productControllerProvider.notifier).reloadProducts();
}

@override
  
    
    Widget build(BuildContext context){

      // variables class   provider
      final products = ref.watch(productsProvider);
       final productState = ref.watch(productControllerProvider);
        
      return Scaffold(
        appBar: AppBar(
          title:const Text('PRODUCTS'),
          actions:[ElevatedButton(onPressed:(){
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
               builder:(BuildContext context){
                return ShowModalProduct(onAdd: (code,description, price, quantity)async{
                  final newProduct= Product(code:code,description:description,price:price,quantity:quantity,);
                  await ref .read(productControllerProvider.notifier) .addProduct(newProduct);
                },
                 );
               },
               );
          },
           child: const Text('Agregar Prodcuto'),
        ), 
        ],
      ),
       backgroundColor: background,
      body:
       products.when(
        
      
        data: (productList){
           if (productList.isEmpty) {
            return Center(child: Text('No products available.'));
          }



          return ListView.builder(
            itemCount: productList.length,
            itemBuilder:  (context, index){
              final product = productList [index];

              // llama  al  widget que contendra  los
              return ProductTile(product: product); 
            },
          );
        },
       error: (error, stackTrace) {
          return _buildErrorScreen(error);
        },
       // CARGA DE WIDGET  que   se va hacer en  el  intermedio
        loading: (){

return Center(
  // CIRCULO DE CARGA
  child: CircularProgressIndicator()
  );

        }
     
      
      ),

      
       floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Recargar los productos cuando se presiona el botón
          await ref.read(productControllerProvider.notifier).reloadProducts();
        },
        child: Icon(Icons.refresh),
      ),
      );
    }

    //   CONTROL DE errores   usando  el estado  de el  servicio   si  la nformacio n a llegado correctamente  
    
  Widget _buildErrorScreen(Object error) {
       String image = 'assets/images/illustration_wrong.png';
    if (error is AppException) {
      switch (error.code) {
        case 401:
          image = 'assets/images/illustration_stop.png';
          break;
        case 404:
          image = 'assets/images/illustration_not_found.png';
          break;
        case 500:
          image = 'assets/images/illustration_error.png';
          break;
        default:
      }
    }
    return ErrorContainer(
      context: context,
      img: image,
      title: 'Error',
      message: error.toString(),
      buttonText: 'Inténtalo de nuevo',
      onPressed: () => ref.read(productControllerProvider.notifier).reloadProducts(),
      heightMultiplier: 0.35,
    );
  }
}



