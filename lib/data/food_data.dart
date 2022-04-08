import '../models/order.dart';
import '../models/user.dart';

import '../models/resturant.dart';

import '../models/food.dart';

// Food
final _burrito =
    Food(imagePath: 'assets/images/burrito.jpg', name: 'Burrito', price: 8.99);
final _steak =
    Food(imagePath: 'assets/images/steak.jpg', name: 'Steak', price: 17.99);
final _pasta =
    Food(imagePath: 'assets/images/pasta.jpg', name: 'Pasta', price: 14.99);
final _ramen =
    Food(imagePath: 'assets/images/ramen.jpg', name: 'Ramen', price: 13.99);
final _pancakes = Food(
    imagePath: 'assets/images/pancakes.jpg', name: 'Pancakes', price: 9.99);
final _burger =
    Food(imagePath: 'assets/images/burger.jpg', name: 'Burger', price: 14.99);
final _pizza =
    Food(imagePath: 'assets/images/pizza.jpg', name: 'Pizza', price: 11.99);
final _salmon = Food(
    imagePath: 'assets/images/salmon.jpg', name: 'Salmon Salad', price: 12.99);
// Restaurants
final _restaurant0 = Resturant(
  resturantImage: 'assets/images/restaurant0.jpg',
  name: 'Restaurant 0',
  address: '200 Main St, New York, NY',
  rating: 5,
  menu: [_burrito, _steak, _pasta, _ramen, _pancakes, _burger, _pizza, _salmon],
);
final _restaurant1 = Resturant(
  resturantImage: 'assets/images/restaurant1.jpg',
  name: 'Restaurant 1',
  address: '200 Main St, New York, NY',
  rating: 4,
  menu: [_steak, _pasta, _ramen, _pancakes, _burger, _pizza],
);
final _restaurant2 = Resturant(
  resturantImage: 'assets/images/restaurant2.jpg',
  name: 'Restaurant 2',
  address: '200 Main St, New York, NY',
  rating: 4,
  menu: [_steak, _pasta, _pancakes, _burger, _pizza, _salmon],
);
final _restaurant3 = Resturant(
  resturantImage: 'assets/images/restaurant3.jpg',
  name: 'Restaurant 3',
  address: '200 Main St, New York, NY',
  rating: 2,
  menu: [_burrito, _steak, _burger, _pizza, _salmon],
);
final _restaurant4 = Resturant(
  resturantImage: 'assets/images/restaurant4.jpg',
  name: 'Restaurant 4',
  address: '200 Main St, New York, NY',
  rating: 3,
  menu: [_burrito, _ramen, _pancakes, _salmon],
);

final List<Resturant> restaurants = [
  _restaurant0,
  _restaurant1,
  _restaurant2,
  _restaurant3,
  _restaurant4,
];

// User
final currentUser = User(
  userName: 'Rebecca',
  userOder: [
    Order(
      date: 'Nov 10, 2019',
      food: _steak,
      resturant: _restaurant2,
      quantity: 1,
    ),
    Order(
      date: 'Nov 8, 2019',
      food: _ramen,
      resturant: _restaurant0,
      quantity: 3,
    ),
    Order(
      date: 'Nov 5, 2019',
      food: _burrito,
      resturant: _restaurant1,
      quantity: 2,
    ),
    Order(
      date: 'Nov 2, 2019',
      food: _salmon,
      resturant: _restaurant3,
      quantity: 1,
    ),
    Order(
      date: 'Nov 1, 2019',
      food: _pancakes,
      resturant: _restaurant4,
      quantity: 1,
    ),
  ],
  userCart: [
    Order(
      date: 'Nov 11, 2019',
      food: _burger,
      resturant: _restaurant2,
      quantity: 2,
    ),
    Order(
      date: 'Nov 11, 2019',
      food: _pasta,
      resturant: _restaurant2,
      quantity: 1,
    ),
    Order(
      date: 'Nov 11, 2019',
      food: _salmon,
      resturant: _restaurant3,
      quantity: 1,
    ),
    Order(
      date: 'Nov 11, 2019',
      food: _pancakes,
      resturant: _restaurant4,
      quantity: 3,
    ),
    Order(
      date: 'Nov 11, 2019',
      food: _burrito,
      resturant: _restaurant1,
      quantity: 2,
    ),
  ],
);
