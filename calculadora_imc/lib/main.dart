import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Calculadora de IMC",
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heigthController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoValue = "Informe seus dados!";
  String _infoText = "";

  void _resetFields() {
    weightController.clear();
    heigthController.clear();

    setState(() {
      _formKey = GlobalKey<FormState>();

      _infoValue = "Informe seus dados!";
      _infoText = "";
    });
  }

  void _calculate() {
    double weight = double.parse(weightController.text.trim());
    double heigth = double.parse(heigthController.text.trim()) / 100;

    double imc = weight / (heigth * heigth);

    setState(() {
      if (imc < 17) {
        _infoValue = "IMC: ${imc.toStringAsPrecision(4)}";
        _infoText = "Muito abaixo do peso";
      } else if (imc >= 17 && imc <= 18.49) {
        _infoValue = "IMC: ${imc.toStringAsPrecision(4)}";
        _infoText = "Abaixo do peso";
      } else if (imc >= 18.5 && imc <= 24.99) {
        _infoValue = "IMC: ${imc.toStringAsPrecision(4)}";
        _infoText = "Peso normal";
      } else if (imc >= 25 && imc <= 29.99) {
        _infoValue = "IMC: ${imc.toStringAsPrecision(4)}";
        _infoText = "Acima do peso";
      } else if (imc >= 30 && imc <= 34.99) {
        _infoValue = "IMC: ${imc.toStringAsPrecision(4)}";
        _infoText = "Obesidade I";
      } else if (imc >= 35 && imc <= 39.99) {
        _infoValue = "IMC: ${imc.toStringAsPrecision(4)}";
        _infoText = "Obesidade II (severa)";
      } else if (imc > 40) {
        _infoValue = "IMC: ${imc.toStringAsPrecision(4)}";
        _infoText = "Obesidade III (mórbida)";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.refresh,
            ),
            onPressed: _resetFields,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 10.0,
          top: 10.0,
          right: 10.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 160.0,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.person,
                    size: 140.0,
                    color: Colors.white,
                  ),
                ),
              ),
              TextFormField(
                controller: weightController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Informe seu peso!";
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso (kg)",
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                ),
              ),
              TextFormField(
                controller: heigthController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Informe sua altura!";
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _calculate();
                      }
                    },
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                    color: Colors.green,
                  ),
                ),
              ),
              Text(
                _infoValue,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
