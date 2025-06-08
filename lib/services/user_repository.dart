import 'package:bloc_network/model/user.dart';
import 'package:bloc_network/services/user_api_provider.dart';

class UserRepository {
  final UserApiProvider _userRepository = UserApiProvider();

  Future <List<User>> getAllUsers() => _userRepository.getUsers();
}