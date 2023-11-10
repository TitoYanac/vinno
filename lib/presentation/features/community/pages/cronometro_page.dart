import 'package:flutter/material.dart';

import 'dart:async';

class CronometroPage extends StatefulWidget {
  const CronometroPage({super.key});

  @override
  State<CronometroPage> createState() => _CronometroPageState();
}

class _CronometroPageState extends State<CronometroPage> {
  final Stopwatch _stopwatch = Stopwatch();
  final StreamController<int> _microsecondsController = StreamController<int>();
  Timer? _timer;  // Define una variable para el Timer

  @override
  void initState() {
    super.initState();
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(microseconds: 1), _updateMicroseconds);  // Asigna el Timer a la variable
  }

  void _updateMicroseconds(Timer timer) {
    _microsecondsController.add(_stopwatch.elapsedMicroseconds);
  }

  @override
  void dispose() {
    _timer?.cancel();  // Cancela el Timer cuando se desecha el estado
    _microsecondsController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<int>(
        stream: _microsecondsController.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text('00:00:00.000000');
          }
          final microsegundos = snapshot.data;
          final segundos = (microsegundos! / 1000000).floor();
          final minutos = (segundos / 60).floor();
          final horas = (minutos / 60).floor();
          final microsStr = (microsegundos % 1000000).toString().padLeft(6, '0');
          final segundosStr = (segundos % 60).toString().padLeft(2, '0');
          final minutosStr = (minutos % 60).toString().padLeft(2, '0');
          final horasStr = horas.toString().padLeft(2, '0');
          return Text('$horasStr:$minutosStr:$segundosStr.$microsStr');
        },
      ),
    );
  }
}
