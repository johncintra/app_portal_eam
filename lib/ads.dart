import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AnnouncementsScreen extends StatefulWidget {
  const AnnouncementsScreen({Key? key}) : super(key: key);

  @override
  _AnnouncementsScreenState createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {
  final DatabaseReference _announcementsRef =
      FirebaseDatabase.instance.ref().child('announcements');

  List<Map<dynamic, dynamic>> announcements = [];

  @override
  void initState() {
    super.initState();
    _loadAnnouncements();
  }

  Future<void> _loadAnnouncements() async {
    try {
      DatabaseEvent event = await _announcementsRef.once();
      DataSnapshot snapshot = event.snapshot;

      if (snapshot.exists) {
        print("Dados recebidos: ${snapshot.value}");
        
        
        if (snapshot.value is Map) {
          Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
          
          
          announcements.add(data);

          
          // announcements = data.values.map((e) => e as Map<dynamic, dynamic>).toList();
        } else {
          print("Formato de dados não suportado.");
        }

        setState(() {});
      } else {
        print("Nenhum anúncio encontrado.");
      }
    } catch (e) {
      print("Erro ao carregar anúncios: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anúncios', style: TextStyle(color: Colors.white, fontFamily: 'Factor'),),
        backgroundColor: const Color(0xFF6C5284),
        iconTheme: IconThemeData(color: Colors.white), 
      ),
      body: announcements.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: announcements.length,
              itemBuilder: (context, index) {
                final announcement = announcements[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  color: const Color.fromARGB(255, 108, 82, 132),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          announcement['title'] ?? 'Sem título',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          announcement['message'] ?? 'Sem mensagem',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Publicado em: ${announcement['timestamp'] ?? 'Sem data'}',
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
