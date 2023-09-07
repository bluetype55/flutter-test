import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shopping2/controller/controller.dart';
import 'package:getx_shopping2/view/product_tile.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chef shop'),
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.view_list_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: Obx(
            () {
              if (controller.productList.isNotEmpty) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: controller.productList.length,
                  itemBuilder: (context, index) {
                    return ProductTile(
                      product: controller.productList[index],
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.red,
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart_checkout),
          label: Obx(
            () => Text(
              'Item: ${controller.itemCount}',
              style: TextStyle(fontSize: 20),
            ),
          )),
    );
  }
}
