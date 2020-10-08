import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../model/movie.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _load = true;
              });
              logout();
            },
          )
        ],
      ),
    body: SingleChildScrollView(
    physics: ScrollPhysics(),
    child: Column(
    children: [
    Card(
    child: TextField(
    decoration: InputDecoration(
    prefixIcon: Icon(Icons.search), hintText: 'Search...'),
    onChanged: (val) {
    setState(() {
    searchString = val;
    });
    },
    ),
    ),
    FutureBuilder<List<Movie>>(
    future: fetchMovies(new http.Client()),
    builder: (context, snapshot) {
    if (snapshot.hasError) print(snapshot.error);
    if(!snapshot.hasData){
    return new Center(child: new CircularProgressIndicator());
    } else {
    List<Movie> _suggestionList = (searchString == '' || searchString == null) ? snapshot.data
        : snapshot.data.where((element) => element.title.toLowerCase().contains(searchString.toLowerCase())).toList();
    return _buildList(context, _suggestionList);
    }
    },
    ),
    ],
    )
    )
    );
  }

  ListView _buildList(context, movies) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: movies.length,
        itemBuilder: (context, int) {
          return Card(
              child: InkWell(
                onTap: () {

                },
                child: Row(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 100,
                        minHeight: 150,
                        maxWidth: 100,
                        maxHeight: 150,
                      ),
                      child: FadeInImage(
                        placeholder: AssetImage("images/movie.jpg"),
                        image: NetworkImage(movies[int].url),
                        fit: BoxFit.fill,
                        alignment: Alignment.center,
                        fadeInDuration: Duration(milliseconds: 200),
                        fadeInCurve: Curves.linear,
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                        child: Text(movies[int].title, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
                    ),
                  ],
                ),
              )
          );
        }
    );
  }

  void logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', null);
      setState(() {
        _load = false;
      });
      Navigator.of(context).pushReplacementNamed('login');
    } catch (e) {
      setState(() {
        _load = false;
      });
      print(e.message);
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
