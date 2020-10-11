import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookSeats extends StatelessWidget {
  final title;
  BookSeats(this.title);


  @override
  Widget build(BuildContext context) {
    seats = new List<int>();
    return Scaffold(
      body: BookSeatsScreen(this.title),
    );
  }
}

class BookSeatsScreen extends StatefulWidget {
  final title;
  BookSeatsScreen(this.title);
  @override
  _BookSeatsScreenState createState() => _BookSeatsScreenState();
}
List<int> seats = new List<int>();

class _BookSeatsScreenState extends State<BookSeatsScreen> {
  double _height, _width;
  SharedPreferences prefs;
  bool _load = false;
  String _email, searchString='';
  GlobalKey<FormState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    try {
      SharedPreferences.getInstance().then((sharedPrefs) {
        setState(() {
          prefs = sharedPrefs;
          _email = prefs.getString('email');
        });
      });
    } catch (e) {
      print(e.message);
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery
        .of(context)
        .size
        .height;
    _width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
          child: Column(
              children: [
                SizedBox(height: _height / 20),
                Text(widget.title.toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Center(child: Image.asset('images/screen.png')),
                Text("Screen this way"),
                SizedBox(height: _height / 20),
                Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: (_width / 20),
                                ),
                                CienmaSeat(seatNumber: 1),
                                CienmaSeat(seatNumber: 2),
                                CienmaSeat(seatNumber: 3),
                                SizedBox(
                                  width: (_width / 20) * 2,
                                ),
                                CienmaSeat(seatNumber: 4),
                                CienmaSeat(seatNumber: 5),
                                SizedBox(
                                  width: (_width / 20),
                                ),
                              ]
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: (_width / 20),
                                ),
                                CienmaSeat(seatNumber: 6),
                                CienmaSeat(seatNumber: 7),
                                CienmaSeat(seatNumber: 8),
                                CienmaSeat(seatNumber: 9),
                                SizedBox(
                                  width: (_width / 20) * 2,
                                ),
                                CienmaSeat(seatNumber: 10),
                                CienmaSeat(seatNumber: 11),
                                CienmaSeat(seatNumber: 12),
                                SizedBox(
                                  width: (_width / 20),
                                ),
                              ]
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: (_width / 20),
                                ),
                                CienmaSeat(seatNumber: 13),
                                CienmaSeat(seatNumber: 14),
                                CienmaSeat(seatNumber: 15),
                                CienmaSeat(seatNumber: 16),
                                SizedBox(
                                  width: (_width / 20) * 2,
                                ),
                                CienmaSeat(seatNumber: 17),
                                CienmaSeat(seatNumber: 18),
                                CienmaSeat(seatNumber: 19),
                                SizedBox(
                                  width: (_width / 20),
                                ),
                              ]
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: (_width / 20),
                                ),
                                CienmaSeat(seatNumber: 20),
                                CienmaSeat(seatNumber: 21),
                                CienmaSeat(seatNumber: 22),
                                CienmaSeat(seatNumber: 23),
                                SizedBox(
                                  width: (_width / 20) * 2,
                                ),
                                CienmaSeat(seatNumber: 24),
                                CienmaSeat(seatNumber: 25),
                                CienmaSeat(seatNumber: 26),
                                SizedBox(
                                  width: (_width / 20),
                                ),
                              ]
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: (_width / 20),
                                ),
                                CienmaSeat(seatNumber: 27),
                                CienmaSeat(seatNumber: 28),
                                CienmaSeat(seatNumber: 29),
                                CienmaSeat(seatNumber: 30),
                                SizedBox(
                                  width: (_width / 20) * 2,
                                ),
                                CienmaSeat(seatNumber: 31),
                                CienmaSeat(seatNumber: 32),
                                CienmaSeat(seatNumber: 33),
                                SizedBox(
                                  width: (_width / 20),
                                ),
                              ]
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: (_width / 20),
                                ),
                                CienmaSeat(seatNumber: 34),
                                CienmaSeat(seatNumber: 35),
                                CienmaSeat(seatNumber: 36),
                                CienmaSeat(seatNumber: 37),
                                SizedBox(
                                  width: (_width / 20) * 2,
                                ),
                                CienmaSeat(seatNumber: 38),
                                CienmaSeat(seatNumber: 39),
                                CienmaSeat(seatNumber: 40),
                                SizedBox(
                                  width: (_width / 20),
                                ),
                              ]
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: (_width / 20),
                                ),
                                CienmaSeat(seatNumber: 41),
                                CienmaSeat(seatNumber: 42),
                                CienmaSeat(seatNumber: 43),
                                CienmaSeat(seatNumber: 44),
                                SizedBox(
                                  width: (_width / 20) * 2,
                                ),
                                CienmaSeat(seatNumber: 45),
                                CienmaSeat(seatNumber: 46),
                                CienmaSeat(seatNumber: 47),
                                SizedBox(
                                  width: (_width / 20),
                                ),
                              ]
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: (_width / 20),
                                ),
                                CienmaSeat(seatNumber: 48),
                                CienmaSeat(seatNumber: 49),
                                CienmaSeat(seatNumber: 50),
                                CienmaSeat(seatNumber: 51),
                                SizedBox(
                                  width: (_width / 20) * 2,
                                ),
                                CienmaSeat(seatNumber: 52),
                                CienmaSeat(seatNumber: 53),
                                CienmaSeat(seatNumber: 54),
                                SizedBox(
                                  width: (_width / 20),
                                ),
                              ]
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: (_width / 20),
                                ),
                                CienmaSeat(seatNumber: 55),
                                CienmaSeat(seatNumber: 56),
                                CienmaSeat(seatNumber: 57),
                                SizedBox(
                                  width: (_width / 20) * 2,
                                ),
                                CienmaSeat(seatNumber: 58),
                                CienmaSeat(seatNumber: 59),
                                SizedBox(
                                  width: (_width / 20),
                                ),
                              ]
                          ),
                        ]
                    )
                ),
                SizedBox(height: _height / 20),
                button(),
              ])
      ),
    );
  }

  Widget button() {
    return !_load ? RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () async {
        if(seats.length == 0)
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('No seats has bee selected')));
        else{
          setState(() {
            _load = true;
          });
          try{
            await Firestore.instance.collection('tickets').document().setData({'seats': seats.toString(),'movie_name': widget.title,'email': _email,});
            setState((){_load = false;});
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('Booked Successfully')));
          }catch(e){
            setState((){_load = false;});
            print(e.message);
            Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.message)));
          }
        }
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: _width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.teal, Colors.teal[700]],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('BOOK NOW', style: TextStyle(fontSize: 15)),
      ),
    ) : Center(
      child: CircularProgressIndicator(),
    );
  }
}

class CienmaSeat extends StatefulWidget {
  bool isSelected;
  int seatNumber;

  CienmaSeat({this.isSelected = false, this.seatNumber});

  @override
  _CienmaSeatState createState() => _CienmaSeatState();
}

class _CienmaSeatState extends State<CienmaSeat> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          if (widget.isSelected){
            seats.remove(widget.seatNumber);
          }else{
            seats.add(widget.seatNumber);
          }
          widget.isSelected = !widget.isSelected;
        });
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
          width: MediaQuery.of(context).size.width / 15,
          height: MediaQuery.of(context).size.width / 15,
          child: Text(widget.seatNumber.toString(), textAlign: TextAlign.center),
          decoration: BoxDecoration(
              color: widget.isSelected
                  ? Colors.teal
                  : Colors.grey,
              border: !widget.isSelected
                  ? Border.all(color: Colors.grey, width: 1.0)
                  : null,
              borderRadius: BorderRadius.circular(5.0))),
    );

  }
}