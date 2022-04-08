import '../models/food.dart';

class Resturant {
  String? name;
  String? resturantImage;
  String? address;
  int? rating;
  List<Food>? menu;
  Resturant({
    this.name,
    this.resturantImage,
    this.address,
    this.rating,
    this.menu,
  });
}
