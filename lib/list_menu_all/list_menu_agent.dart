import 'package:tugas_akhir/api_source/api_source.dart';
import 'package:tugas_akhir/list_detail_page/list_detail_agent.dart';
import 'package:tugas_akhir/main_page/bottom_bar.dart';
import 'package:tugas_akhir/product_model/product_model.dart';
import 'package:flutter/material.dart';

class AgentMenu extends StatefulWidget {
  const AgentMenu({Key? key}) : super(key: key);

  @override
  State<AgentMenu> createState() => _AgentMenuState();
}

class _AgentMenuState extends State<AgentMenu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Valorant Agent Menu',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Agent List Menu"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Kembali ke Halaman Utama',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomBar(),
                ),
              );
            },
          ),
        ),
        body: _buildListUsersBody(),
      ),
    );
  }

  Widget _buildListUsersBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadUsers(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            // Jika data ada error maka akan ditampilkan hasil error
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            // Jika data ada dan berhasil maka akan ditampilkan hasil datanya
            AgentModel className = AgentModel.fromJson(snapshot.data);
            return _buildSuccessSection(className);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(AgentModel data) {
    return ListView.builder(
      itemCount: data.data!.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemUsers(data.data![index]);
      },
    );
  }

  Widget _buildItemUsers(Data agent) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AgentDetailMenu(uuid: agent.uuid!),
            ));
      },
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 50,
              child: Image.network(agent.displayIcon!),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(agent.displayName!), Text(agent.developerName!)],
            ),
          ],
        ),
      ),
    );
  }
}
