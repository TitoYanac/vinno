import 'package:flutter_bloc/flutter_bloc.dart';

class BlocNavigationBar extends Bloc<BlocNavigationBarEvent, BlocNavigationBarState> {
  BlocNavigationBar() : super(const BlocNavigationBarState(0)){
    on<ChangeIndex>((event, emit) => emit(BlocNavigationBarState(event.newIndex)));
  }

  void changeIndex(int newIndex) => add(ChangeIndex(newIndex));

}

class BlocNavigationBarEvent {
  final int newIndex;
  const BlocNavigationBarEvent(this.newIndex);
}

class ChangeIndex extends BlocNavigationBarEvent {
  const ChangeIndex(super.newIndex);
}

class BlocNavigationBarState {
  final int index;
  const BlocNavigationBarState(this.index);
}