class Product{
  final int? id;
  final String? code;
  final String description;
  final double? price;
  final int? quantity;

Product({
this.id,this.code,required this.description,this.price,this.quantity
});

Map <String ,dynamic> toJson(){
  return {
    'id':id,
    'code':code,
    'description':description,
    'price':price,
    'quantity':quantity
  };
}


// Sobrescribir el método toString() para una representación legible de Product
  @override
  String toString() {
    return 'Product{id: $id, code: $code, description: $description, price: \$${price?.toStringAsFixed(2)}, quantity: $quantity}';
  }
}