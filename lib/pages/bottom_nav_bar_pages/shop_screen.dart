import 'package:carousel_slider/carousel_slider.dart';
import 'package:finalapp/bloc/api/bloc/get_api_bloc.dart';
import 'package:finalapp/static/screen_size.dart';
import 'package:finalapp/static/static_fonts.dart';
import 'package:finalapp/widgets/shop_page_category_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../static/static_colors.dart';
import '../../widgets/shop_page_slider_products.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const carouselImages = ['lib/images/banner_1.jpg','lib/images/banner_2.jpg'];
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: BlocBuilder<GetApiBloc, GetApiState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        width: ScreenSize().getWidth(context),
                        decoration: BoxDecoration(
                            color: Pallete.greyColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            SvgPicture.asset('lib/images/search.svg',
                                width: 24),
                            const SizedBox(width: 20),
                            const Regulartext(
                                size: 18,
                                text: 'Search Store',
                                textColor: Pallete.miniTextDarkColor)
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      CarouselSlider(
                        options: CarouselOptions(
                            height: 150, viewportFraction: 1, autoPlay: true),
                        items: [1, 2].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: ScreenSize().getWidth(context),
                                alignment: Alignment.bottomCenter,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                        image: AssetImage('lib/images/banner_$i.jpg'),
                                        fit: BoxFit.cover)),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      ShopPageCategoryText(
                          text: 'Exclusive Offer', callBack: () {}),
                      ShopPageSliderProducts(products: state.products),
                      ShopPageCategoryText(
                          text: 'Best Selling', callBack: () {}),
                      ShopPageSliderProducts(products: state.bestProducts),
                      ShopPageCategoryText(text: 'Groceries', callBack: () {}),
                      ShopPageSliderProducts(products: state.newProducts),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
