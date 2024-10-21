import 'package:flutter/material.dart';
import 'package:main_widgets/main_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledToast(
      backgroundColor: Colors.red,
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      locale: const Locale('en', 'US'),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('home'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () => showToastError(msg: 'show Toast Error'),
            child: const Text('show Toast Error'),
          ),
          TextButton(
            onPressed: () => showToastSuccess(msg: 'show Toast Success'),
            child: const Text('Show Toast Success'),
          ),
        ],
      ),
    );
  }
}
