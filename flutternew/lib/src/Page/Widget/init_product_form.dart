import 'package:flutter/material.dart';
import 'package:flutternew/src/Data/models/product_models.dart';
 void initializeProductForm({
  required bool isEditMode,
   Product? editedProduct,
   required TextEditingController codeController, 
   required TextEditingController descriptionController, 
      required TextEditingController priceController,
   required TextEditingController quantityController,
 }){
  if (isEditMode && editedProduct != null){
  codeController.text = editedProduct.code.toString();
  descriptionController.text = editedProduct.description.toString();
  priceController.text = editedProduct.price.toString();
  quantityController.text = editedProduct.quantity.toString();
  }
 }