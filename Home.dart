import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class HomeAgent {
  String name;
  String imageUrl;
  List<String> languages;
  String nationality;
  String prix;

  HomeAgent({
    required this.name,
    required this.imageUrl,
    required this.languages,
    required this.nationality,
    required this.prix,
  });
}

class _HomeState extends State<Home> {
  late String _selectedLanguage;
  int _selectedIndex = 0;
  final List<HomeAgent> favorites = [];

  final List<HomeAgent> agents = [
    HomeAgent(
        name: 'ag0',
        imageUrl:
            'https://www.advancia-teleservices.com/wp-content/uploads/2023/10/agent-centre-appel.jpg',
        languages: ['English (Fluent)', 'Spanish (Intermediate)'],
        nationality: 'Nationality: USA',
        prix: "50£/h"),
    HomeAgent(
        name: 'ag1',
        imageUrl:
            'https://www.shutterstock.com/image-photo/real-estate-agent-ready-sell-260nw-171921824.jpg',
        languages: ['French (Fluent)', 'German (Intermediate)'],
        nationality: 'Nationality: Canada',
        prix: "29£/h"),
    HomeAgent(
        name: 'ag2',
        imageUrl:
            'https://www.lesclesdelabanque.com/uploads/2021/10/agent-commercial-_BD.jpg',
        languages: ['English (Fluent)', 'Spanish (Intermediate)'],
        nationality: 'Nationality: USA',
        prix: "72£/h"),
    HomeAgent(
        name: 'ag3',
        imageUrl:
            'https://www.kofc.org/assets/images/multimedia-story/our-careers/insurance-financial-agent@2x.jpg',
        languages: ['Chinese (Fluent)', 'Italian (Intermediate)'],
        nationality: 'Nationality: USA',
        prix: "90£/h"),
    HomeAgent(
        name: 'AG4',
        imageUrl:
            'https://www.gettguard.com/wp-content/uploads/2019/10/imgwomanv2-694x1024.png',
        languages: [
          'Arabic (Fluent)',
        ],
        nationality: 'Nationality: North Africa',
        prix: "54£/h"),
    HomeAgent(
        name: 'AG5',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlWD6ijnvgUPqeEHp6hU73QXs-R42qd9SQAA&usqp=CAU',
        languages: [
          'Russian',
        ],
        nationality: 'Nationality: Russia',
        prix: "60£/h"),
  ];

  List<String> getAvailableLanguages() {
    Set<String> allLanguages = Set();
    for (var agent in agents) {
      allLanguages.addAll(agent.languages);
    }
    return allLanguages.toList();
  }

  @override
  void initState() {
    super.initState();
    _selectedLanguage = getAvailableLanguages().first;
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ChatScreen(),
        ),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _toggleFavorite(HomeAgent agent) {
    setState(() {
      if (favorites.contains(agent)) {
        favorites.remove(agent);
      } else {
        favorites.add(agent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset("images/a1Dark.png"),
          actions: [
            DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: (newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                });
              },
              items: getAvailableLanguages()
                  .map<DropdownMenuItem<String>>((language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(language),
                );
              }).toList(),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(203, 255, 151, 255),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text('Mega Tel User'),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.lock_person_outlined),
                title: Text('Compte'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.vertical_shades_closed),
                title: Text('About'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.lock_rounded),
                title: Text('Confidentialité'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.logout_rounded),
                title: Text('Log Out'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: _selectedIndex == 0
            ? ListView.builder(
                itemCount: agents.length,
                itemBuilder: (context, index) {
                  if (agents[index].languages.contains(_selectedLanguage)) {
                    return AgentCard(
                      agent: agents[index],
                      isFavorite: favorites.contains(agents[index]),
                      onFavoriteToggle: () => _toggleFavorite(agents[index]),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              )
            : ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return AgentCard(
                    agent: favorites[index],
                    isFavorite: true,
                    onFavoriteToggle: () => _toggleFavorite(favorites[index]),
                  );
                },
              ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(255, 87, 129, 156),
              icon: Icon(Icons.home_max_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              label: 'Cart',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class AgentCard extends StatelessWidget {
  final HomeAgent agent;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  AgentCard({
    required this.agent,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.network(agent.imageUrl),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                  onPressed: onFavoriteToggle,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Name: ${agent.name}'),
            SizedBox(height: 10),
            Text('Languages:'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  agent.languages.map((language) => Text(language)).toList(),
            ),
            SizedBox(height: 10),
            Text(agent.nationality),
            SizedBox(height: 10),
            Text(agent.prix),
          ],
        ),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MegaTel Chat'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Tapper Un Message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
