import 'package:facebook/bloc/common/bloc.dart';
import 'package:facebook/bloc/common/events.dart';
import 'package:facebook/bloc/common/states.dart';
import 'package:facebook/routes/index.dart';
import 'package:facebook/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _bloc = CommonBloc();
  final _usernameCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  void _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      _bloc.add(CommonLogin(_usernameCtrl.text, _passCtrl.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MultiBlocListener(
      listeners: [
        BlocListener<CommonBloc, CommonState>(
          bloc: _bloc,
          listener: ((context, state) {
            if (state is CommonLoading) {
              Utils.startLoader();
            }
            if (state is CommonFailure) {
              Utils.cancelLoader();
            }
            if (state is CommonSuccess) {
              Utils.cancelLoader();
              Navigator.pushNamed(context, RouteNames.home);
            }
          }),
        ),
      ],
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/cover.jpeg",
                  width: width,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _usernameCtrl,
                          validator: Utils.validateEmpty,
                          decoration: InputDecoration(
                            label: Text("Phone number or email"),
                          ),
                        ),
                        TextFormField(
                          controller: _passCtrl,
                          validator: Utils.validateEmpty,
                          decoration: InputDecoration(
                            label: Text("Password"),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: _onSubmit,
                                child: Text("Log in"),
                              ),
                            ),
                          ],
                        ),
                        TextButton(onPressed: () {}, child: Text("Forgot Password?")),
                        TextButton(onPressed: () {}, child: Text("Back")),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        width: width / 4,
                        color: Colors.black38,
                      ),
                      SizedBox(width: 5),
                      Text("Or"),
                      SizedBox(width: 5),
                      Container(
                        height: 1,
                        width: width / 4,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Create new account"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
