import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:income/providers/index.dart';
import 'package:income/screens/add.dart';
import 'package:income/screens/login.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    DatabaseProvider.instance.fetchIncome();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Орлогын жагсаалт"),
            actions: [
              IconButton(
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage())),
                icon: Icon(Icons.logout),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AddIncomePage())),
            child: Icon(Icons.add),
          ),
          body: Scrollbar(
            child: ListView.separated(
              itemCount: provider.incomeList.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: ((context, index) {
                final item = provider.incomeList[index];
                return Slidable(
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    extentRatio: 0.3,
                    children: [
                      SlidableAction(
                        onPressed: (_) {},
                        backgroundColor: Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(item.description),
                    subtitle: Text(item.isIncome ? "Орлого" : "Зарлага"),
                    leading: Text("${index + 1}"),
                    trailing: Text(
                      "${item.isIncome ? '' : '-'} ${item.amount} ₮",
                      style: TextStyle(
                        color: item.isIncome ? Colors.green : Colors.redAccent,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
