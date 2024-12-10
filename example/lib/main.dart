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
          const SizedBox(
            height: 120,
          ),
          SmartUserImageWidget(displayName: 'ssssss ssss', photo: '', size: 60),
          SmartWelcomeWidget(
            userImage: '',
            userName: 'ssssss ssss',
            onTap: () {},
          ),
          const Card(
            child: SmartStatusWidget(
              text: '30%',
              backgroundColor: Colors.red,
              textColor: Colors.white,
              child: SizedBox(
                height: 200,
                width: 120,
                child: Column(
                  children: [
                    SmartCachedImages(
                      imageUrl: '',
                      height: 120,
                    ),
                    Text('title'),
                    Text('subtitle'),
                  ],
                ),
              ),
            ),
          ),
          const SmartTagWidget(
            text: 'hello',
            textColor: Colors.white,
            backgroundColor: Colors.red,
          ),
          TextButton(
            onPressed: () => showToastError(
              msg: 'show Toast Error',
            ),
            child: const Text('Show Toast Error'),
          ),
          TextButton(
            onPressed: () => showToastSuccess(
              msg: 'show Toast Success',
            ),
            child: const Text('Show Toast Success'),
          ),
        ],
      ),
    );
  }
}
