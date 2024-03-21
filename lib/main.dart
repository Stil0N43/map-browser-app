import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:ancient_maps/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(MaterialApp(
      title: 'Navigation Basics',
      home: const FirstRoute(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

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
                decoration: InputDecoration(
                  hintText: 'Login',
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondRoute()),
                    );
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
                      fontWeight: FontWeight.bold
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    }),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

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
                decoration: InputDecoration(
                  hintText: 'Login',
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
                    Navigator.pop(context);
                  },
                  child: Text('Register', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
