import 'package:flutter/material.dart';
import 'package:tugas_akhir/api_source/api_source_2.dart';
import 'package:tugas_akhir/product_model/map_model.dart';

class MapDetailMenu extends StatelessWidget {
  final String uuid;
  const MapDetailMenu({super.key, required this.uuid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Maps Detail"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: FutureBuilder(
              future: ApiDataSource2.instance.loadUsers(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasError) {
                  // Jika data ada error maka akan ditampilkan hasil error
                  return _buildErrorSection();
                }
                if (snapshot.hasData) {
                  // Jika data ada dan berhasil maka akan ditampilkan hasil datanya
                  MapValo className = MapValo.fromJson(snapshot.data);
                  return _buildSuccessSection(className);
                }
                return _buildLoadingSection();
              },
            ),
          ),
        ));
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(MapValo data) {
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
      child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                data.displayName!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Image.network(
                data.splash!,
                width: 200,
                height: 200,
              ),
              SizedBox(height: 10),
              Text('Map Description',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 5),
              Text(
                data.narrativeDescription!,
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 5),
              Text('Map Coordinates',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 5),
              Text(
                data.coordinates!,
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 5),
              Text('Map Spike Sites',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 5),
              Text(
                data.tacticalDescription!,
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 5),
              Text('Map Overview',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              Image.network(
                data.displayIcon!,
                width: 300,
                height: 300,
              ),
              Text("* Yellow area indicates Spike Site where T-teams have to plant in order to complete objective",
                  style: TextStyle(fontSize: 10),
                  textAlign: TextAlign.center,
              ),
              Text("* Gray area indicates the battle area of that map",
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
              ),
            ],
          )

      ),
    );
  }
}