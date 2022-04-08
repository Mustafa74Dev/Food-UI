import 'package:food_ui_app/models/food.dart';
import 'package:food_ui_app/models/resturant.dart';

class Order {
  Resturant? resturant;
  Food? food;
  String? date;
  int? quantity;
  Order({
    this.resturant,
    this.food,
    this.date,
    this.quantity,
  });
}
