import 'package:ancient_maps/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).whenComplete(() {
    runApp(MaterialApp(
        title: 'Navigation Basics',
        home: const FirstRoute(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false));
  });
}

final emailController = TextEditingController();
final passwordController = TextEditingController();
final FirebaseAuth _auth = FirebaseAuth.instance;

class FirstRoute extends StatefulWidget {
  const FirstRoute({super.key});

  @override
  State<FirstRoute> createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in! Navigate to main page');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ThirdRoute()),
        );
      }
    });
  }

  String message = ' ';

  void _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      setState(() {
        message = '';
      });
    } catch (error) {
      setState(() {
        message = error.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30, 2, 30, 2),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter proper text';
                  }
                  return null;
                },
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 2, 30, 2),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter proper text';
                  }
                  return null;
                },
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 6, 30, 6),
              child: SizedBox(
                width: 300, // <-- Your width
                height: 30, // <-- Your height
                child: ElevatedButton(
                  onPressed: () {
                    _login();
                    if (message == '') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThirdRoute()),
                      );
                    }
                    ;
                  },
                  child: Text('Login', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                  text: "I don't have an account",
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    }),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(message,
                  style: TextStyle(color: Colors.red, fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatefulWidget {
  const SecondRoute({super.key});

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  String message = ' ';

  void _register() async {
    setState(() {
      message = ' ';
    });
    try {
      await _auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      setState(() {
        message = '';
      });
    } catch (error) {
      setState(() {
        message = error.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30, 2, 30, 2),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter proper text';
                  }
                  return null;
                },
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 2, 30, 2),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter proper text';
                  }
                  return null;
                },
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 6, 30, 6),
              child: SizedBox(
                width: 300, // <-- Your width
                height: 30, // <-- Your height
                child: ElevatedButton(
                  //onPressed: () {Navigator.pop(context);},
                  onPressed: () {
                    _register();
                    if (message == '') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThirdRoute()),
                      );
                    }
                    ;
                  },
                  child: Text('Register', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(message,
                  style: TextStyle(color: Colors.red, fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdRoute extends StatefulWidget {
  const ThirdRoute({super.key});

  @override
  State<ThirdRoute> createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
  String pageTitle = 'Map Page: Open Street Map';
  String mapLink = 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';
  // ApiKey is stored somewhere else. You gotta add it tho
  String apiKey = '';

  void changeMap(String mL, String pT) {
    setState(() {
      mapLink = mL;
      pageTitle = pT;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
                center: LatLng(52.220537662823844, 21.01063312851598),
                zoom: 10,
                minZoom: 10,
                maxZoom: 18
                // apikey: '059455e4eb924d629ec71dcfb0ecd994'
                ),
            children: [
              TileLayer(urlTemplate: mapLink, additionalOptions: {
                'apikey': '059455e4eb924d629ec71dcfb0ecd994'
              }),
            ],
          ),
        ],
      ),
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: () {
                  changeMap('https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      'Map Page: OpenStreetMap');
                },
                backgroundColor: Colors.white,
                child: Icon(Icons.add_road),
              )),
          Container(
              margin: EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: () {
                  changeMap(
                      'https://tile.thunderforest.com/transport-dark/{z}/{x}/{y}.png?apikey=$apiKey',
                      'Map Page: TransportDark');
                },
                backgroundColor: Colors.deepPurple,
                child: Icon(Icons.add_road),
              )),
          Container(
              margin: EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: () {
                  changeMap(
                      'https://tile.thunderforest.com/spinal-map/{z}/{x}/{y}.png?apikey=$apiKey',
                      'Map Page: SpinalMap');
                },
                backgroundColor: Colors.deepOrange,
                child: Icon(Icons.add_road),
              )),
        ],
      ),
    );
  }
}
