import 'package:cli_test/util/dialog_manager.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: StackedService.navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('AlertDialog')),
        body: Column(
          children: <Widget>[
            ElevatedButton(
              child: const Text('AlertDialog 1'),
              onPressed: () {
                DialogManager.instance.showMessageDialog(
                    StackedService.navigatorKey!.currentState!.overlay!.context,
                    'Title 1',
                    'I’m  satisfied.',
                    "Success");
              },
            ),
            ElevatedButton(
              child: const Text('AlertDialog 2'),
              onPressed: () {
                DialogManager.instance.showMessageDialog(
                    StackedService.navigatorKey!.currentState!.overlay!.context,
                    'Title 2',
                    'You will never be satisfied.',
                    "Failure");
              },
            )
          ],
        ),
      ),
    );
  }
}
