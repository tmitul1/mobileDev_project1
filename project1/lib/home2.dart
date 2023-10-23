import 'package:flutter/material.dart';
import '../calcbutton.dart';
import '../catbutton.dart';
import '../colors.dart';
import '../navbar.dart';
import '../calcbutton2.dart';
import '../home.dart';
import 'package:math_expressions/math_expressions.dart';

// ============== income screen home ==============
class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _HomeState();
}

class _HomeState extends State<Home2> {
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
      } else if (buttonText == "Salary" ||
          buttonText == "Invest" ||
          buttonText == "Taxes" ||
          buttonText == "Wages" ||
          buttonText == "Revenue") {
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
                        '\$ ',
                        style: TextStyle(
                            color: equation == '0' ? bgDarkGrey : homeGreen,
                            fontSize: 25),
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
              catButton('Salary', Icon(Icons.wallet_rounded), bgLightGrey,
                  () => buttonPressed('Salary')),
              catButton('Invest', Icon(Icons.currency_bitcoin_rounded),
                  bgLightGrey, () => buttonPressed('Invest')),
              catButton('Taxes', Icon(Icons.monetization_on_rounded),
                  bgLightGrey, () => buttonPressed('Taxes')),
              catButton('Wages', Icon(Icons.local_atm_rounded), bgLightGrey,
                  () => buttonPressed('Wages')),
            ],
          ),
          const SizedBox(
            height: 15,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              catButton('Revenue', Icon(Icons.account_balance_wallet_rounded),
                  bgLightGrey, () => buttonPressed('Revenue')),
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

//class gNav extends StatelessWidget {
 