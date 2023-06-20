import 'package:finalapp/bloc/bottom_nav_bar_bloc/bloc/bottom_nav_bar_bloc.dart';
import 'package:finalapp/pages/bottom_nav_bar_pages/account_screen.dart';
import 'package:finalapp/pages/bottom_nav_bar_pages/cart_screen.dart';
import 'package:finalapp/pages/bottom_nav_bar_pages/explore_screen.dart';
import 'package:finalapp/pages/bottom_nav_bar_pages/favourite_screen.dart';
import 'package:finalapp/pages/bottom_nav_bar_pages/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../static/static_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    List pages = const [ShopScreen(), ExploreScreen(), CartScreen(), FavouriteScreen(), AccountScreen()];
    return BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
      builder: (context, state) {
        return Scaffold(
          body: pages[state.activeIndex],
          backgroundColor: Colors.black,
          bottomNavigationBar: SizedBox(
            height: 70,
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Pallete.mainColor,
                currentIndex: state.activeIndex,
                onTap: (value) => context.read<BottomNavBarBloc>().add(OnChangeIndex(index: value)),
                items: [
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          'lib/images/bottom_nav_bar/shop.svg'),
                      activeIcon: SvgPicture.asset(
                        'lib/images/bottom_nav_bar/shop.svg',
                        color: Pallete.mainColor,
                      ),
                      label: 'Shop'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          'lib/images/bottom_nav_bar/explore.svg'),
                      activeIcon: SvgPicture.asset(
                        'lib/images/bottom_nav_bar/explore.svg',
                        color: Pallete.mainColor,
                      ),
                      label: 'Explore'),
                  BottomNavigationBarItem(
                    icon:
                        SvgPicture.asset('lib/images/bottom_nav_bar/cart.svg'),
                    activeIcon: SvgPicture.asset(
                      'lib/images/bottom_nav_bar/cart.svg',
                      color: Pallete.mainColor,
                    ),
                    label: 'Cart',
                  ),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          'lib/images/bottom_nav_bar/favourite.svg'),
                      activeIcon: SvgPicture.asset(
                        'lib/images/bottom_nav_bar/favourite.svg',
                        color: Pallete.mainColor,
                      ),
                      label: 'Favourite'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          'lib/images/bottom_nav_bar/account.svg'),
                      activeIcon: SvgPicture.asset(
                        'lib/images/bottom_nav_bar/account.svg',
                        color: Pallete.mainColor,
                      ),
                      label: 'Account'),
                ]),
          ),
        );
      },
    );
  }
}
