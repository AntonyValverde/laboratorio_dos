import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sismos',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 255, 255, 255),
        useMaterial3: true,
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontWeight: FontWeight.bold, // Para hacer la letra más gruesa
                fontSize: 24, // Tamaño de la fuente
                // Puedes ajustar más propiedades según tu preferencia
              ),
            ),
      ),
      home: const MyHomePage(
        title: 'Sismos',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sismos",
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry>[
                const PopupMenuItem(
                  value: 1,
                  child: Text('Ayuda'),
                ),
              ];
            },
            icon: const Icon(
              Icons.help_outline,
              color: Colors.orange,
            ),
            onSelected: (value) {
              switch (value) {
                case 1:
                  break;
              }
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              child: Text(
                "MAPA",
                style: TextStyle(fontSize: 20, color: Colors.orange),
              ),
            ),
            Tab(
              child: Text(
                "LISTA",
                style: TextStyle(fontSize: 20, color: Colors.orange),
              ),
            ),
          ],
          indicatorColor:
              Colors.orange, // Cambia el color de la línea a naranja
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildMapSection(),
          _buildCommentsSection(),
        ],
      ),
      bottomNavigationBar: _buildNavigatorButton(),
    );
  }

  Widget _buildMapSection() {
    return Stack(
      children: [
        Image.asset(
          'assets/images/mapa.jpeg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 128, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '24 horas',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                // Espacio entre los botones
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 0, 71),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '15 días',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCommentsSection() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Lugar $index'),
          subtitle: const Text('Comentario'),
        );
      },
    );
  }

  Widget _buildNavigatorButton() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.circle),
          label: 'Sismos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '¿Lo sentiste?',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          label: 'Más',
        ),
      ],
      onTap: (index) {},
    );
  }
}
