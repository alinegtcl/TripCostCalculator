import 'package:calculador_viagem/trip_cost_calculator/fuel_form.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Trip cost calculator',
      home: FuelForm(),
    );
  }
}
