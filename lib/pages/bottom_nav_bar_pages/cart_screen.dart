import 'package:finalapp/bloc/cart_bloc/bloc/cart_bloc_bloc.dart';
import 'package:finalapp/methods/button_toast.dart';
import 'package:finalapp/static/screen_size.dart';
import 'package:finalapp/static/static_colors.dart';
import 'package:finalapp/static/static_fonts.dart';
import 'package:finalapp/widgets/big_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBlocBloc, CartBlocState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Boldtext(
                size: 21, text: 'Cart', textColor: Pallete.textDarkColor),
          ),
          body: state.cartItems.isEmpty ? Center(
            child: Regulartext(size: 24, text: 'Empty', textColor: Pallete.textDarkColor),
          ) : ListView.builder(
              itemCount: state.cartItems.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const Divider(thickness: 2),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 120,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: ScreenSize().getWidth(context) / 4,
                            child: Image(
                              image: NetworkImage('http://216.250.9.29:5003/${state.cartItems[index]["images"][0]["image"]}'),
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            height: 120,
                            width: ScreenSize().getWidth(context) / 2.4,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Boldtext(
                                    size: 16,
                                    text: state.cartItems[index]['name_tm'],
                                    textColor: Pallete.textDarkColor,
                                    oneLine: true),
                                Regulartext(
                                    size: 14,
                                    text: 'Price',
                                    textColor: Pallete.miniTextDarkColor),
                                Spacer(),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 18),
                                      child: SvgPicture.asset(
                                        'lib/images/minus_icon.svg',
                                        width: 20,
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2,
                                              color: Pallete.greyColor),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 14),
                                      child: Boldtext(
                                          size: 21,
                                          text: '1',
                                          textColor: Pallete.textDarkColor),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 9, vertical: 10),
                                      child: SvgPicture.asset(
                                        'lib/images/plus.svg',
                                        color: Pallete.mainColor,
                                        width: 20,
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2,
                                              color: Pallete.greyColor),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 120,
                            width: ScreenSize().getWidth(context) / 3.8,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    context.read<CartBlocBloc>().add(OnClickCloseButton(oneProductList: state.cartItems[index]));
                                    ButtonToast().onPressMiniButton(context, "${state.cartItems[index]['name_tm']} sebetden aýryldy", Colors.red);
                                  },
                                  child: SvgPicture.asset('lib/images/close_icon.svg',
                                      width: 20),
                                ),
                                Boldtext(
                                    size: 18,
                                    text: '${state.cartItems[index]["price"].toString()} tmt',
                                    textColor: Pallete.textDarkColor)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              }),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(20.0),
                child: BigButtonWidget(buttonText: 'Sargyt Etmek', callBack: (){}),
              ),
        );
      },
    );
  }
}
