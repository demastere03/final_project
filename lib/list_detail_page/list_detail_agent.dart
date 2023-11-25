import 'package:flutter/material.dart';
import 'package:tugas_akhir/api_source/api_source.dart';
import 'package:tugas_akhir/list_menu_all/list_menu_agent.dart';
import 'package:tugas_akhir/product_model/product_model.dart';

class AgentDetailMenu extends StatelessWidget {
  final String uuid;
  const AgentDetailMenu({super.key, required this.uuid});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agent Detail Page',
        home: Scaffold(
            appBar: AppBar(
              title: Text("Agent Detail"),
              centerTitle: true,
              leading:
              IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Halaman Kesan dan Pesan',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => AgentMenu(),
                  ),
                  );
                },
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
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
              ),
            ),
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
      shrinkWrap: true,
      itemCount: data.data!.length,
      itemBuilder: (BuildContext context, int index) {
        if (data.data![index].uuid == uuid) {
          return _buildItemUsers(data.data![index]);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildItemUsers(Data data) {
    return Container(
      padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.displayName!,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Image.network(
                      data.fullPortrait!,
                      width: 200,
                      height: 200,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Agent Description',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      data.description!,
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Agent Role',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      data.role!.displayName!,
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 5),
                    Text('Role Description',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      data.role!.description!,
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}