import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:parichay/repository/auth_repository.dart';
import 'package:parichay/utils/routes/routes.dart';
import 'package:parichay/utils/routes/routes_name.dart';
import 'package:parichay/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      print('login data******** $data');

      setLoading(false);
      Utils.flushBarErrorMessage('Logged In successfully!!', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError(
      (error, stackTrace) {
        setLoading(false);
        if (kDebugMode) {
          Utils.flushBarErrorMessage(error.toString(), context);
          print(error.toString());
        }
      },
    );
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    print(data);
    print("***********");
    setSignUpLoading(true);
    _myRepo.signUpApi(data).then((value) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage('Sign-up successfully!!', context);
      Navigator.pushNamed(context, RoutesName.profilesetup);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError(
      (error, stackTrace) {
        setSignUpLoading(false);
        if (kDebugMode) {
          Utils.flushBarErrorMessage(error.toString(), context);
          print(error.toString());
        }
      },
    );
  }
}
