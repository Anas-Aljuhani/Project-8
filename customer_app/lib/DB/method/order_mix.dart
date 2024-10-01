import 'dart:developer';

import 'package:customer_app/DB/super.dart';
import 'package:customer_app/data_layer/auth_layer.dart';
import 'package:customer_app/data_layer/product_layer.dart';
import 'package:customer_app/models/product_model.dart';
import 'package:customer_app/services/setup.dart';

mixin OrderMix on Super {
  final locator = productLocator.get<ProductLayer>();
  Future<void> getMenu() async {
    try {
      final x = await superbase.from('product').select('*');
      for (var product in x) {
        locator.menu.add(ProductModel.fromJson(product));
      }
    } catch (e) {
      log('$e');
    }
  }

  getUserOrderHistory() async {
    try {
      final user = authLocator.get<AuthLayer>().user;

      final res = await superbase
          .from("orders")
          .select()
          .eq("customer_id", user!.customerId);

      return res;
    } catch (er) {
      log("err in getUserOrderHistory ");
      log("$er");
    }
  }

  getAllUserOrder({required String orderId}) async {
    try {
      final res =
          await superbase.from("order_detail").select().eq("order_id", orderId);

      return res;
    } catch (er) {
      log("err in  getAllUserOrder");
      log("$er");
    }
  }
}
