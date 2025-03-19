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
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    BoekenScreen(),
    SpelletjesScreen(),
    SpeelgoedScreen(),
    PixelArtScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlueAccent,
          brightness: isDark ? Brightness.dark : Brightness.light,
        ),
      ),
      home: Scaffold(
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
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Start'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.book),
                  label: Text('Boeken'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.videogame_asset),
                  label: Text('Spelletjes'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.toys),
                  label: Text('Speelgoed'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.grid_view_rounded),
                  label: Text('Pixel Art'),
                ),
              ],
            ),
            Expanded(child: _screens[_selectedIndex]),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cylium',
          style: TextStyle(fontFamily: 'VT323', fontSize: 48),
        ),
        actions: [
          SizedBox(
            width: 250,
            child: TextField(
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
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
                            child: Text(
                              'Wikipedia',
                              style: TextStyle(fontSize: 32),
                            ),
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
                            child: Text(
                              'Typtest',
                              style: TextStyle(fontSize: 32),
                            ),
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
                ],
              ),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}

class BoekenScreen extends StatelessWidget {
  const BoekenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Boeken',
          style: TextStyle(fontFamily: 'VT323', fontSize: 48),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(3.7),
                          child: Text(
                            'Cylium biedt een groot assortiment boeken en strips aan.',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Image.asset('assets/images/img1.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Image.asset('assets/images/img2.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Image.asset('assets/images/img3.jpg'),
                  ),
                ],
              ),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}

class SpelletjesScreen extends StatelessWidget {
  const SpelletjesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Spelletjes',
          style: TextStyle(fontFamily: 'VT323', fontSize: 48),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(3.7),
                        child: Text(
                          'Cylium biedt een groot assortiment spelletjes aan. Binnenkort beschikbaar!',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}

class SpeelgoedScreen extends StatelessWidget {
  const SpeelgoedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Speelgoed',
          style: TextStyle(fontFamily: 'VT323', fontSize: 48),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(3.7),
                          child: Text(
                            'Cylium biedt een groot assortiment speelgoed aan. Binnenkort beschikbaar!',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Footer(),
        ],
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
      color: Colors.black87,
      child: Center(
        child: Text(
          '© 2020-2025 Anirudh Menon. Alle rechten voorbehouden.',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}

class PixelArtScreen extends StatefulWidget {
  const PixelArtScreen({super.key});

  @override
  PixelArtScreenState createState() => PixelArtScreenState();
}

class PixelArtScreenState extends State<PixelArtScreen> {
  List<List<Color>> pixelGrid = List.generate(
    16,
    (_) => List.generate(16, (_) => Colors.white),
  );

  Color selectedColor = Colors.black;

  void togglePixel(int row, int col) {
    setState(() {
      pixelGrid[row][col] = selectedColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    double pixelSize = 400 / 16;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pixel Art',
          style: TextStyle(fontFamily: 'VT323', fontSize: 48),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(3.7),
                  child: Text(
                    'Op deze website kan u genieten van een pixel art van zeer goede kwaliteit. Geniet ervan!',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
            ),
          ),
          Wrap(
            spacing: 8.0,
            children:
                [
                  Colors.black,
                  Colors.red,
                  Colors.green,
                  Colors.blue,
                  Colors.purple,
                  Colors.grey,
                  Colors.pink,
                  Colors.orange,
                  Colors.white,
                ].map((color) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:
                              selectedColor == color
                                  ? Colors.white
                                  : Colors.black,
                          width: 2.0,
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
          Expanded(
            child: Center(
              child: SizedBox(
                width: 400,
                height: 400,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 16,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0,
                    childAspectRatio: 1,
                  ),
                  itemCount: 16 * 16,
                  itemBuilder: (context, index) {
                    int row = index ~/ 16;
                    int col = index % 16;
                    return GestureDetector(
                      onTap: () => togglePixel(row, col),
                      child: Container(
                        color: pixelGrid[row][col],
                        width: pixelSize,
                        height: pixelSize,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _openlink(String url) {
  final Uri _url = Uri.parse(url);
  launchUrl(_url);
}
