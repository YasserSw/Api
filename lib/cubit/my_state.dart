part of 'my_cubit.dart';

@immutable
abstract class MyState {}

class MyInitial extends MyState {}

class AllUsersLoaded extends MyState {
  final List<User>? AllUsersList;

  AllUsersLoaded({required this.AllUsersList});
}

class SingleUserLaded extends MyState {
  final User userDetails;
  SingleUserLaded({required this.userDetails});
}

class NewUserLoaded extends MyState {
  final User newuser;
  NewUserLoaded({required this.newuser});
}

class DelUserLoaded extends MyState {
  final dynamic data;
  DelUserLoaded({required this.data});
}
