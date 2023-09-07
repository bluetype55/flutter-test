import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shopping/controller/shopping_controller.dart';
import 'package:getx_shopping/model/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard(
    this.product, {
    super.key,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final ShoppingController cartController = Get.put(ShoppingController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5), // 그림자 색상 및 투명도
                spreadRadius: 2, // 그림자 확산 범위
                blurRadius: 2, // 그림자 흐림 정도
                offset: const Offset(0, 3), // 그림자의 위치 (가로, 세로)
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(widget.product.name,
                      style: const TextStyle(fontSize: 30)),
                  const Text('some description about product'),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 10),
                  Text('\$ ${widget.product.price}',
                      style: const TextStyle(fontSize: 25)),
                  ElevatedButton(
                    onPressed: () {
                      cartController.addToCart(int.parse(widget.product.price));
                    },
                    child: const Text('Add to Cart'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
