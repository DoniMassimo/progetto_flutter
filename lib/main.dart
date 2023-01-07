import 'package:project1/utils/authentication.dart';
import 'package:flutter/material.dart';
import 'package:project1/widgets/auth_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // ignore: prefer_const_constructors
      floatingActionButton: FloatingActionButton(
          
                onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AuthDialog(),
            ));
        }
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: Text(userEmail!),
      ),
      bottomSheet: BottomAppBar(child: FloatingActionButton(
        onPressed: () {
          signOutGoogle() { 
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => const HomePage(title: 'LOGGATOOOO PORCODIOOO',),
                ),
              );
          };
          })));
        }

    
  }

