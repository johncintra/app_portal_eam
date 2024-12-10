import 'package:flutter/material.dart';
import 'package:portal_eam/ads.dart';
import 'package:portal_eam/calculator/calculator.dart';
import 'package:portal_eam/list_working.dart';
import 'package:portal_eam/store.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  late WebViewController _webViewController;
  late WebViewWidget _webViewWidget;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFF6C5284))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
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

    _webViewWidget = WebViewWidget(controller: _webViewController);
  }

  final List<Widget> _screens = [];

  @override
  Widget build(BuildContext context) {
    // Atualizar lista de telas
    _screens.clear();
    _screens.addAll([
      _webViewWidget, // Home com WebView
      const AnnouncementsScreen(), // Anúncios
      CrochetControlScreen(), // Controle de Crochê
      const Store(), // Loja
      const MaterialCalculator(), // Calculadora
      const AnnouncementsScreen(), //List Work
    ]);

    return Scaffold(
      appBar: _currentIndex == 0 // AppBar aparece somente na HomePage
          ? AppBar(
              title: const Text(
                'Portal EAM',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.white,
                  fontFamily: 'Factor',
                ),
              ),
              iconTheme: IconThemeData(color: Colors.white,),
              centerTitle: true,
              backgroundColor: const Color(0xFF6C5284),
            )
          : null, // Sem AppBar para outras telas
      body: _screens[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color(0xFF6C5284),
        onPressed: () {
          setState(() {
            _currentIndex = 0; // Voltar para a HomePage (índice 0)
          });
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
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.library_add_check),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 1; // Ir para anúncios
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.playlist_add_rounded),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 2; // Ir para controle de crochê
                    });
                  },
                ),
                const SizedBox(width: 24), // Espaço para o botão central
                IconButton(
                  icon: const Icon(Icons.featured_play_list_outlined),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 3; // Ir para a loja
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.calculate_outlined),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 4; // Ir para calculadora
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
