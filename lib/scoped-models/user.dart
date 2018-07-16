import 'package:scoped_model/scoped_model.dart';

import '../models/user.dart';
import './connected_products.dart';

class UserModel extends ConnectedProducts {

  void loginUser(String email, String password) {
    authenticatedUser = User(id: 'slfjsdjf', email: email, passowrd: password);
  }
}