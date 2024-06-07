import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IngestaoAguaPage extends StatefulWidget {
  const IngestaoAguaPage({super.key});

  @override
  State<IngestaoAguaPage> createState() => _IngestaoAguaPageState();
}

class _IngestaoAguaPageState extends State<IngestaoAguaPage> {
  int aguaIngerida = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      aguaIngerida = prefs.getInt('aguaIngerida') ?? 0;
    });
  }

  _saveData(int newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('aguaIngerida', newValue);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 233, 206, 132),
          titleTextStyle: const TextStyle(fontFamily: 'america'),
          title: const Text('Ingestão de Água'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Água Ingerida: $aguaIngerida ml',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'america'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          aguaIngerida = 0;
                          _saveData(aguaIngerida);
                        });
                      },
                      child: const Text('Zerar contador'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildButtonRow([50, 100, 250]),
              const SizedBox(height: 10),
              _buildButtonRow([500, 1000]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonRow(List<int> amounts) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: amounts
          .map(
            (amount) => ElevatedButton(
              onPressed: () {
                setState(() {
                  aguaIngerida += amount;
                  _saveData(aguaIngerida);
                });
              },
              child: Text('$amount ml'),
            ),
          )
          .toList(),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: IngestaoAguaPage(),
  ));
}
