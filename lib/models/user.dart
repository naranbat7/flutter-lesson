import 'package:income/models/index.dart';

class UserModel extends StorableModel {
  String email, password;

  UserModel({required super.id, required this.email, required this.password});

  static List<UserModel> fromList(List<dynamic> data) => data.map((e) => UserModel.fromJson(e)).toList();
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        email: json['email'],
        password: json['password'],
      );

  @override
  List<Object?> get queryList => [email, password];
}
