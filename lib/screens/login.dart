import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:income/models/user.dart';
import 'package:income/providers/index.dart';
import 'package:income/screens/dashboard.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<String?> _onLogin(LoginData data) async {
    await DatabaseProvider.instance.init();
    final repo = DatabaseProvider.instance.userRepo;
    List<UserModel> users = UserModel.fromList(await repo?.getAll() ?? []);
    print(users);
    if (users.any((e) => e.email == data.name && e.password == data.password)) {
      return null;
    }
    return "Нууц үг эсвэл нэвтрэх нэр буруу байна";
  }

  Future<String?> _onSignUp(SignupData data) async {
    await DatabaseProvider.instance.init();
    final repo = DatabaseProvider.instance.userRepo;
    if (repo == null) {
      return "Database-тай холбогдож чадсангүй";
    }
    List<UserModel> users = UserModel.fromList(await repo.getAll());
    print(users);
    if (users.any((e) => e.email == data.name)) {
      return "Хэрэглэгч бүртгэлтэй байна";
    }
    await repo.addOne(UserModel(id: -1, email: data.name ?? '', password: data.password ?? ''));
    return null;
  }

  Future<String?> _onRecover(String data) async {
    return null;
  }

  String? _userValidator(String? value) {
    if (value == null || value.isEmpty) return "Утга хоосон байж болохгүй!";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      theme: LoginTheme(),
      title: 'Миний орлого',
      logo: AssetImage('assets/logo.png'),
      onLogin: _onLogin,
      onSignup: _onSignUp,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashboardPage(),
        ));
      },
      userValidator: _userValidator,
      passwordValidator: _userValidator,
      hideForgotPasswordButton: true,
      onRecoverPassword: _onRecover,
      messages: LoginMessages(
        userHint: 'Цахим шуудан',
        passwordHint: 'Нууц үг',
        confirmPasswordHint: 'Баталгаажуулах',
        loginButton: 'Нэвтрэх',
        signupButton: 'Бүртгүүлэх',
        goBackButton: 'Буцах',
        confirmPasswordError: 'Нууц үг таарахгүй байна!',
      ),
    );
  }
}
