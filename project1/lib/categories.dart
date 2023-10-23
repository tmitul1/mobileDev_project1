import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../navbar.dart';
import '../colors.dart';
import '../transaction_data.dart';
import 'expense_item.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  double getTotalAmountForCategory(List<ExpenseItem> expenses) {
    double totalAmount = 0.0;
    for (final expense in expenses) {
      totalAmount += double.parse(expense.amount);
    }
    return totalAmount;
  }

  Map<String, List<ExpenseItem>> groupExpensesByCategory(
      List<ExpenseItem> expenses) {
    // Create a Map to group expenses by category.
    final groupedExpenses = <String, List<ExpenseItem>>{};

    for (final expense in expenses) {
      if (groupedExpenses.containsKey(expense.category)) {
        groupedExpenses[expense.category]!.add(expense);
      } else {
        groupedExpenses[expense.category] = [expense];
      }
    }

    return groupedExpenses;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDarkGrey,
      body: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    color: const Color(0xff0293ee), // Color for the section.
                    value: 20, // Value for the section.
                    title: 'Clothes', // Title for the section.
                    radius: 50, // Adjust the radius as needed.
                  ),
                  PieChartSectionData(
                    color: const Color(0xfff8b250), // Color for the section.
                    value: 20, // Value for the section.
                    title: 'Gas', // Title for the section.
                    radius: 50, // Adjust the radius as needed.
                  ),
                  PieChartSectionData(
                    color: const Color(0xff845bef), // Color for the section.
                    value: 30, // Value for the section.
                    title: 'Phone', // Title for the section.
                    radius: 50, // Adjust the radius as needed.
                  ),
                  PieChartSectionData(
                    color: Color.fromARGB(
                        255, 239, 91, 182), // Color for the section.
                    value: 50, // Value for the section.
                    title: 'House', // Title for the section.
                    radius: 50, // Adjust the radius as needed.
                  ),
                  PieChartSectionData(
                    color: Color.fromARGB(
                        255, 91, 239, 158), // Color for the section.
                    value: 50, // Value for the section.
                    title: 'Car', // Title for the section.
                    radius: 50, // Adjust the radius as needed.
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Consumer<ExpenseData>(builder: (context, value, child) {
              final expenses = value.getAllExpenseList();
              final groupedExpenses = groupExpensesByCategory(expenses);

              return ListView.builder(
                  itemCount: groupedExpenses.length,
                  itemBuilder: (context, index) {
                    final category = groupedExpenses.keys.elementAt(index);
                    final totalAmount =
                        getTotalAmountForCategory(groupedExpenses[category]!);
                    final icon = groupedExpenses[category]!.first.img;

                    return Card(
                      elevation: 4,
                      margin: EdgeInsets.all(8),
                      child: ListTile(
                          leading: icon,
                          title: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '$category: ',
                                  style: TextStyle(
                                    color: Colors
                                        .blue, // Customize the color for the category name.
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: Text(
                            '\t\t\t\$${totalAmount.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Colors
                                  .green, // Customize the color for the total amount.
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )),
                    );
                  });
            }),
          ),
        ],
      ),
      bottomNavigationBar: gNavContainer(),
    );
  }
}

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
