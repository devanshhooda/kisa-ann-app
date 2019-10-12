import 'package:flutter/material.dart';
import 'drawer.dart';

class KisaannApp extends StatefulWidget {
  @override
  _KisaannAppState createState() => _KisaannAppState();
}

AssetImage showImage = new AssetImage('assets/farmer.jpg');
AssetImage iconImage = new AssetImage('assets/f2.png');
int selectedIndex = 0;
List<String> _options = ['Crops', 'Timber/Wood', 'Fibre', 'Animal Product'];
TextStyle popupStyle = new TextStyle(
    fontSize: 20, color: Colors.teal, fontWeight: FontWeight.w400);

TextEditingController typeController = new TextEditingController();
final TextEditingController quantityController = new TextEditingController();

class _KisaannAppState extends State<KisaannApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      title: 'Kisaann App',
      home: new Scaffold(
        backgroundColor: Colors.white,
        endDrawer: drawer(),
        // appBar: new AppBar(),
        body: crops(),
        floatingActionButton: new Container(
          // padding: EdgeInsets.only(bottom: 10, left: 10),
          padding: EdgeInsets.only(bottom: 45, right: 15),
          child: FloatingActionButton(
            backgroundColor: Colors.deepOrangeAccent,
            child: Icon(Icons.cached),
            onPressed: () => reset(),
          ),
        ),
      ),
    );
  }

  void reset() {
    setState(() {
      typeController.clear();
      quantityController.clear();
    });
  }

  Widget crops() {
    return new CustomScrollView(
      slivers: <Widget>[
        new SliverAppBar(
            backgroundColor: Colors.teal,
            centerTitle: true,
            title: new Text(
              'K I S A - A N N',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            leading: new Container(
              padding: EdgeInsets.all(5),
              child: Image(
                image: iconImage,
              ),
            )),
        new SliverFillRemaining(
          child: new Container(
              child: new ListView(
            children: <Widget>[
              new Container(
                // padding: EdgeInsets.only(bottom: 10),
                height: 300,
                width: 300,
                child: Image(
                  image: showImage,
                ),
              ),
              new Container(
                padding: EdgeInsets.only(
                  left: 40,
                  top: 10,
                ),
                child: new Text(
                  'Enter the Details :',
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
              ),
              new Container(
                height: 320,
                width: 500,
                padding: EdgeInsets.all(10),
                child: new Card(
                  elevation: 15,
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  // margin: EdgeInsets.all(10),
                  child: ListView(
                    children: <Widget>[
                      options(),
                      new Container(
                          padding:
                              EdgeInsets.only(left: 10, top: 30, right: 10),
                          child: new Card(
                            elevation: 5,
                            child: new TextField(
                              controller: typeController,
                              decoration: InputDecoration(
                                  labelText:
                                      'Name of ${_options[selectedIndex]}',
                                  hintText:
                                      '(e.g.- Wheat/Cotton/Sugarcane/Maze/Timber/Honey etc.)',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          )),
                      new Container(
                        padding: EdgeInsets.only(left: 10, top: 20, right: 10),
                        child: new Card(
                          elevation: 5,
                          child: new TextField(
                            controller: quantityController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText:
                                    'Quantity of ${_options[selectedIndex]}',
                                hintText: '(e.g- Kilogram/Numbers/Litres/...)',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              new Container(
                  height: 90,
                  padding:
                      EdgeInsets.only(top: 10, left: 90, right: 110, bottom: 7),
                  child: new Card(
                    elevation: 10,
                    color: Colors.green,
                    child: FlatButton(
                      onPressed: () => print('Presssed Done'),
                      child: new Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ))
            ],
          )),
        )
      ],
    );
  }

  Widget options() {
    return new Container(
      padding: EdgeInsets.only(
        left: 20,
        top: 30,
      ),
      child: PopupMenuButton(
          // color: Colors.blue,

          onSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          child: new Row(
            children: <Widget>[
              Text(
                _options[selectedIndex],
                style: new TextStyle(
                    fontSize: 30,
                    color: Colors.teal,
                    fontWeight: FontWeight.w600),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.teal,
              ),
            ],
          ),
          itemBuilder: (context) => <PopupMenuItem<int>>[
                PopupMenuItem(
                  child: new Text(
                    _options[0],
                    style: popupStyle,
                  ),
                  value: 0,
                ),
                PopupMenuItem(
                  child: new Text(
                    _options[1],
                    style: popupStyle,
                  ),
                  value: 1,
                ),
                PopupMenuItem(
                  child: new Text(
                    _options[2],
                    style: popupStyle,
                  ),
                  value: 2,
                ),
                PopupMenuItem(
                  child: new Text(
                    _options[3],
                    style: popupStyle,
                  ),
                  value: 3,
                ),
              ]),
    );
  }
}
