import 'package:flutter_bloc/flutter_bloc.dart';

class BlocTest extends Bloc<BlocTestEvent, BlocTestState> {

  BlocTest() : super(const BlocTestState(0)) {
    on<IncrementCounter>((_, emit) => emit(BlocTestState(state.numero + 1)));
    on<DecrementCounter>((_, emit) => emit(BlocTestState(state.numero - 1)));
    on<ResetCounter>((_, emit) => emit(BlocTestState(0)));
  }

  void incrementCounter() => add(IncrementCounter());
  void decrementCounter() => add(DecrementCounter());
  void resetCounter() => add(ResetCounter());
}

class BlocTestEvent {}

class IncrementCounter extends BlocTestEvent {}
class DecrementCounter extends BlocTestEvent {}
class ResetCounter extends BlocTestEvent {}

class BlocTestState {
  final int numero;
  const BlocTestState(this.numero);
}

/*
class DrawerOpened extends BlocTestState {
  DrawerOpened() : super(_buildDrawerOpened());

  static bool _buildDrawerOpened() {
    return false;
  }
}

class DrawerClosed extends BlocTestState {
  DrawerClosed() : super(_buildDrawerClosed());

  static bool _buildDrawerClosed() {
    return true;
  }
}
*/