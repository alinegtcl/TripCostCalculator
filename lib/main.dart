import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Trip cost calculator',
      home: FuelForm(),
    );
  }
}

class FuelForm extends StatefulWidget {
  const FuelForm({super.key});

  @override
  State<StatefulWidget> createState() => _FuelFormState();
}

class _FuelFormState extends State<FuelForm> {

  String moeda = "Dollars";
  TextEditingController distanciaTotal = TextEditingController();
  TextEditingController distanciaUnitaria = TextEditingController();
  TextEditingController custoCombustivel = TextEditingController();
  String texto = "";

  @override
  Widget build(BuildContext formContext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculador de Gasto de Viagem"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 5.0,
              bottom: 5.0,
            ),
            child: TextField(
              controller: distanciaTotal,
              decoration: InputDecoration(
                labelText: 'Distância total',
                hintText: 'p.ex.124',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 5.0,
              bottom: 5.0,
            ),
            child: TextField(
              controller: distanciaUnitaria,
              decoration: InputDecoration(
                labelText: 'Distância por litro',
                hintText: 'p.ex. 9.5',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 5.0,
              bottom: 5.0,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: custoCombustivel,
                    decoration: InputDecoration(
                      labelText: 'Preço do combústivel',
                      hintText: 'p.ex. 3.7',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  width: 25.0,
                ),
                Expanded(
                  child: DropdownButton<String>(
                    items: const <DropdownMenuItem<String>>[
                      DropdownMenuItem<String>(
                        value: 'Dollars',
                        child: Text('Dollars'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Euro',
                        child: Text('Euro'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Pounds',
                        child: Text('Pounds'),
                      ),
                    ],
                    value: moeda,
                    onChanged: (String? v) {
                      setState(() {
                        moeda = v!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 22),
                  ),
                  onPressed: () {
                    setState(
                      () {
                        texto = calcula();
                      },
                    );
                  },
                  child: const Text(
                    'Submit',
                  ),
                ),
              ),
              Container(
                width: 15.0,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 22),
                  ),
                  onPressed: () {
                    distanciaTotal.text = '';
                    distanciaUnitaria.text = '';
                    custoCombustivel.text = '';
                    setState(() {
                      texto = '';
                    });
                  },
                  child: const Text(
                    'Reset',
                  ),
                ),
              ),
            ],
          ),
          Text(texto),
        ],
      ),
    );
  }

  String calcula() {
    double distancia = double.parse(distanciaTotal.text);
    double distunit = double.parse(distanciaUnitaria.text);
    double custo = double.parse(custoCombustivel.text);

    double total = distancia / distunit * custo;
    String saida =
        'O custo total da viagem é de ${total.toStringAsFixed(2)} $moeda';

    return saida;
  }
}
