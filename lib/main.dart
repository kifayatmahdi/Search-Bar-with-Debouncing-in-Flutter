import 'package:flutter/material.dart';
import 'search_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final SearchBloc bloc = SearchBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Search with Debounce",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Search",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  bloc.onTextChanged(value); // send typing to BLoC
                },
              ),
              SizedBox(height: 20),

              // StreamBuilder will receive debounced text
              StreamBuilder<String>(
                stream: bloc.searchStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("Start typing...");
                  }
                  return Text(
                    "Searching for: ${snapshot.data}",
                    style: TextStyle(fontSize: 22),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
