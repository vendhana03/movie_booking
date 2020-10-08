import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignupPage(),
    );
  }
}
class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  double _height, _width;
  String _email = '',
      _password = '',
      _name = '',
      _phone = '';
  GlobalKey<FormState> _key = GlobalKey();
  bool _showPassword = true,
      _load = false;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
      ),
      body: Container(
        height: _height,
        width: _width,
        padding: EdgeInsets.only(bottom: 5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              signupText(),
              form(),
              SizedBox(height: _height / 12),
              button(),
            ],
          ),
        ),
      ),
    );
  }


  Widget signupText() {
    return Container(
      margin: EdgeInsets.only(left: _width / 15.0),
      child: Row(
        children: <Widget>[
          Text(
            "Create Account",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }


  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0,
          right: _width / 12.0,
          top: _height / 15.0),
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            firstname(),
            SizedBox(height: _height / 40.0),
            emailBox(),
            SizedBox(height: _height / 40.0),
            contact(),
            SizedBox(height: _height / 40.0),
            passwordBox(),
          ],
        ),
      ),
    );
  }

  Widget emailBox() {
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: 10,
      child: TextFormField(
        onSaved: (input) => _email = input,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.teal,
        obscureText: false,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email, color: Colors.teal, size: 20),
          hintText: "Email ID",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget passwordBox() {
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: 10,
      child: TextFormField(
        onSaved: (input) => _password = input,
        keyboardType: TextInputType.visiblePassword,
        cursorColor: Colors.teal,
        obscureText: _showPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock, color: Colors.teal, size: 20),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.remove_red_eye,
              color: this._showPassword ? Colors.grey : Colors.teal,
            ),
            onPressed: () {
              setState(() => this._showPassword = !this._showPassword);
            },
          ),
          hintText: "Password",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none
          ),
        ),
      ),
    );
  }

  Widget firstname(){
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: 10,
      child: TextFormField(
        onSaved: (input) => _name = input,
        keyboardType: TextInputType.text,
        cursorColor: Colors.teal,
        obscureText: false,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person, color: Colors.teal, size: 20),
          hintText: "Name",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }


  Widget contact() {
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: 10,
      child: TextFormField(
        onSaved: (input) => _phone = input,
        keyboardType: TextInputType.number,
        cursorColor: Colors.teal,
        obscureText: false,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone, color: Colors.teal, size: 20),
          hintText: "Phone Number",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }


  Widget button() {
    return !_load ? RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        RegExp regExp = new RegExp(
            r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$');
        RegExp regPh = new  RegExp(
            r'(^(?:[+0]9)?[0-9]{10,12}$)');
        final formstate = _key.currentState;
        formstate.save();
        if (_email == null || _email.isEmpty) {
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Email Cannot be empty')));
        } else if (_password == null || _password.length < 6) {
          Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Password needs to be atleast six characters')));
        } else if (!regExp.hasMatch(_email)) {
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Enter a Valid Email')));
        }else if (_name == null || _name.isEmpty){
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Your Name Cannot be empty')));
        }else if (_phone == null || _phone.isEmpty){
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Phone Number Cannot be empty')));
        }else if(!regPh.hasMatch(_phone)) {
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Enter a Valid Phone Number')));
        } else {
          setState(() {
            _load = true;
          });
          signUp();
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
        child: Text('CREATE ACCOUNT', style: TextStyle(fontSize: 15)),
      ),
    ) : Center(
      child: CircularProgressIndicator(),
    );
  }

  Future<void> signUp() async{
    try{
      AuthResult result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
      await Firestore.instance.collection('users').document().setData({'email': _email,'name':_name,'contact':_phone,});
      setState((){_load = false;});
      Navigator.of(context).pushReplacementNamed('login');
    }catch(e){
      setState((){_load = false;});
      print(e.message);
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }

  }

}
