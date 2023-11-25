import 'package:flutter/material.dart';
import 'package:tugas_akhir/functional/currency.dart';
import 'package:tugas_akhir/functional/time.dart';
import 'package:tugas_akhir/list_menu_all/list_menu_agent.dart';
import 'package:tugas_akhir/list_menu_all/list_menu_map.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Valorant Informative"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xff1a1e2d), Color(0xff8a001c)],
              stops: [0.2, 0.87],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  CardMenuAgent(
                    context,
                    'assets/agent.gif',
                    'Agents',
                    'Get an overview of Valorant Agents that player will use in Valorant battlefield.',
                  ),
                  CardMenuMaps(
                    context,
                    'assets/map.gif',
                    'Maps',
                    'Get an overview of Valorant maps that introduce the new player, or even the skilled player, of the Valorant battlefield',
                  ),
                  CardMenuMoney(
                    context,
                    'assets/convert.gif',
                    'Money Exchanger',
                    'Get information about exchange rate of up to 4 famous currency in the world',
                  ),
                  CardMenuTimeConvert(
                    context,
                    'assets/3f8240fa1d16d0de6d4e7510b43b37ba.gif',
                    'Time Exchange',
                    'Get to know your real time based on 4 timezone',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget CardMenuAgent(context, image, title, desc) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AgentMenu(),
            ));
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipPath(
                clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget CardMenuMaps(context, image, title, desc) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MapMenu(),
            ));
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            ClipPath(
              clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                desc,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }

  Widget CardMenuMoney(context, image, title, desc) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MoneyConvert(),
            ));
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipPath(
                clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget CardMenuTimeConvert(context, image, title, desc) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TimeConvert(),
            ));
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipPath(
                clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
