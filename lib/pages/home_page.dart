import 'package:e_commerce_flutter/app_style.dart';
import 'package:e_commerce_flutter/pages/detail_poduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../product_sample.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
          onPressed: () {}, icon: SvgPicture.asset("assets/icons/back.svg")),
      actions: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              color: textColor,
            )),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              color: textColor,
            ))
      ],
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            'Women',
            // style: TextStyle(
            //     color: textColor, fontSize: 32, fontWeight: FontWeight.bold),
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
        const Categories(),
        Expanded(
          child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.75, crossAxisCount: 2),
              itemBuilder: (context, index) => ItemBuilder(
                    products: products[index],
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                    product: products[index],
                                  )));
                    },
                  )),
        )
      ],
    );
  }
}

class ItemBuilder extends StatelessWidget {
  final Product products;
  final Function()? press;
  const ItemBuilder({Key? key, required this.products, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(defaultPadding),
              width: 230,
              height: 250,
              decoration: BoxDecoration(
                  color: products.color,
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: Hero(tag: products.id, child: Image.asset(products.image)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Text(
                products.title,
                style: const TextStyle(color: textColor, fontSize: 20),
              ),
            ),
            Text(
              '\$${products.price}',
              style: const TextStyle(
                  color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "Hand Bag",
    "Footwear",
    "Dresser",
    "Mascara",
    "Lip"
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: ((context, index) => buildCategories(index))),
      ),
    );
  }

  Widget buildCategories(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categories[index],
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: selectedIndex == index ? textColor : textLightColor),
              ),
              Container(
                width: 30,
                height: 2,
                color: selectedIndex == index ? textColor : Colors.transparent,
              )
            ],
          )),
    );
  }
}
