import 'package:google_fonts/google_fonts.dart';
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
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
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
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xff1a1e2d), Color(0xff8a001c)],
        stops: [0.2, 0.87],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      )),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AgentDetailMenu(uuid: agent.uuid!),
              ));
        },
        child: Card(
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 100,
                child: Image.network(agent.displayIcon!),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    agent.displayName!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(agent.developerName!)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
