import 'package:get/get.dart';
import 'package:getx_shopping2/data/services.dart';
import 'package:getx_shopping2/model/product_model.dart';

class Controller extends GetxController {
  var productList = <Product>[].obs;
  RxInt itemCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    var products = await Services.fetchProducts();
    if (products != null) {
      productList.value = products;
    }
  }

  void itemCalc() {
    itemCount++;
  }
}
