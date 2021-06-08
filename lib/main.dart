import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_1/classes/Employed.dart';
import 'package:flutter_bloc_1/src/bloc/employed/employed_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => new EmployedBloc(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final employedBloc = BlocProvider.of<EmployedBloc>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc 1',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Bloc 1'),
        ),
        body: BlocBuilder<EmployedBloc, EmployedState>(
          builder: (context, state) {
            if(state.status == 'start') employedBloc.add(GetEmployes(status: 'reload'));
            switch (state.status) {
              case 'loading':
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case 'ok':
                return ListView.builder(
                  itemCount: state.employes.length,
                  itemBuilder: (BuildContext context, int key) {
                    return ListTile(
                      title: Text(state.employes[key].names),
                    );
                  },
                );
                break;
              default:
                return Center(
                  child: Text('Error en la solitud'),
                );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            employedBloc.add(GetEmployes(status: 'reload'));
          },
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}
