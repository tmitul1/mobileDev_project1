import 'package:flutter/material.dart';
import '../calcbutton.dart';
import '../catbutton.dart';
import '../colors.dart';
import '../navbar.dart';
import '../calcbutton2.dart';
import '../home2.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String equation = "0";
  String result = "0";
  String expression = "";

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "<") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "Groceries" ||
          buttonText == "Take-Out" ||
          buttonText == "Clothes" ||
          buttonText == "Relaxation" ||
          buttonText == "Gas" ||
          buttonText == "Phone" ||
          buttonText == "House" ||
          buttonText == "Car") {
        expression = equation;
        expression = expression.replaceAll('x', '*');
        equation = "0";

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDarkGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 240,
                margin: const EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: bgLightGrey,
                ),
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        '\$',
                        style: TextStyle(
                            color: equation == '0' ? bgDarkGrey : homeRed,
                            fontSize: 40),
                      ),
                      Text(
                        equation,
                        style: TextStyle(color: iconWhite, fontSize: 40),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 60,
                height: 60,
              ),
              calcButton('1', bgLightGrey, () => buttonPressed('1')),
              calcButton('2', bgLightGrey, () => buttonPressed('2')),
              calcButton('3', bgLightGrey, () => buttonPressed('3')),
              const SizedBox(
                width: 60,
                height: 60,
              ),
            ],
          ),
          const SizedBox(
            width: double.infinity,
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(0),
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      backgroundColor: homeRed),
                  child: const Text(
                    '\$',
                    style: const TextStyle(fontSize: 27, color: Colors.white),
                  ),
                ),
              ),
              calcButton('4', bgLightGrey, () => buttonPressed('4')),
              calcButton('5', bgLightGrey, () => buttonPressed('5')),
              calcButton('6', bgLightGrey, () => buttonPressed('6')),
              Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(0),
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home2()),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      backgroundColor: homeGreen),
                  child: const Text(
                    '\$',
                    style: const TextStyle(fontSize: 27, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: double.infinity,
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 60,
                height: 60,
              ),
              calcButton('7', bgLightGrey, () => buttonPressed('7')),
              calcButton('8', bgLightGrey, () => buttonPressed('8')),
              calcButton('9', bgLightGrey, () => buttonPressed('9')),
              const SizedBox(
                width: 60,
                height: 60,
              ),
            ],
          ),
          const SizedBox(
            width: double.infinity,
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 60,
                height: 60,
              ),
              calcButton('.', bgLightGrey, () => buttonPressed('.')),
              calcButton('0', bgLightGrey, () => buttonPressed('0')),
              calcButton2(bgLightGrey, () => buttonPressed('<')),
              const SizedBox(
                width: 60,
                height: 60,
              ),
            ],
          ),
          const SizedBox(
            width: double.infinity,
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              catButton('Groceries', Icon(Icons.local_grocery_store_rounded),
                  bgLightGrey, () => buttonPressed('Groceries')),
              catButton('Take-Out', Icon(Icons.local_dining_rounded),
                  bgLightGrey, () => buttonPressed('Take-Out')),
              catButton('Clothes', Icon(Icons.local_mall_rounded), bgLightGrey,
                  () => buttonPressed('Clothes')),
              catButton('Relaxation', Icon(Icons.spa_rounded), bgLightGrey,
                  () => buttonPressed('Relaxation')),
            ],
          ),
          const SizedBox(
            height: 15,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              catButton('Gas', Icon(Icons.local_gas_station_rounded),
                  bgLightGrey, () => buttonPressed('Gas')),
              catButton('Phone', Icon(Icons.phone_android_rounded), bgLightGrey,
                  () => buttonPressed('Phone')),
              catButton('House', Icon(Icons.holiday_village_rounded),
                  bgLightGrey, () => buttonPressed('House')),
              catButton('Car', Icon(Icons.local_car_wash_rounded), bgLightGrey,
                  () => buttonPressed('Car')),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(result),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const gNavContainer(),
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
