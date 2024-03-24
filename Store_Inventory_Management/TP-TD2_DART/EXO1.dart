//1 claa product
class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);
}

void main() {
  //2: list of Product 
  List<Product> products = [
    Product(1, "Laptop", 999.99),
    Product(2, "Smartphone", 599.99),
    Product(3, "Headphones", 79.99),
    Product(4, "Tablet", 399.99),
    Product(5, "Camera", 299.99),
  ];

  // 3:map where the keys are product IDs and values are Product objects
  Map<int, Product> productsMap = {};
  for (var product in products) {
    productsMap[product.id] = product;
  }

  // 4: set containing the names of all products
  Set<String> productNames = {};
  for (var product in products) {
    productNames.add(product.name);
  }

  // 5: 
  // Display the list of products in the products
  print("Products:");
  for (var product in products) {
    print("ID: ${product.id}, Name: ${product.name}, Price: \$${product.price}");
  }

  // Allow the user to search for a product by its ID and display its details
  int searchId = 3; // Example search ID
  if (productsMap.containsKey(searchId)) {
    var product = productsMap[searchId];
    print("\nProduct found:");
    print("Name: ${product.name}, Price: \$${product.price}");
  } else {
    print("\nProduct with ID $searchId not found.");
  }

  // Calculate and display the total value of the inventory
  double totalValue = 0;
  for (var product in products) {
    totalValue += product.price;
  }
  print("\nTotal products' value: \$${totalValue.toStringAsFixed(2)}");
}
