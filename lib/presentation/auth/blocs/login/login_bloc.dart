import 'package:bloc/bloc.dart';
import 'package:canteen_app/data/dataresource/auth_remote_datasource.dart';
import 'package:canteen_app/data/model/response/auth_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDatasource authRemoteDatasource;

  LoginBloc(this.authRemoteDatasource) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());

      final Either<String, AuthResponseModel> response =
      await authRemoteDatasource.login(event.email, event.password);

      response.fold(
            (failure) => emit(LoginFailure(message: failure)),
            (authResponse) => emit(LoginSuccess(authResponseModel: authResponse)),
      );
    });
  }
}
