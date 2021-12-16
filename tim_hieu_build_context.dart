import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(context);
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 72, fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter BuildContext Demo'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Text 1',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const Text('Text 2', style: TextStyle(fontSize: 40)),
                Builder(builder: (context) {
                  return ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Hahahaha'),
                        ));
                      },
                      child: const Text('SHOW SNACKBAR'));
                })
              ],
            ),
          ),
        ));
  }
}
