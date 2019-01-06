import 'package:flutter/material.dart';

void main() => runApp(new BasicLayout());

class BasicLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: new Text(
                    'Programming tutorials Channel',
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ),
                new Text(
                  "This channel contains tutorial videos in Flutter, "
                      "React Native, React, Angular",
                  style: new TextStyle(color: Colors.grey[600], fontSize: 18.0),
                )
              ],
            ),
          ),
          new Icon(Icons.favorite, color: Colors.red),
          new Text(
            ' 100',
            style: new TextStyle(fontSize: 25.0),
          ),
        ],
      ),
    );
    Widget buildButton(IconData icon, String textButton) {
      final Color buttonColor = Colors.blue;
      return new Column(
        children: <Widget>[
          new Icon(icon, color: buttonColor),
          new Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: new Text(textButton,
                style: new TextStyle(
                    fontWeight: FontWeight.w600, color: buttonColor)),
          )
        ],
      );
    }

    Widget fourButtonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          buildButton(Icons.home, 'Home'),
          buildButton(Icons.arrow_back, 'Back'),
          buildButton(Icons.arrow_forward, 'Next'),
          buildButton(Icons.share, 'Share'),
        ],
      ),
    );
    final textLongSection = new Container(
      padding: const EdgeInsets.all(10.0),
      child: new Text(
        '''Thức trắng đêm nay có lẽ do anh đang say 
Biết nói cho ai nghe đây bởi vì không còn được bên em mỗi ngày 
Mình từng hứa sẽ vượt qua 
Vậy mà kết thúc rời xa 
Cớ sao anh cứ mong chờ vì anh đã yêu dại khờ 
Từng cùng nhau đi qua giông bão nhưng ko còn thấy nhau khi mưa tan
Tại vì sao tình yêu luôn khiến cho mình mãi tin vào một giấc mơ
Ngày em quay lưng bước đi mưa rơi ướt nhòe lên trên khóe mi 
Vì khi yêu chẳng cần lý trí mặc kệ con tim làm điều vô lí. ''',
      ),
    );
    // TODO: implement build
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Basic Layout'),
        ),
        body: new ListView(
          children: <Widget>[
            new Image.asset('images/tutorialChannel.png', fit: BoxFit.cover),
            titleSection,
            fourButtonSection,
            textLongSection
          ],
        ),
      ),
    );
  }
}
