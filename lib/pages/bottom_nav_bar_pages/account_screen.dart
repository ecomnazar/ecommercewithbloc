import 'package:finalapp/static/static_colors.dart';
import 'package:finalapp/static/static_fonts.dart';
import 'package:finalapp/widgets/big_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List details = [
      ['lib/images/orders.svg', 'Orders'],
      ['lib/images/mydetail.svg', 'My Deatils'],
      ['lib/images/location.svg', 'Delivery Address'],
      ['lib/images/payment.svg', 'Payment Meyhods'],
      ['lib/images/promo.svg', 'Promo Card'],
      ['lib/images/notification.svg', 'Notifications'],
      ['lib/images/help.svg', 'Help'],
      ['lib/images/about.svg', 'About'],
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Boldtext(size: 21, text: 'Profile', textColor: Pallete.textDarkColor),
      ),
      body: ListView.builder(
        itemCount: details.length,
        itemBuilder: (context, index){
          return ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
            leading: SvgPicture.asset(details[index][0]),
            title: Boldtext(size: 18, text: details[index][1], textColor: Pallete.textDarkColor),
            trailing: SvgPicture.asset('lib/images/arrow_to_right.svg'),
            shape: Border(
              top: BorderSide(width: 2, color: Pallete.miniTextDarkColor)
            )
          );
        }
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: BigButtonWidget(buttonText: 'Log Out', callBack: (){}),
      ),
    );
  }
}