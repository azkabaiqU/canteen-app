import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_dart_event.dart';
part 'login_dart_state.dart';

class LoginDartBloc extends Bloc<LoginDartEvent, LoginDartState> {
  LoginDartBloc() : super(LoginDartInitial()) {
    on<LoginDartEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
