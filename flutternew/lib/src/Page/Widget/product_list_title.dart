import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutternew/src/Core/Provides/product_provider.dart';
import 'package:flutternew/src/Data/models/product_models.dart';
import 'package:flutternew/src/Page/Widget/delete_product_widget.dart';
import 'package:flutternew/src/Page/Widget/show_modal_product.dart';

// PREODUCTO EN LA  lista 
class ProductTile extends ConsumerWidget {
//modelo del producto 
  final Product product;
  // inbstacia  la a clase  y pide una   calse producto  
  const ProductTile({super.key, required this.product});
// construye el elemento
  @override
  Widget build(BuildContext context, WidgetRef ref){
    /// se agregan en columna 
  return Column(
   
    // se agregan los hijos de  la  columna 
      children: [
        
        //lista de   de  elemntos dentro de la clase  Produttitle  que  es llamado desde la  pantalla pricipal
        ListTile(
          title: Text(product.description),
          subtitle: Text('Precio: ${product.price.toString()}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            
            children: [
              IconButton(
                icon: Image.asset('assets/images/pen.png'),
                iconSize: 24.0, // Ajusta el tamaño del ícono si es necesario
                onPressed: () async {
                  // Mostrar el modal de edición
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return ShowModalProduct(
                        onAdd: (code, description, price, quantity) async {
                          final updatedProduct = Product(
                            id: product.id,
                            code: code,
                            description: description,
                            price: price,
                            quantity: quantity,
                          );
                          await ref
                              .read(productControllerProvider.notifier)
                              .editProduct(product.id, updatedProduct);
                        },
                        isEditMode: true,
                        editedProduct: product,
                      );
                    },
                  );
                },
              ),
              DeleteProductButton(product: product),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}