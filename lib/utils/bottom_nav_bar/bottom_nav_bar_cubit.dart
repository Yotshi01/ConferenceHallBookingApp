import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:meta/meta.dart';
// import 'package:conference_hall_booking/utils/bottom_nav_bar/bottom_nav_bar_state.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit()
      : super(BottomNavBarState(selectedItem: BottomNavBarItem.home));

  void updateSelectedItem(BottomNavBarItem item) {
    if (item != state.selectedItem) {
      emit(BottomNavBarState(selectedItem: item));
    }
  }
}
