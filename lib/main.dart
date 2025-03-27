import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Exam',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 222, 110, 110),
        ),
      ),
      home: const MyHomePage(title: 'First Exam of Mobile Apps '),
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
  int _counter = 0;

  // Esta implementación usa una simulación de persistencia para la demostración
  // En un caso real, reemplazaríamos esto con SharedPreferences después de instalar la dependencia

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  // Simulación de carga del contador
  Future<void> _loadCounter() async {
    // Esta es una simulación. En la implementación real, cargaríamos desde SharedPreferences
    await Future.delayed(const Duration(milliseconds: 500)); // Simular carga
    setState(() {
      // Si tuviéramos SharedPreferences, cargaríamos el valor desde ahí
      _counter = 0; // Valor por defecto al no tener persistencia real
    });
  }

  // Simulación de guardado del contador
  Future<void> _saveCounter() async {
    // Esta es una simulación. En la implementación real, guardaríamos en SharedPreferences
    // En esta versión, solo mostramos un mensaje indicando que se "guardó"
    debugPrint('Contador actualizado: $_counter (simulación de guardado)');
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _saveCounter();
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
    _saveCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Padding(padding: EdgeInsets.all(16.0)),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
