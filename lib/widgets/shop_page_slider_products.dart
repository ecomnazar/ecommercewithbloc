import 'package:finalapp/bloc/api/bloc/get_api_bloc.dart';
import 'package:finalapp/methods/button_toast.dart';
import 'package:finalapp/pages/one_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../bloc/cart_bloc/bloc/cart_bloc_bloc.dart';
import '../static/static_colors.dart';
import '../static/static_fonts.dart';
import 'mini_button_widget.dart';

class ShopPageSliderProducts extends StatelessWidget {
  final products;
  const ShopPageSliderProducts({
    super.key, required this.products
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: BlocBuilder<GetApiBloc, GetApiState>(
        builder: (context, state) {
          return GridView.builder(
              itemCount: products.length == 0 ? 2 : products.length,
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.4),
              itemBuilder: (context, index) {
                if (state is ApiLoadingState) {
                  return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 2, color: Pallete.greyColor),
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(),
                      ));
                }
                if (state is GetApiState) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OneProductScreen(products: products[index])));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Pallete.greyColor),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            height: 125,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(
                                  'http://216.250.9.29:5003/${products[index]["images"][0]["image"]}'),
                              fit: BoxFit.cover,
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Boldtext(
                                  size: 16,
                                  text: products[index]['name_tm'],
                                  textColor: Pallete.textDarkColor,
                                  oneLine: true,
                                ),
                                Regulartext(
                                  size: 14,
                                  text: products[index]['body_tm'],
                                  textColor: Pallete.miniTextDarkColor,
                                  oneLine: true,
                                ),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Boldtext(
                                        size: 18,
                                        text:
                                            '${products[index]['price'].toString()} tmt',
                                        textColor: Pallete.textDarkColor),
                                    MiniButtonWidget(callBack: () => {
                                      ButtonToast().onPressMiniButton(context, "${products[index]['name_tm']} sebede goşuldy", Pallete.mainColor),
                                      context.read<CartBlocBloc>().add(OnClickAddButton(oneProductList: products[index]))
                                    })
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              });
        },
      ),
    );
  }
}