import 'package:flutter/material.dart';
import '../navbar.dart';
import '../colors.dart';

class Budget extends StatefulWidget {
  const Budget({super.key});

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
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
          Text('BUDGET'),
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