import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:getx_shopping/model/product.dart';

class ShoppingController extends GetxController {
  RxInt totalAmount = 0.obs;
  RxInt cartAmount = 0.obs;
  RxList<Product> products = <Product>[].obs;

  void fetchProducts() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('items').get();
    final List<Product> productList =
        snapshot.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
      final data = doc.data();
      return Product(name: data['name'], price: data['price']);
    }).toList();
    products.assignAll(productList);
  }

  void addToCart(int price) {
    totalAmount += price;
    cartAmount++;
  }
}
