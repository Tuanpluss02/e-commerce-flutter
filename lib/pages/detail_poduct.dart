import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_flutter/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../product_sample.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: buildAppbar(context),
      body: BodyDetail(
        product: product,
      ),
    );
  }

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            "assets/icons/back.svg",
            color: Colors.white,
          )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              color: Colors.white,
            )),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              color: Colors.white,
            ))
      ],
    );
  }
}

class BodyDetail extends StatelessWidget {
  final Product product;
  const BodyDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.4),
                padding: EdgeInsets.only(top: size.height * 0.12),
                height: size.height * 0.6,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Color',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: const [
                                  ItemSelect(
                                    colorSelect: Colors.blue,
                                    isSelect: true,
                                  ),
                                  ItemSelect(
                                    colorSelect: Colors.redAccent,
                                  ),
                                  ItemSelect(
                                    colorSelect: Colors.green,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        RichText(
                            text: TextSpan(
                                style: const TextStyle(color: textColor),
                                children: [
                              TextSpan(
                                text: 'Size\n',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              TextSpan(
                                  text: '${product.size} cm',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30))
                            ])),
                        SizedBox(
                          width: size.width * 0.1,
                        )
                      ],
                    ),
                    Container(
                      height: size.height * 0.18,
                      padding: const EdgeInsets.only(top: defaultPadding),
                      child: AutoSizeText(
                        product.description,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CountItemAndFavorite(),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.5, color: textColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25)),
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              "assets/icons/cart.svg",
                              color: product.color,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: product.color,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                            ),
                            height: 70,
                            // width: size.width * 0.7,
                            child: InkWell(
                              onTap: () {},
                              child: const Text(
                                'BUY NOW',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Beautiful Hand Bag',
                        style: TextStyle(color: Colors.white)),
                    Text(
                      product.title,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          const TextSpan(text: 'Price\n'),
                          TextSpan(
                              text: '\$${product.price}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30))
                        ])),
                        const SizedBox(
                          width: 45,
                        ),
                        Expanded(
                            child: Hero(
                          tag: product.id,
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.fill,
                          ),
                        ))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}

class CountItemAndFavorite extends StatefulWidget {
  const CountItemAndFavorite({
    Key? key,
  }) : super(key: key);

  @override
  State<CountItemAndFavorite> createState() => _CountItemAndFavoriteState();
}

class _CountItemAndFavoriteState extends State<CountItemAndFavorite> {
  int countItem = 1;
  bool isfavorite = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OutlineButton(
          icon: Icons.remove,
          press: () {
            setState(() {
              if (countItem > 1) {
                countItem--;
              }
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: defaultPadding, horizontal: defaultPadding / 2),
          child: Text(
            countItem.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        OutlineButton(
            icon: Icons.add,
            press: () {
              setState(() {
                countItem++;
              });
            }),
        const Spacer(),
        IconButton(
            onPressed: () {
              setState(() {
                isfavorite = !isfavorite;
              });
            },
            icon: Icon(
              isfavorite ? Icons.favorite : Icons.favorite_outline_outlined,
              size: 40,
              color: Colors.red,
            ))
      ],
    );
  }
}

class OutlineButton extends StatelessWidget {
  final Function() press;
  final IconData icon;
  const OutlineButton({Key? key, required this.icon, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(1.5),
        width: 50,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: textColor),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: InkWell(
          onTap: press,
          child: Icon(icon),
        ));
  }
}

class ItemSelect extends StatelessWidget {
  final bool isSelect;
  final Color colorSelect;

  const ItemSelect({Key? key, required this.colorSelect, this.isSelect = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
            top: defaultPadding / 4, right: defaultPadding / 2),
        padding: const EdgeInsets.all(2.5),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: colorSelect,
            )),
        child: Container(
          decoration: BoxDecoration(
            color: isSelect ? colorSelect : Colors.transparent,
            shape: BoxShape.circle,
          ),
        ));
  }
}
