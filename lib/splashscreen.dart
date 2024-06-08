import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portal_eam/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const HomePage(),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 234, 214, 238),
              Color.fromARGB(255, 166, 76, 184),
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  'https://cdn.memberkit.com.br/9pps90g3qltzqb2enftl8kp4440m?width=300&height=50&dpr=2'),
              // const SizedBox(
              //   height: 30,
              // ),
              // const Text(
              //   'Bem vindo',
              //   style: TextStyle(
              //     fontStyle: FontStyle.italic,
              //     color: Colors.white,
              //     fontSize: 32,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
