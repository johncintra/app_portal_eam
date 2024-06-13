import 'package:flutter/material.dart';
import 'package:portal_eam/calculator/calculator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFF6C5284))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://aluno.portaleam.com.br/'));
  }

  final String url = 'https://aluno.portaleam.com.br/users/edit';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Portal EAM',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 26, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF6C5284),
          //shape: const RoundedRectangleBorder(
          //borderRadius: BorderRadius.vertical(bottom: Radius.circular(1))),
        ),
        body: WebViewWidget(controller: controller),
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: const Color(0xFF6C5284),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          child: const Icon(
            Icons.home,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: const Color(0xFF6C5284),
          child: IconTheme(
            //Theme.of(context).colorScheme.onPrimary
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.contact_support_outlined),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_bag_outlined),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.calculate_outlined),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MaterialCalculator()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
