import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutternew/src/Data/models/product_models.dart';
import 'package:flutternew/src/Core/Provides/product_provider.dart';
// widget y   logica al  eliminar  un elemento dela lista 

class DeleteProductButton extends ConsumerWidget{
     final Product product;
     const DeleteProductButton({super.key, required this.product});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   return IconButton(
      icon: Image.asset('assets/images/trash.png'),
      iconSize: 24.0, // Ajusta el tamaño del ícono si es necesario
      onPressed: () async {
        // Muestra un diálogo de confirmación antes de eliminar
        bool confirmDelete = await showDialog(
          context: context,
          builder: (BuildContext context) {
            // alertdialog    para confimar  desicion
            return AlertDialog(
              //titulo
              title: const Text('Eliminar Producto'),
              //contenido  de la  alerta  dialogo  en el  la alerta
              content: const Text(
                  '¿Estás seguro de que deseas eliminar este producto?'),
                  //actiones que  se pueden realizar en el cuadro  de dialogo   aceptar / cancelar
              actions: [
               
//  boton   cancelar    que me permite  retractarme  de mi descicion 
                TextButton(
                   // onpressed  accion al  precionar el  elemento 
                  onPressed: () {
                    //salir del diologo  y cancela la eliminacion
                    Navigator.of(context).pop(false);
                  },
                  // hijo del   boton    con  el  texto  identficador 
                  child: const Text('Cancelar'),
                ),

                //  boton para  aceptar la aliminacion  del elemento 
                TextButton(
                  onPressed: () async {
                    // acepta  la  aliminacion 
                    Navigator.of(context).pop(true);
                   // atrapa los errores  al   convocar  los metodos del   cotroller   metodo de eliminacion  de productos  y   reacargar productos  
                    try {
                      final productController =ref.read(productControllerProvider.notifier);
                          //espera  y  elimina  producto 
                      await productController.deleteProduct(product.id);
                      // espera   y  recarga los  productos  lista 
                      await productController.reloadProducts();
                    } catch (error) {
                      if (error is Exception) {
                        AlertDialog( title: const Text('Eliminar Producto'),
              //contenido  de la  alerta  dialogo  en el  la alerta
              content: const Text(
                  'ya esta eliminado este producto '),);
                        // print('Error al eliminar producto: $error');
                      } else {
                        // print('Error desconocido al eliminar producto: $error');
                      }
                    }
                  },
                  child: const Text('Eliminar'),
                ),
              ],

              // array de  acciones de el  dialogo 
            );
          },
        );

        //end dialogo  de  eliminacion  
      },
    );
  }
}
