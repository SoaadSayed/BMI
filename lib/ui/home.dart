import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  BMIState createState() => BMIState();
}

class BMIState extends State<BMI> {

  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();

  // to convert height into inch
  double inches = 0.0;

  double result = 0.0;

  String _resultReading = '';

  String _finalResult = '';
  void _calculateBMI() {

    /*
      BMI Weight Status
      Below 18.5 Underweight
      18.5 - 24.9 Normal
      25.0 - 29.9 Overweight
      30.0 and Above  Obese
    */
    setState(() {

      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
//      inches = height * 12;
      double weight = double.parse(_weightController.text);

      if((_ageController.text.isNotEmpty || age > 0)
          && ((_heightController.text.isNotEmpty || inches > 0)
          && (_weightController.text.isNotEmpty || weight > 0))) {

        result = weight / (height * height) * 10000; // Our BMI

        // Do the reading
        if(double.parse(result.toStringAsFixed(1)) < 18.5) {

          _resultReading = 'Underweight';
          print(_resultReading);
        }
        else if(double.parse(result.toStringAsFixed(1)) >= 18.5 && result < 25) {

          _resultReading = 'Great Shape!';  // Normal
        }
        else if(double.parse(result.toStringAsFixed(1)) >= 25.0 && result < 30) {

          _resultReading = 'Overweight';
        }
        else if(double.parse(result.toStringAsFixed(1)) >= 30.0) {

          _resultReading = 'Obese';
        }


      } else {

        result = 0.0;
      }

    });

    _finalResult = 'Your BMI ${result.toStringAsFixed(1)}';
    
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: new AppBar(

        title: new Text('BMI'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),

      backgroundColor: Color(0xffEDF5E1),

      body: new Container(

        alignment: Alignment.topCenter,
        child: new ListView(

          padding: const EdgeInsets.all(2.5),
          children: <Widget>[

            new Image.asset(

              'images/bmilogo.png',
              height: 80.0,
              width: 80.0,
            ),

            new Container(

              margin: const EdgeInsets.all(3.0),
              height: 240.0,
              width: 290.0,
              color: Colors.grey.shade300,
              alignment: Alignment.center,
              child: new Column(

                children: <Widget>[

                  new Expanded(

                    child: new TextField(

                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(

                        labelText: 'Age',
                        icon: new Icon(Icons.person_outline),

                      ),
                    ),
                  ),

                  new TextField(

                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(

                      labelText: 'Height in cm',
                      icon: new Icon(Icons.insert_chart),

                    ),
                  ),

                  new TextField(

                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(

                      labelText: 'Weight in kg',
                      icon: new Icon(Icons.line_weight),

                    ),
                  ),

                  new Padding(padding: new EdgeInsets.all(10.6)),

                  new Container(

                    alignment: Alignment.center,
                    child: RaisedButton(

                      onPressed: _calculateBMI,
                      child: new Text('Calculate'),
                      color: Colors.pinkAccent,
                      textColor: Colors.white,

                    ),
                  )
                ],
              ),
            ),

            new Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                new Text(

                  '$_finalResult',
                  style: new TextStyle(

                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    fontSize: 19.9
                  ),
                ),

                new Padding(padding: const EdgeInsets.all(5.0)),

                new Text(

                  '$_resultReading',
                  style: new TextStyle(

                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.9
                  ),
                )

              ],
            ),
          ],

        ),
      ),
    );
  }
}
