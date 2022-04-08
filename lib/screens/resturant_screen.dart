import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_ui_app/models/food.dart';
import '../models/resturant.dart';
import '../widgets/rating_star.dart';

// ignore: must_be_immutable
class ResturantScreen extends StatefulWidget {
  Resturant? resturants;
  ResturantScreen({Key? key, this.resturants}) : super(key: key);

  @override
  State<ResturantScreen> createState() => _ResturantScreenState();
}

class _ResturantScreenState extends State<ResturantScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _fadeAnimation;
  Animation<Offset>? _slideOffsetAnimation, _textOffsetAnimation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller!);

    _slideOffsetAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(_controller!);

    _textOffsetAnimation = Tween<Offset>(
            begin: const Offset(3.0, 0.0), end: const Offset(0.0, -0.1))
        .animate(
            CurvedAnimation(parent: _controller!, curve: Curves.bounceInOut));
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  _playAnimation() {
    _controller!.reset();
    _controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.resturants!.resturantImage!,
                child: Image.asset(
                  widget.resturants!.resturantImage!,
                  height: 280,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0, left: 15, right: 15),
                child: FadeTransition(
                  opacity: _fadeAnimation!,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColor,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FadeTransition(
                  opacity: _fadeAnimation!,
                  child: Text(
                    widget.resturants!.name!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SlideTransition(
                    position: _textOffsetAnimation!,
                    child: const Text('0.2 miles away')),
              ],
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: RatingStar(ratingStar: widget.resturants!.rating!),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.resturants!.address!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.deepOrange,
                ),
                onPressed: () {},
                child: const Text(
                  'Review',
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.deepOrange,
                ),
                onPressed: () {},
                child: const Text(
                  'Contact',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Center(
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Expanded(
            child: FutureBuilder(
              future: _playAnimation(),
              builder: (ctx, _) {
                return SlideTransition(
                  position: _slideOffsetAnimation!,
                  child: GridView.count(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(10.0),
                    crossAxisCount: kIsWeb ? 5 : 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: kIsWeb ? 0 : 10,
                    mainAxisSpacing: kIsWeb ? 0 : 10,
                    children:
                        List.generate(widget.resturants!.menu!.length, (index) {
                      Food food = widget.resturants!.menu![index];
                      return _buildMenuItem(food);
                    }),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _buildMenuItem(Food food) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: AssetImage(food.imagePath!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3),
                ],
                stops: const [
                  0.1,
                  0.4,
                  0.6,
                  0.8,
                ],
              ),
            ),
          ),
          Positioned(
            top: 65,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  food.name!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  '\$${food.price}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 2,
            right: 2,
            child: FloatingActionButton(
              heroTag: null,
              mini: true,
              onPressed: () {},
              child: const Icon(
                Icons.add,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
