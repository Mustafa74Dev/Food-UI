import 'package:food_ui_app/models/order.dart';

class User {
  String? userName;
  List<Order>? userOder;
  List<Order>? userCart;
  User({
    this.userName,
    this.userOder,
    this.userCart,
  });
}
