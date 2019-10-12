import 'package:flutter/material.dart';

class drawer extends StatelessWidget {
  AssetImage profile = new AssetImage('assets/f1.jpg');

  TextStyle _style = new TextStyle(
      color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return new Drawer(
        elevation: 100,
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                // image: DecorationImage(
                //   image: _image,
                //   fit: BoxFit.fill
                // ),
                color: Colors.teal,
                borderRadius: BorderRadius.circular(3),
              ),
              arrowColor: Colors.redAccent,
              accountName: new Text(
                'Kisaann',
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
              accountEmail: new Text(
                'kisaann123@gmail.com',
                style: TextStyle(fontSize: 15),
              ),
              currentAccountPicture: new CircleAvatar(
                child: Image(
                  image: profile,
                  fit: BoxFit.fill,
                  alignment: Alignment.centerLeft,
                ),
              ),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(
                  child: new Icon(Icons.person_add),
                ),
              ],
            ),
            new FlatButton(
                onPressed: () => print('Your Location'),
                child: new Row(
                  children: <Widget>[
                    new Icon(
                      Icons.location_on,
                      size: 30,
                      color: Colors.grey,
                    ),
                    new Text(
                      '\t\t Location',
                      style: _style,
                    ),
                  ],
                )),
            new FlatButton(
                onPressed: () => print('History'),
                child: new Row(
                  children: <Widget>[
                    new Icon(
                      Icons.history,
                      color: Colors.grey,
                      size: 30,
                    ),
                    new Text(
                      '\t\t History',
                      style: _style,
                    ),
                  ],
                )),
            new FlatButton(
                onPressed: () => print('Help'),
                child: new Row(
                  children: <Widget>[
                    new Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 30,
                    ),
                    new Text(
                      '\t\t Help',
                      style: _style,
                    ),
                  ],
                )),
          ],
        ));
  }
}
