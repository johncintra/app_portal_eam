/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portal_eam/filter_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Configuração das animações
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();

    _scaleAnimation = Tween<double>(begin: 0.8, end: 20).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.white,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addListener(() {
      if (_controller.value >= 0.75) {
        // Navega quando a animação atinge 75%
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const FilterPage()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 79, 45, 94),
                  const Color.fromARGB(255, 108, 82, 132),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              color: _colorAnimation.value,
            ),
            child: Center(
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: child,
              ),
            ),
          );
        },
        child: Text(
          'Portal EAM',
          style: const TextStyle(
            fontSize: 36, // Tamanho inicial do texto
            color: Colors.white,
            fontFamily: 'Factor',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portal_eam/filter_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Configuração das animações
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();

    _scaleAnimation = Tween<double>(begin: 0.8, end: 10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.white,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addListener(() {
      if (_controller.value >= 0.75) {
        // Navega quando a animação atinge 75%
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const FilterPage()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 79, 45, 94),
                  const Color.fromARGB(255, 108, 82, 132),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              color: _colorAnimation.value,
            ),
            child: Center(
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: child,
              ),
            ),
          );
        },
        child: Text(
          'Portal EAM',
          style: const TextStyle(
            fontSize: 36, // Tamanho inicial do texto
            color: Colors.white,
            fontFamily: 'Factor',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart'; //maior pra menor
import 'package:flutter/services.dart';
import 'package:portal_eam/filter_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Configuração das animações
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();

    _scaleAnimation = Tween<double>(begin: 10, end: 0.8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.white,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addListener(() {
      if (_controller.value >= 0.98) {
        // Navega quando a animação atinge 75%
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const FilterPage()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 79, 45, 94),
                  const Color.fromARGB(255, 108, 82, 132),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              color: _colorAnimation.value,
            ),
            child: Center(
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: child,
              ),
            ),
          );
        },
        child: Text(
          'Portal EAM',
          style: const TextStyle(
            fontSize: 36, // Tamanho inicial do texto
            color: Colors.white,
            fontFamily: 'Factor',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portal_eam/filter_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Configuração das animações
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..forward();

    _scaleAnimation = Tween<double>(begin: 10, end: 0.99).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.white,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addListener(() {
      if (_controller.value >= 1) {
        
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const FilterPage()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6C5284), Color(0xFF4B3869)],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              color: _colorAnimation.value,
            ),
            child: Center(
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: child,
              ),
            ),
          );
        },
        child: Image.asset(
          'assets/images/logo_portaleam.png',
          fit: BoxFit.contain, // Ajusta a imagem conforme necessário
        ),
      ),
    );
  }
}

