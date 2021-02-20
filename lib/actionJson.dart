import 'package:flutter/material.dart';
import 'package:flutter_task/network.dart';

class WorkPlace extends StatefulWidget {
  @override
  _WorkPlaceState createState() => _WorkPlaceState();
}

class _WorkPlaceState extends State<WorkPlace> {
  //Future<WorkPlace> _getData;
  var _getData;
  //WorkPlace
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData=Network().getAxis()  ;
    
    _getData.then((value) => {
      //print("Get Longitude ${value.}")
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Container(

    //   body: Stack(
    //     children: [
    //
    //       _buildGoogleMap(context),
    //     ],
    //   ),
    // );
    );
  }

  _buildGoogleMap(BuildContext context) {}
}
