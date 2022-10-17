import 'package:bloc_example/counter_bloc.dart';
import 'package:bloc_example/counter_events.dart';
import 'package:bloc_example/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => CounterBloc(IdleState(0)),
          child: const MyHomePage(title: 'Flutter Demo Home Page')),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterStates>(builder: (context, state) {
              if (state is LoadingState) {
                return CircularProgressIndicator();
              } else if (state is IdleState) {
                return Text(
                  '${state.getCountValue}',
                  style: Theme.of(context).textTheme.headline4,
                );
              }
              return Container();
            }),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed:
                BlocProvider.of<CounterBloc>(context).state == LoadingState()
                    ? null
                    : () => BlocProvider.of<CounterBloc>(context)
                        .add(DecreaseCounter()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            onPressed:
                BlocProvider.of<CounterBloc>(context).state == LoadingState()
                    ? null
                    : () => BlocProvider.of<CounterBloc>(context)
                        .add(IncreaseCounter()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
