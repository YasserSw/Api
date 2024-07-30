// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_application_3/my_repo.dart';
import 'package:flutter_application_3/user.dart';

part 'my_state.dart';

class MyCubit extends Cubit<MyState> {
  MyRepo myRepo;
  MyCubit(
    this.myRepo,
  ) : super(MyInitial());

  void emitgetallusers() {
    myRepo.getAllUsers().then((AllUsersList) {
      emit(AllUsersLoaded(AllUsersList: AllUsersList));
    });
  }

  void emitgetuser(int id) {
    myRepo.getUserById(id).then((userDetails) {
      emit(SingleUserLaded(userDetails: userDetails));
    });
  }

  void emitnewuser(User newuser) {
    myRepo.createNewUser(newuser).then((newuser) {
      emit(NewUserLoaded(newuser: newuser));
    });
  }
}
