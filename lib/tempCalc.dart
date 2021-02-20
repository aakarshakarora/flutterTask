import 'package:flutter/material.dart';
import 'package:flutter_task/mqtt.dart';
import 'main.dart';

class TempCalc extends StatefulWidget {
  String email;

  TempCalc(this.email);

  @override
  TempState createState() => TempState();
}

class TempState extends State<TempCalc> {
  double input;
  double output;
  bool fOrC;

  @override
  void initState() {
    super.initState();
    input = 0.0;
    output = 0.0;
    fOrC = true;
  }

  @override
  Widget build(BuildContext context) {
    TextField inputField = TextField(
      keyboardType: TextInputType.number,

      onChanged: (str) {
        try {
          input = double.parse(str);
        } catch (e) {
          input = 0.0;
        }
      },
      decoration: InputDecoration(
        labelText:
            "Input a Value in ${fOrC == false ? "Fahrenheit" : "Celsius"}",
      ),
      textAlign: TextAlign.center,
    );

    AppBar appBar = AppBar(
      title: Text("Temperature Calculator"),
      backgroundColor: Colors.purple,
    );

    Container tempSwitch = Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("F"),
          Radio<bool>(
              groupValue: fOrC,
              value: false,
              onChanged: (v) {
                setState(() {
                  fOrC = v;
                  output = (input - 32) * (5 / 9);
                });
              }),
          Text("C"),
          Radio<bool>(
              groupValue: fOrC,
              value: true,
              onChanged: (v) {
                setState(() {
                  fOrC = v;
                  output = (input * 9 / 5) + 32;
                });
              }),
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(
                'Welcome Username',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              accountEmail: new Text(widget.email),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('assets/test.gif'),
                  fit: BoxFit.cover,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://randomuser.me/api/portraits/men/44.jpg")),
            ),
            new ListTile(
              leading: Icon(Icons.cast),
              title: new Text(
                "MQTT",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mqtt()),
                );
              },
            ),
            new ListTile(
              leading: Icon(Icons.wb_sunny),
              title: new Text(
                "Temperature Calculator",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TempCalc(widget.email)),
                );
              },
            ),
            new Divider(),
            new ListTile(
                leading: Icon(Icons.power_settings_new),
                title: new Text("Logout",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                  ),),
                onTap: () {

                  Navigator.of(context, rootNavigator: true)
                      .pushReplacement(MaterialPageRoute(
                      builder: (context) => HomePage()));
                }),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            inputField,
            tempSwitch,
            Column(
              children: [
                fOrC == false
                    ? Text(
                        "${input.toStringAsFixed(2)} F : ${output.toStringAsFixed(2)} C",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))
                    : Text(
                        "${input.toStringAsFixed(2)} C : ${output.toStringAsFixed(2)} F",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
