
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../imports.dart';
import '../provider/calculator_provider.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(
        context,
        'Calculator',
        Icons.history,
            () {
          Navigator.pushNamed(context, '/history');
        },
      ),
      body: Container(height: MediaQuery.of(context).size.height,
        child: Expanded(
          child: Column(
            children: [
              Container(
                width: mediaQuery.width,
                height: mediaQuery.height * .3,
                padding: EdgeInsets.symmetric(
                  vertical: mediaQuery.width * 0.08,
                  horizontal: mediaQuery.width * 0.06,
                ),

                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 20.0,
                        child: ListView(
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Consumer<CalculatorProvider>(
                              builder: (context, equation, child) => Text(
                                equation.equation,
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Consumer<CalculatorProvider>(
                        builder: (context, equation, child) => Text(
                          equation.result,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  color: buttonsBackgroundColor,
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(13.0),
                    crossAxisSpacing: 5.0,
                    childAspectRatio: 1.3,
                    mainAxisSpacing: 5.0,
                    crossAxisCount: 4,
                    children: buttons,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
