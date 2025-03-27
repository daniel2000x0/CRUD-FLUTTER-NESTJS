import 'package:flutter/material.dart';
import 'package:flutternew/src/Data/models/product_models.dart';
import 'package:flutternew/src/Page/Widget/action_button.dart';
import 'package:flutternew/src/Page/Widget/init_product_form.dart';
import 'custom_text_field.dart';
class ShowModalProduct extends StatefulWidget {
  final void Function(String, String, double, int) onAdd;
  final bool isEditMode;
  final Product? editedProduct;

  const ShowModalProduct({
    super.key,
    required this.onAdd,
    this.isEditMode = false,
    this.editedProduct,
  });
  @override
  ShowModalProductState createState() => ShowModalProductState();
} 

class ShowModalProductState extends State<ShowModalProduct> {
  final TextEditingController codeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initializeProductForm(
      isEditMode: widget.isEditMode,
      editedProduct: widget.editedProduct,
      codeController: codeController,
      descriptionController: descriptionController,
      priceController: priceController,
      quantityController: quantityController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        CustomTextField(
          label: 'Code',
          controller: codeController,
        ),
        CustomTextField(
          label: 'Description',
          controller: descriptionController,
        ),
        CustomTextField(
          label: 'Price',
          controller: priceController,
          keyboardType: TextInputType.number,
        ),
        CustomTextField(
          label: 'Quantity',
          controller: quantityController,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        ActionButton(
          onAdd: () {
            widget.onAdd(
              codeController.text,
              descriptionController.text,
              double.parse(priceController.text),
              int.parse(quantityController.text),
            );
            Navigator.pop(context);
          },
          isEditMode: widget.isEditMode,
        ),
      ],
    );
  }
}