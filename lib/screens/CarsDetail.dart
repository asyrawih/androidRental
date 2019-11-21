import 'package:flutter/material.dart';

class DetailCars extends StatelessWidget {
  final data;

  DetailCars({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data["jenis"],
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottomOpacity: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width - (1 * 1),
            height: MediaQuery.of(context).size.height - (2 * 250),
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.white, blurRadius: 20)],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                image: DecorationImage(
                    image: new NetworkImage(
                      "https://irent.id/uploads/normal/cars/" + data["gambar"],
                    ),
                    fit: BoxFit.fill)),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
              child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Card(
                child: ListTile(
                  title: Text(data["plat_polisi"]),
                  leading: Icon(Icons.poll),
                  subtitle: Text("Plat Polisi"),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(data["kapasitas"].toString()),
                  leading: Icon(Icons.person_pin),
                  subtitle: Text("Kapasitas Mobil"),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(data["warna"]),
                  leading: Icon(Icons.color_lens),
                  subtitle: Text("Warna Mobil"),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(data["model_tahun"]),
                  leading: Icon(Icons.calendar_today),
                  subtitle: Text("Model Tahun"),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(data["owner"]["nama_depan"]),
                  leading: Icon(Icons.person_outline),
                  subtitle: Text("Pemilik Mobil"),
                ),
              )
            ],
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        splashColor: Colors.white,
        child: Icon(Icons.shopping_cart),
        onPressed: () {},
      ),
    );
  }
}
