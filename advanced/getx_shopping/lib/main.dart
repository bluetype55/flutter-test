import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shopping/controller/shopping_controller.dart';
import 'package:getx_shopping/firebase_options.dart';
import 'package:getx_shopping/product_card.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ShoppingController cartController = Get.put(ShoppingController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    cartController.fetchProducts();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        body: Column(
          children: [
            Scrollbar(
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.only(
                    top: 40, left: 10, right: 10, bottom: 20),
                height: 650,
                child: Obx(() {
                  if (cartController.products.isNotEmpty) {
                    return ListView.builder(
                      itemCount: cartController.products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(cartController.products[index]);
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
              ),
            ),
            Obx(() => Text(
                  'Total amount: \$${cartController.totalAmount}',
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                )),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: () {},
          label: Obx(() => Text(
                '${cartController.cartAmount}',
                style: const TextStyle(fontSize: 20, color: Colors.white),
              )),
          icon: const Icon(Icons.add_shopping_cart),
        ),
      ),
    );
  }
}
