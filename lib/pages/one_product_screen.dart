import 'package:carousel_slider/carousel_slider.dart';
import 'package:finalapp/bloc/cart_bloc/bloc/cart_bloc_bloc.dart';
import 'package:finalapp/methods/button_toast.dart';
import 'package:finalapp/static/screen_size.dart';
import 'package:finalapp/static/static_colors.dart';
import 'package:finalapp/static/static_fonts.dart';
import 'package:finalapp/widgets/big_button_widget.dart';
import 'package:finalapp/widgets/shop_page_slider_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OneProductScreen extends StatelessWidget {
  final products;
  const OneProductScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    width: ScreenSize().getWidth(context),
                    height: 300,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )),
                    child: Column(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                              height: 300, viewportFraction: 1, autoPlay: true),
                          items: products['images'].map<Widget>((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: ScreenSize().getWidth(context),
                                  alignment: Alignment.bottomCenter,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'http://216.250.9.29:5003/${i["image"]}'),
                                          fit: BoxFit.cover)),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: 20,
                      left: 20,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          child: SvgPicture.asset('lib/images/arrow_to_left.svg'),
                        ),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Boldtext(size: 24, text: products['name_tm'], textColor: Pallete.textDarkColor),
                    Boldtext(size: 30, text: '${products['price'].toString()} tmt', textColor: Pallete.textDarkColor),
                    const Divider(),
                    const Regulartext(size: 16, text: 'Product Detail', textColor: Pallete.textDarkColor),
                    Regulartext(size: 14, text: products['body_tm'], textColor: Pallete.miniTextDarkColor),
                    const Divider(),
                    // ShopPageSliderProducts(products: products)
                  ],
                ),
              )
            ],
          )
        ],
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: BigButtonWidget(
          buttonText: 'Add To Basket',
          callBack: (){
            ButtonToast().onPressMiniButton(context, '${products["name_tm"]} sebede goşuldy', Pallete.mainColor);
            context.read<CartBlocBloc>().add(OnClickAddButton(oneProductList: products));
          }
        ),
      )
    );
  }
}
