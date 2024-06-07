import 'package:flutter/material.dart';
import 'package:habituall/pages/inicial.page.dart';

class SaudeMentalPage extends StatefulWidget {
  const SaudeMentalPage({super.key});

  @override
  State<SaudeMentalPage> createState() => _SaudeMentalPageState();
}

class _SaudeMentalPageState extends State<SaudeMentalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const InicialPage()),
                  ),
                );
              },
              icon: const Icon(
                Icons.keyboard_backspace_rounded,
                color: Color.fromARGB(255, 0, 0, 0),
              )),
      ),
      
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 300,
                height: 300,
                child: Image.asset('images/saudemental.png'),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                    style: TextStyle(fontFamily: 'america'),
                    textAlign: TextAlign.justify,
                    'Cuide da sua saúde mental: uma jornada para o equilíbrio emocional. Praticar exercícios físicos regularmente é um excelente começo para promover o bem-estar mental, reduzindo o estresse e melhorando o humor. No entanto, lembre-se de que a saúde mental vai além do físico. Buscar terapia com um profissional capacitado é fundamental para lidar com questões mais profundas e desenvolver estratégias eficazes de enfrentamento\nÉ importante destacar que o governo brasileiro oferece serviços de saúde mental gratuitos ou a preços acessíveis em muitas cidades. O Sistema Único de Saúde (SUS) disponibiliza atendimentos psicológicos e psiquiátricos em unidades de saúde e centros especializados. Além disso, existem programas e campanhas voltados para a promoção da saúde mental e prevenção de transtornos, como o Setembro Amarelo, dedicado à conscientização sobre o suicídio.\nLembre-se sempre: cuidar da mente é tão importante quanto cuidar do corpo. Priorize sua saúde mental e busque ajuda quando necessário. Você não está sozinho nessa jornada.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
