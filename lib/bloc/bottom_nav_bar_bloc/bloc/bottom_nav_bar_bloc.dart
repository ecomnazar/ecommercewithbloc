import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_bar_event.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  BottomNavBarBloc() : super( const BottomNavBarState(activeIndex: 0) ) {
    on<OnChangeIndex>((OnChangeIndex event, Emitter<BottomNavBarState> emit) => emit(BottomNavBarState(activeIndex: event.index))
    );
  }
}
