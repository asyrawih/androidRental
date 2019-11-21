import 'package:apprental/screens/components/CardMenu.dart';
import 'package:apprental/screens/services/ApiServices.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final contentStyle = (BuildContext context) => ParentStyle()
    // ..overflow.scrollable()
    ..padding(vertical: 30, horizontal: 20)
    ..minHeight(MediaQuery.of(context).size.height - (2 * 20))
    ..minWidth(MediaQuery.of(context).size.width - (2 * 20));

  final titleStyle = TxtStyle()
    ..bold()
    ..margin(bottom: 20)
    ..alignment.centerLeft()
    ..fontSize(32);

  @override
  void initState() {
    super.initState();
    ApiServices().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Parent(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Txt(
                'Home',
                style: titleStyle,
              ),
              CardMenu(),
              SizedBox(
                height: 20,
              ),
              Txt(
                'Parawisata',
                style: titleStyle
                  ..clone()
                  ..fontSize(20),
              ),
              _BuildParawisata(),
              SizedBox(
                height: 20,
              ),
              Txt(
                "Cars",
                style: titleStyle,
              ),
              _Buildmobil(),
            ],
          ),
          style: contentStyle(context),
        ),
      ),
    );
  }
}

//Widget Mobil
class _Buildmobil extends StatelessWidget {
  const _Buildmobil({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: FutureBuilder(
          future: ApiServices().getData(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.hasData) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: snap.data.length,
                itemBuilder: (context, int index) {
                  return InkWell(
                    child: Container(
                      margin: EdgeInsets.only(left: 20.0),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: new NetworkImage(
                                  "https://irent.id/uploads/thumb/cars/" +
                                      snap.data[index]["gambar"]),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            snap.data[index]["jenis"].toString(),
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            snap.data[index]["plat_polisi"].toString(),
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    onTap: (){
                      print(snap.data[index]["car_id"]);
                    },
                  );
                },
              );

              /// Cek Jika Data Masi Di load
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

///Widget Build Parawisiata
class _BuildParawisata extends StatelessWidget {
  const _BuildParawisata({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Daihatsu",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            width: 200,
            height: 300,
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.amber,
              image: DecorationImage(
                  image: new NetworkImage(
                      "https://awsimages.detik.net.id/visual/2019/06/12/afaef7fb-f880-4458-a617-d4c49f060830_169.jpeg?w=650"),
                  fit: BoxFit.fill),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Raja Ampat",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            width: 200,
            height: 300,
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.amber,
              image: DecorationImage(
                  image: new NetworkImage(
                      "https://cdn.sindonews.net/dyn/620/content/2019/02/02/34/1375652/dukung-pariwisata-kemenpar-inisiasi-asuransi-jagawisata-SYl.jpg"),
                  fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    );
  }
}
