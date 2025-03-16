import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = true;

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.lightBlueAccent,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
    );
    return MaterialApp(
      theme: themeData,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Cylium',
            style: TextStyle(fontFamily: 'VT323', fontSize: 48),
          ),
          actions: [
            SizedBox(
              width: 250,
              child: TextField(
                controller: _controller,
                onSubmitted: (String value) {
                  _openlink('https://google.com/search?q=$value');
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(64.0),
                  ),
                  hintText: 'Tik een zoekterm in',
                  labelText: 'Zoeken met Google',
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Tooltip(
            message: 'Change brightness mode',
            child: IconButton(
              isSelected: isDark,
              onPressed: () {
                setState(() {
                  isDark = !isDark;
                });
              },
              icon: const Icon(Icons.wb_sunny_outlined),
              selectedIcon: const Icon(Icons.brightness_2_outlined),
            ),
          ),
        ),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(3.7),
                    child: Text(
                      'Cylium is een website opgericht in 2025, gemaakt om speelgoed en boeken voor verschillende leeftijdsgroepen te verkopen.',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Boeken', style: TextStyle(fontSize: 42)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Spelletjes', style: TextStyle(fontSize: 42)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Speelgoed', style: TextStyle(fontSize: 42)),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(7.7),
                    child: Text(
                      'Interessante links',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _openlink('https://nl.wikipedia.org');
                      },
                      child: Text('Wikipedia', style: TextStyle(fontSize: 32)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _openlink(
                          'https://10fastfingers.com/typing-test/dutch',
                        );
                      },
                      child: Text('Typtest', style: TextStyle(fontSize: 32)),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(7.7),
                    child: Text(
                      'Google dingen',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _openlink('https://classroom.google.com');
                      },
                      child: Text(
                        'Google Classroom',
                        style: TextStyle(fontSize: 28),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _openlink('https://docs.google.com/document');
                      },
                      child: Text(
                        'Google Docs',
                        style: TextStyle(fontSize: 28),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _openlink('https://docs.google.com/presentation');
                      },
                      child: Text(
                        'Google Slides',
                        style: TextStyle(fontSize: 28),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _openlink('https://docs.google.com/spreadsheets');
                      },
                      child: Text(
                        'Google Sheets',
                        style: TextStyle(fontSize: 28),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.black87, // Background color
      child: Center(
        child: Text(
          '© 2020-2025 Anirudh Menon. Alle rechten voorbehounden.',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}

void _openlink(String url) {
  final Uri _url = Uri.parse(url);
  launchUrl(_url);
}
