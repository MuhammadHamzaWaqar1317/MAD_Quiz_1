import 'dart:io';

void main(){
  ShoppingCart cart=new ShoppingCart();
  cart.showMenu();
}

class Product{
  String name;
  double price;

  Product(this.name,this.price);
}

class ShoppingCart{
  List<Product> products=[
    Product("Laptop",999),
    Product("Phone",999),
    Product("Android",999)
  ];

  List<Product> cart=[];

  void showMenu(){
    bool showMenuBool=true;
    while(showMenuBool) {
      print("1.View Products");
      print("2.Add to Cart");
      print("3.View Cart");
      print("4.Exit");

      String? choice = stdin.readLineSync();

      switch (choice) {
        case "1":
          this.viewItems();
          break;

        case "2":
          this.addToCart();
          break;

        case "3":
          this.viewCart();
          break;

        case "4":
          showMenuBool=false;
          break;

        default:
          print("Invalid Input");
          break;
      }
    }
  }

  void viewItems(){
    int count=0;
    for(var product in products){
      print("${count}.Name : ${product.name}  Price : ${product.price}");
      count++;
    }
  }

  void addToCart(){
    this.viewItems();
    String? input = stdin.readLineSync();
    int choice=int.tryParse(input ?? "")??0;

    if(choice < 0 || choice>products.length-1){
      print("Invalid Input");
      return;
    }

    cart.add(products[choice]);
  }

  void viewCart(){
    if(cart.isEmpty){
      print("Empty Cart");
      return;
    }
    int count=0;
    double sum=0;
    for(var product in cart){
      print("${count}.Name : ${product.name}  Price : ${product.price}");
      count++;
      sum+=product.price;
    }
    print("Total Cart Price: $sum");
  }
}