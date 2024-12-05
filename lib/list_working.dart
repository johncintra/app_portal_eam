import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class CrochetControlScreen extends StatefulWidget {
  @override
  _CrochetControlScreenState createState() => _CrochetControlScreenState();
}

class _CrochetControlScreenState extends State<CrochetControlScreen> {
  final DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  List<Map<String, dynamic>> pieces = [];

  @override
  void initState() {
    super.initState();
    _loadPieces();
  }

  void _loadPieces() async {
    dbRef.child('pieces').onValue.listen((event) {
      final data = event.snapshot.value as Map?;
      if (data != null) {
        setState(() {
          pieces = data.entries
              .map((entry) => {"id": entry.key, ...Map<String, dynamic>.from(entry.value)})
              .toList();
        });
      }
    });
  }

  void _savePiece(Map<String, dynamic> pieceData) {
    dbRef.child("pieces").push().set(pieceData);
  }

  void _updatePiece(String id, Map<String, dynamic> pieceData) {
    dbRef.child("pieces/$id").update(pieceData);
  }

  void _deletePiece(String id) {
    dbRef.child("pieces/$id").remove();
    setState(() {
      pieces.removeWhere((piece) => piece['id'] == id);
    });
  }
/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Na Agulha", 
        style: TextStyle(color: Colors.white, fontFamily: 'Factor'),),
        backgroundColor: Color(0xFF6C5284),
        iconTheme: IconThemeData(color: Colors.white), 
        
      ),
      body: ListView.builder(
        itemCount: pieces.length,
        itemBuilder: (context, index) {
          final piece = pieces[index];
          return PieceCard(
            piece: piece,
            onUpdate: (updatedPiece) {
              _updatePiece(piece['id'], updatedPiece);
            },
            onDelete: () => _confirmDelete(piece['id']),
            onEdit: () => _showPieceForm(context, piece),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showPieceForm(context),
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Color(0xFF6C5284),
      ),
      
    );
  }
  */
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        "Na Agulha",
        style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Colors.white,
              fontFamily: 'Factor',
            ),
      ),
      backgroundColor: Color(0xFF6C5284),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    body: Stack(
      children: [
        ListView.builder(
          itemCount: pieces.length,
          itemBuilder: (context, index) {
            final piece = pieces[index];
            return PieceCard(
              piece: piece,
              onUpdate: (updatedPiece) {
                _updatePiece(piece['id'], updatedPiece);
              },
              onDelete: () => _confirmDelete(piece['id']),
              onEdit: () => _showPieceForm(context, piece),
            );
          },
        ),
        // Botão flutuante adicional acima da BottomAppBar
        Positioned(
          bottom: 80, // Distância da parte inferior da tela
          right: 16, // Alinhamento à direita
          child: FloatingActionButton(
            onPressed: () => _showPieceForm(context),
            child: Icon(Icons.add, color: Colors.white),
            backgroundColor: Color(0xFF6C5284),
          ),
        ),
      ],
    ),
    /*floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    // Botão principal para navegação (na barra inferior)
    floatingActionButton: FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: const Color(0xFF6C5284),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AnnouncementsScreen(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.playlist_add_rounded),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CrochetControlScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(width: 24), // Espaço central para o FAB
              IconButton(
                icon: const Icon(Icons.featured_play_list_outlined),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Store(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.calculate_outlined),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MaterialCalculator(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ),*/
  );
}


  void _confirmDelete(String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmação"),
          content: Text("Tem certeza de que deseja excluir esta peça?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Não"),
            ),
            TextButton(
              onPressed: () {
                _deletePiece(id);
                Navigator.of(context).pop();
              },
              child: Text("Sim"),
            ),
          ],
        );
      },
    );
  }

  void _showPieceForm(BuildContext context, [Map<String, dynamic>? piece]) {
    showDialog(
      context: context,
      builder: (context) {
        return PieceForm(
          piece: piece,
          onSave: (pieceData) {
            if (piece != null) {
              _updatePiece(piece['id'], pieceData);
            } else {
              _savePiece(pieceData);
            }
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}

class PieceCard extends StatefulWidget {
  final Map<String, dynamic> piece;
  final ValueChanged<Map<String, dynamic>> onUpdate;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  PieceCard({required this.piece, required this.onUpdate, required this.onDelete, required this.onEdit});

  @override
  _PieceCardState createState() => _PieceCardState();
}

class _PieceCardState extends State<PieceCard> {
  bool isExpanded = false;
  int hours = 0;

  @override
  void initState() {
    super.initState();
    hours = widget.piece['hoursWorked'] ?? 0;
  }

  void _incrementHours() {
    setState(() {
      hours++;
    });
    widget.onUpdate({...widget.piece, 'hoursWorked': hours});
  }

  void _decrementHours() {
    if (hours > 0) {
      setState(() {
        hours--;
      });
      widget.onUpdate({...widget.piece, 'hoursWorked': hours});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF6C5284),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.piece['name'],
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.white),
                  onPressed: widget.onEdit,
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.white),
                  onPressed: widget.onDelete,
                ),
                IconButton(
                  icon: Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                ),
              ],
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoRow("Fio", widget.piece['yarnName']),
                  _infoRow("Cor do Fio", widget.piece['yarnColor']),
                  _infoRow("Agulha", widget.piece['needleSize']),
                  _infoRow("Cliente", widget.piece['clientName']),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Horas", style: TextStyle(color: Colors.white)),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.white),
                            onPressed: _decrementHours,
                          ),
                          Text("$hours", style: TextStyle(color: Colors.white)),
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.white),
                            onPressed: _incrementHours,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.white)),
          Text(value, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

class PieceForm extends StatefulWidget {
  final Map<String, dynamic>? piece;
  final ValueChanged<Map<String, dynamic>> onSave;

  PieceForm({this.piece, required this.onSave});

  @override
  _PieceFormState createState() => _PieceFormState();
}

class _PieceFormState extends State<PieceForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String yarnName = '';
  String yarnColor = '';
  String needleSize = '';
  String clientName = '';
  int hoursWorked = 0;

  @override
  void initState() {
    super.initState();
    if (widget.piece != null) {
      name = widget.piece!['name'];
      yarnName = widget.piece!['yarnName'];
      yarnColor = widget.piece!['yarnColor'];
      needleSize = widget.piece!['needleSize'];
      clientName = widget.piece!['clientName'];
      hoursWorked = widget.piece!['hoursWorked'] ?? 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.piece == null ? "Adicionar Nova Peça" : "Editar Peça"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTextField("Nome da Peça", (value) => name = value, initialValue: name),
            _buildTextField("Nome do Fio", (value) => yarnName = value, initialValue: yarnName),
            _buildTextField("Cor do Fio", (value) => yarnColor = value, initialValue: yarnColor),
            _buildTextField("Número da Agulha", (value) => needleSize = value, initialValue: needleSize),
            _buildTextField("Nome do Cliente", (value) => clientName = value, initialValue: clientName),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Horas Trabalhadas"),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (hoursWorked > 0) setState(() => hoursWorked--);
                  },
                ),
                Text("$hoursWorked"),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => setState(() => hoursWorked++),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Cancelar"),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              widget.onSave({
                'name': name,
                'yarnName': yarnName,
                'yarnColor': yarnColor,
                'needleSize': needleSize,
                'clientName': clientName,
                'hoursWorked': hoursWorked,
              });
            }
          },
          child: Text("Salvar"),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, ValueChanged<String> onChanged, {String? initialValue}) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(labelText: label),
      onChanged: onChanged,
      validator: (value) => value!.isEmpty ? 'Este campo é obrigatório' : null,
    );
  }
}