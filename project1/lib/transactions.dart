import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../navbar.dart';
import '../colors.dart';
import '../transaction_data.dart';
import 'package:provider/provider.dart';

class Transactions extends StatefulWidget {
  const Transactions({
    super.key,
  });

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final _myBox = Hive.box('mybox');
  int id = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDarkGrey,
      body: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width * 0.5,
                height: 50,
                color: homeRed,
                child: Center(
                  child: Text(
                    _myBox.get(1),
                    style: TextStyle(color: iconWhite, fontSize: 30),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width * 0.5,
                height: 50,
                color: homeGreen,
                child: Center(
                  child: Text(
                    'vuvuvg',
                    style: TextStyle(color: iconWhite, fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
          Consumer<ExpenseData>(
            builder: (context, value, child) => Container(
              margin: EdgeInsets.all(30),
              width: double.infinity,
              height: 500,
              color: Colors.blue,
              child: ListView.builder(
                itemCount: value.getAllExpenseList().length,
                itemBuilder: (context, index) => ListTile(
                  leading: value.getAllExpenseList()[index].img,
                  title: Text(value.getAllExpenseList()[index].category),
                  trailing: Text(value.getAllExpenseList()[index].amount),
                  tileColor: bgLightGrey,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: gNavContainer(),
    );
  }
}

class transTile extends StatelessWidget {
  const transTile({
    super.key,
    required Box myBox,
  }) : _myBox = myBox;

  final Box _myBox;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      width: 400,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: bgLightGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(_myBox.get(11)),
          Text(_myBox.get(10)),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////

class gNavContainer extends StatelessWidget {
  const gNavContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgLightGrey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 7.5,
        ),
        child: navBar(context),
      ),
    );
  }
}
