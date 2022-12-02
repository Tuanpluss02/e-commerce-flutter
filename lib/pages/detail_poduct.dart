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
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Color',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const ItemSelect(
                              colorSelect: Colors.blue,
                            )
                          ],
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
                            child: Image.asset(
                          product.image,
                          fit: BoxFit.fill,
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

class ItemSelect extends StatelessWidget {
  final bool isSelect;
  final Color colorSelect;

  const ItemSelect({Key? key, required this.colorSelect, this.isSelect = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: defaultPadding / 4),
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
            color: colorSelect,
            shape: BoxShape.circle,
          ),
        ));
  }
}
