import 'package:e_commerce_ui/components/like_button.dart';
import 'package:e_commerce_ui/constants.dart';
import 'package:e_commerce_ui/models/Product.dart';
import 'package:e_commerce_ui/screens/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../size_config.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenWidth * 260 / 375,
      width: SizeConfig.screenWidth * 150 / 375,
      child: Padding(
        padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductScreen(
                          product: widget.product,
                        )));
          },
          child: SingleChildScrollView(
            //physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.screenWidth * 203 / 375,
                  width: SizeConfig.screenWidth * 148 / 375,
                  child: Stack(
                    children: [
                      Container(
                        height: SizeConfig.screenWidth * 184 / 375,
                        width: SizeConfig.screenWidth * 148 / 375,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.product.image),
                                fit: BoxFit.cover)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: SizeConfig.screenWidth * 0.107,
                              height: SizeConfig.screenWidth * 0.0642,
                              margin: EdgeInsets.only(
                                  left: getProportionateScreenWidth(8),
                                  top: getProportionateScreenHeight(8)),
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Text(
                                  "-" +
                                      ((widget.product.price -
                                                  widget.product.salePrice) /
                                              widget.product.price *
                                              100)
                                          .toInt()
                                          .toString() +
                                      "%",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          right: 0,
                          bottom: getProportionateScreenWidth(7),
                          child: const LikeButton()),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              RatingBar(
                                initialRating: widget.product.rating / 2,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: getProportionateScreenHeight(14),
                                ratingWidget: RatingWidget(
                                    full: const Icon(
                                      Icons.star,
                                      color: Color(0xffFFBA49),
                                    ),
                                    half: const Icon(
                                      Icons.star_half,
                                      color: Color(0xffFFBA49),
                                    ),
                                    empty: const Icon(
                                      Icons.star_outline,
                                      color: Color(0xffFFBA49),
                                    )),
                                onRatingUpdate: (value) {},
                              ),
                              Text(
                                " (" +
                                    widget.product.numOfVote.toString() +
                                    ")",
                                style: TextStyle(
                                    color: kPrimarySecondColor,
                                    fontSize: getProportionateScreenHeight(11)),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.product.nameShop,
                  style: TextStyle(
                    color: kPrimarySecondColor,
                    fontSize: getProportionateScreenHeight(11),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.product.nameProduct,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      widget.product.price.toInt().toString() + "\$",
                      style: TextStyle(
                        color: kPrimarySecondColor,
                        decoration: TextDecoration.lineThrough,
                        fontSize: getProportionateScreenHeight(14),
                      ),
                    ),
                    Text(
                      " " + widget.product.salePrice.toInt().toString() + "\$",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: getProportionateScreenHeight(14),
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
