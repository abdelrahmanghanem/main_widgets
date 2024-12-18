import 'package:flutter/material.dart';
import 'package:main_widgets/main_widgets.dart';
import 'package:smart_localize/smart_localize.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MainWidgetsUtil.init(context,
        designSize: const Size(375, 812), minTextAdapt: true);
    return StyledToast(
      backgroundColor: Colors.red,
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      locale: const Locale('en', 'US'),
      child: MaterialApp(
        localizationsDelegates: context.smartLocalizeDelegates,
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
      body: SmartScreen(
        builder: (context) {
          return Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              const SmartUserImage(
                displayName: 'ssssss ssss',
                photo: '',
              ),
              const DefaultProfileImage(
                displayName: 'ssssss ssss',
              ),
              SmartWelcomeWidget(
                userImage: '',
                dateFormat: DateFormats.weekDay,
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
          );
        },
      ),
    );
  }
}
