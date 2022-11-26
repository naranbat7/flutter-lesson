import 'package:income/models/index.dart';

class IncomeModel extends StorableModel {
  bool isIncome;
  String amount, description;

  IncomeModel({required super.id, required this.isIncome, required this.amount, required this.description});

  static List<IncomeModel> fromList(List<dynamic> data) => data.map((e) => IncomeModel.fromJson(e)).toList();
  factory IncomeModel.fromJson(Map<String, dynamic> json) => IncomeModel(
        id: json['id'],
        isIncome: json['isIncome'] == 1,
        amount: json['amount'],
        description: json['description'],
      );

  @override
  List<Object?> get queryList => [isIncome, amount, description];
}
