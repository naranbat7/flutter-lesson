import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:income/models/income.dart';
import 'package:income/providers/index.dart';

class AddIncomePage extends StatefulWidget {
  const AddIncomePage({super.key});

  @override
  State<AddIncomePage> createState() => _AddIncomePageState();
}

class _AddIncomePageState extends State<AddIncomePage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _amountCtrl = TextEditingController(text: "0");
  final _descCtrl = TextEditingController(text: "Цалин");
  bool _isIncome = true;

  void _onSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      final data = IncomeModel(
        id: -1,
        amount: _amountCtrl.text,
        description: _descCtrl.text,
        isIncome: _isIncome,
      );
      await DatabaseProvider.instance.init();
      final repo = DatabaseProvider.instance.incomeRepo;
      if (repo == null) return;
      await repo.addOne(data);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Нэмэх")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderCheckbox(
                onChanged: (value) {
                  setState(() {
                    _isIncome = value ?? !_isIncome;
                  });
                },
                selected: _isIncome,
                name: "isIncome",
                title: Text("Орлого эсэх"),
                initialValue: true,
              ),
              FormBuilderTextField(
                controller: _amountCtrl,
                name: "amount",
                decoration: InputDecoration(
                  labelText: "Үнийн дүн",
                ),
              ),
              FormBuilderTextField(
                controller: _descCtrl,
                name: "description",
                decoration: InputDecoration(
                  labelText: "Тайлбар",
                ),
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _onSubmit,
                  child: Text("Нэмэх"),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
