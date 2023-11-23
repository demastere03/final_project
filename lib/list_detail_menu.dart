import 'package:flutter/material.dart';
import 'package:tugas_akhir/api_source/api_source.dart';
import 'package:tugas_akhir/product_model/product_model.dart';

class AgentDetailMenu extends StatelessWidget {
  final String uuid;
  const AgentDetailMenu({super.key, required this.uuid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agent Detail"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiDataSource.instance.getAgentDetail(uuid),
        builder: (BuildContext context,AsyncSnapshot<dynamic> snapshot) {
          Data news = Data.fromJson(snapshot.data);
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  Image.network(
                    news.fullPortrait!,
                    fit: BoxFit.fill,
                    height: MediaQuery.sizeOf(context).height/2.5,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    news.displayName!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(news.description!),
                  const SizedBox(height: 20),

                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
