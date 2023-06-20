part of 'bottom_nav_bar_bloc.dart';

class BottomNavBarState extends Equatable {
  final int activeIndex;

  const BottomNavBarState({required this.activeIndex});
  
  @override
  List<Object> get props => [activeIndex];
}

