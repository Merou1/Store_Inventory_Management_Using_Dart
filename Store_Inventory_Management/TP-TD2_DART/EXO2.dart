import 'EXO1.dart';
import 'dart:io';
import 'dart:convert';

class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);

  // convert product to JSON format
  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'price': price};
}

void saveInventory(List<Product> products, String fileName) async {
  var file = File(fileName);
  var write = file.openWrite();

  for (var product in products) {
    write.writeln(jsonEncode(product.toJson()));
  }

  await write.close();
}

Future<List<Product>> loadInventory(String fileName) async {
  var file = File(fileName);
  var lines = await file.readAsLines();

  List<Product> products = [];

  for (var line in lines) {
    var json = jsonDecode(line);
    products.add(Product(json['id'], json['name'], json['price']));
  }

  return products;
}

void main() async {
  List<Product> products = [
    Product(1, "Laptop", 999.99),
    Product(2, "Smartphone", 599.99),
    Product(3, "Headphones", 79.99),
    Product(4, "Tablet", 399.99),
    Product(5, "Camera", 299.99),
  ];

  String fileName = "inventory.txt";

  // Save the initial inventory to a file
  await saveInventory(products, fileName);

  // Load the inventory from the file
  products = await loadInventory(fileName);

  // Display the list of products
  print("Products:");
  for (var product in products) {
    print("ID: ${product.id}, Name: ${product.name}, Price: \$${product.price}");
  }

  // Add a new product
  products.add(Product(6, "Keyboard", 49.99));

  // Update price of a product
  for (var product in products) {
    if (product.id == 3) {
      product.price = 89.99;
      break;
    }
  }

  // Remove a product
  products.removeWhere((product) => product.id == 5);

  // Save the updated inventory to the file
  await saveInventory(products, fileName);
}
