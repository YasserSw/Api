import 'package:flutter_application_3/user.dart';
import 'package:flutter_application_3/web_services.dart';

class MyRepo {
  final WebServices webServices;

  MyRepo(this.webServices);
  Future<List<User>> getAllUsers() async {
    return await webServices.getAllUsers();
  }

  Future<User> getUserById(int id) async {
    return await webServices.getUserById(id);
  }

  Future<User> createNewUser(User newuser) async {
    return await webServices.createNewUser(newuser,
        "Bearer 574bf6369ed8650d8122d31a7011c9a23a842312ed26e8f9823628b96efbb4a8 ");
  }

  Future<dynamic> deleteUser(int id) async {
    return await webServices.deleteUser(id,
        "Bearer 574bf6369ed8650d8122d31a7011c9a23a842312ed26e8f9823628b96efbb4a8 ");
  }
}
