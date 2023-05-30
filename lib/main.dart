import 'package:flutter/material.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
  int catIndex = 0;
  int catItemCount = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: catItemCount,
                        itemBuilder: (ctx, index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  catIndex = index;
                                });
                              },
                              child: Container(
                                color: catIndex == index
                                    ? Colors.blue
                                    : Colors.white,
                                width: 100,
                                child: Text(
                                  "Cat $index",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )),
                  )
                ],
              ),
            ),
            Expanded(
              child: Scrollbar(
                  child: ListView.builder(
                      itemCount: catItemCount,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 400,
                            color: Colors.yellow,
                            child: Column(
                              children: [Text("cat $index")],
                            ),
                          ),
                        );
                      })),
            )
          ],
        ));
  }
}
