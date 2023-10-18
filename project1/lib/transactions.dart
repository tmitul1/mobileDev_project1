import 'package:flutter/material.dart';
import '../navbar.dart';
import '../colors.dart';

class Transactions extends StatefulWidget {
  const Transactions({
    super.key,
  });

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: bgDarkGrey,
      body: Column(
        children: [
          SizedBox(
            height: 30,
            width: double.infinity,
          ),
          Text('TRANSACTIONS'),
        ],
      ),
      bottomNavigationBar: gNavContainer(),
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
