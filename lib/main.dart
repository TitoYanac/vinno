import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinno/bloc_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vinno',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocTest>(
      create: (context) => BlocTest(),
      child: PageInit(),
    );
  }
}

class PageInit extends StatefulWidget {
  const PageInit({super.key});

  @override
  State<PageInit> createState() => _PageInitState();
}

class _PageInitState extends State<PageInit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vinno Page 1'),
      ),
      body: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(

            color: Colors.red,
            border: Border.all(width: 1,color: Colors.black54),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: BlocBuilder<BlocTest, BlocTestState>(
            builder: (context, state) {
              return Text(state.numero.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //BlocProvider.of<BlocTest>(context).incrementCounter();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Page2Vinno()),
                (route) => false, // Elimina todas las rutas anteriores.
          );

        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Page2Vinno extends StatefulWidget {
  const Page2Vinno({super.key});

  @override
  State<Page2Vinno> createState() => _Page2VinnoState();
}

class _Page2VinnoState extends State<Page2Vinno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vinno Page 2'),
      ),
      body: Center(child: Text('Vinno Page 2'),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.close),
      ),
    );
  }
}
