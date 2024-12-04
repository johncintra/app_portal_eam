

/*
import 'package:flutter/material.dart';
import 'package:portal_eam/capture_screen.dart';
import 'package:portal_eam/homepage.dart';
import 'package:url_launcher/url_launcher.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6C5284), Color(0xFF4B3869)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo_portaleam.png',
                height: 120, // Ajuste o tamanho conforme necessário
              ),
              const SizedBox(height: 60),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8, // 80% da largura da tela
                child: _buildButton(
                  context: context,
                  text: 'Sou Aluna',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8, // 80% da largura da tela
                child: _buildButton(
                  context: context,
                  text: 'Quero me tornar Aluna',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CaptureScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF6C5284),
        elevation: 6,
        shadowColor: Colors.black45,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:portal_eam/capture_screen.dart';
import 'package:portal_eam/homepage.dart';
import 'package:url_launcher/url_launcher.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6C5284), Color(0xFF4B3869)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo_portaleam.png',
                height: 120,
              ),
              const SizedBox(height: 60),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: _buildButton(
                  context: context,
                  text: 'Sou Aluna',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: _buildButton(
                  context: context,
                  text: 'Quero me tornar Aluna',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CaptureScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF6C5284),
        elevation: 6,
        shadowColor: Colors.black45,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22, // Tamanho da fonte
          fontWeight: FontWeight.bold, // Peso da fonte
          fontFamily: 'Factor', // Fonte personalizada, se houver
          color: Color(0xFF6C5284), // Cor da fonte
        ),
      ),
    );
  }

  void launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
*/

import 'package:flutter/material.dart';
import 'package:portal_eam/capture_screen.dart';
import 'package:portal_eam/homepage.dart';
import 'package:url_launcher/url_launcher.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6C5284), Color(0xFF4B3869)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo_portaleam.png',
                height: 120,
              ),
              const SizedBox(height: 60),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: _buildButton(
                  context: context,
                  text: 'Sou Aluna',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: _buildButton(
                  context: context,
                  text: 'Quero me tornar Aluna',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CaptureScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: Colors.transparent, // Para ver o efeito de ondulação no InkWell
      child: InkWell(
        splashColor: Colors.purple[100], // Cor do efeito de ondulação
        highlightColor: Colors.purple[50], // Cor ao pressionar
        borderRadius: BorderRadius.circular(30), // Borda arredondada para combinar com o botão
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Factor',
                color: Color(0xFF6C5284),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

