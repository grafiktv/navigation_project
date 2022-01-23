import 'package:flutter/material.dart';

class FirstRoute extends StatefulWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Навигация'),
            actions: <Widget>[
              IconButton(tooltip: 'Tip1',
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const FourRoute()),);
                  }, icon: const Icon(Icons.auto_awesome_motion_sharp)),
              IconButton(onPressed: ()
              {Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ThirdRoute()),
              );},
                  icon: const Icon(Icons.add_shopping_cart)),
              TextButton(onPressed: ()
              {Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SecondRoute()),
              );},
                child: Text('Профиль'),
                style: buttonStyle,)
            ]
        ),
        drawer: Drawer(
          child: ListView(
              padding: EdgeInsets.zero,
              children:[
                DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),

                    child: Container(
                      height: 200,
                      child: const Text('Навигация'),
                    )),
                ListTile(
                  leading: const Icon(Icons.auto_awesome_motion_sharp),
                  title: const Text("Каталог"),
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const FourRoute()),);
                    _messengerKey.currentState!.showSnackBar(
                        const SnackBar(content: Text('Переход в каталог')));

                  },
                ),
                ListTile(
                  leading: const Icon(Icons.add_shopping_cart),
                  title: const Text("Корзина"),
                  onTap: ()
                  {Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ThirdRoute()),
                  );},

                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Профиль"),
                  onTap: ()
                  {Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SecondRoute()),
                  );},
                ),
              ]
          ),
          //body: Center(child: Text('Содержимое экрана')),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Настройки'),
            onPressed: ()
            {Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SecondRoute()),);
            },
          ),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Назад'),
        ),
      ),
    );
  }
}
class ThirdRoute extends StatelessWidget {
  const ThirdRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Назад'),
        ),
      ),
    );
  }
}

class FourRoute extends StatelessWidget {
  const FourRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Каталог'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Назад'),
        ),
      ),
    );
  }
}