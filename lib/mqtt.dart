import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Mqtt extends StatefulWidget {
  @override
  _MqttState createState() => _MqttState();
}

class _MqttState extends State<Mqtt> {
  _launchURL() async {
    const url = 'https://drive.google.com/drive/u/0/folders/1-P1SLOFOUFNO4X0uYlMnIkZXK735GvPh';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MQTT'),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("I was facing issue in understanding MQTT"),
              FlatButton(onPressed: _launchURL, child: Text('See my Project')),

              Flexible(child: Text("\n\nBy clicking this link \nit will redirect to my project google drive\n Have a look\n"))
            ],
          ),
        ));
  }
}
