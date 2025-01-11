import 'package:bloc/bloc.dart';

class CounterEvent {
  final int value;
  CounterEvent(this.value);
}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterEvent>((event, emit) {
      emit(state + event.value); // Menambah atau mengurangi nilai state
    });
  }
}
