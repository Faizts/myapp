part of 'counter_bloc.dart';

sealed class CounterEvents {}

class CounterIncrement extends CounterEvents {}

class CounterDecrement extends CounterEvents {}