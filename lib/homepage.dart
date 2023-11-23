import 'package:flutter/material.dart';
import 'package:tugas_akhir/list_menu_all/list_menu.dart';
import 'package:tugas_akhir/list_menu_all/list_menu_map.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Valorant Informative"),
          centerTitle: true,
        ),
        body: Padding(
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
                'Get information about exchange rate of up to 4 currency (IDR,USD,GBP,JPY)',
              ),
            ],
          ),
        ),
      );
  }
  Widget CardMenuAgent(context, image, title, desc) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(
          builder: (context) => AgentMenu(),
          )
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                image,
                height: MediaQuery.sizeOf(context).height/4,
                width: MediaQuery.sizeOf(context).width/4,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                desc,
                style: const TextStyle(
                  fontSize: 18,
                ),
              )
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
              context, MaterialPageRoute(
            builder: (context) => MapMenu(),
          )
          );
        },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                image,
                height: MediaQuery.sizeOf(context).height/4,
                width: MediaQuery.sizeOf(context).width/4,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                desc,
                style: const TextStyle(
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget CardMenuMoney(context, image, title, desc) {
    return InkWell(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                image,
                height: MediaQuery.sizeOf(context).height/4,
                width: MediaQuery.sizeOf(context).width/4,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                desc,
                style: const TextStyle(
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



