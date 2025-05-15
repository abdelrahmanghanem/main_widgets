import 'package:flutter/material.dart';
import 'package:main_widgets/main_widgets.dart';
import 'package:smart_localize/smart_localize.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final local = const Locale('ar');

  @override
  Widget build(BuildContext context) {
    return StyledToast(
      locale: local,
      textDirection:
          local.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr,
      child: MaterialApp(
        title: 'Flutter Demo',
        locale: local,
        localizationsDelegates: context.smartLocalizeDelegates,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        supportedLocales: [Locale('ar'), Locale('en')],
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
        title: Text(SmartLocalize.home),
      ),
      body: SmartScreen(
        builder: (context) {
          return Column(
            children: [
              Text(SmartLocalize.goodAfternoon),
              const SizedBox(
                height: 120,
              ),
              const SmartUserImage(
                displayName: 'Mahmoud',
                photo: '',
              ),
              const DefaultProfileImage(
                displayName: 'Mahmoud',
              ),
              SmartWelcomeWidget(
                userImage: '',
                dateFormat: DateFormats.weekDay,
                firstName: 'Mahmoud',
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
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(),
                    )),
                child: const Text('Navigate To Second Screen'),
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

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Column(
        children: [
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
