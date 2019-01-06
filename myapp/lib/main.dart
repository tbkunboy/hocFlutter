import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class RandomEnglistWord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomEnglistWordState();
  }
}

class RandomEnglistWordState extends State<RandomEnglistWord> {
  final _wordPair = <WordPair>[];
    final _checkedWord = new Set<WordPair>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('List View'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushToWordSaveScreen)
        ],
      ),
      body: new ListView.builder(itemBuilder: (context, index) {
        if (index >= _wordPair.length) {
          _wordPair.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_wordPair[index], index);
      }),
    );
  }
  _pushToWordSaveScreen(){
    // print('asdadasdasdsada');
    final pageRoute = new MaterialPageRoute(builder: (context){
      final listTiles = _checkedWord.map((wordPair){
        return new ListTile(
          title: new Text(wordPair.asUpperCase, style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))
        );
      });
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Checked Words'),
        ),
        body: new ListView(children: listTiles.toList()),
      );
    });
    Navigator.of(context).push(pageRoute);
  }
  Widget _buildRow(WordPair wordPair int index) {
  final color = index % 2 == 0 ? Colors.red : Colors.green;
  final isChecked = _checkedWord.contains(wordPair);
  return new ListTile(
    leading: new Icon(isChecked ? Icons.check_box : Icons.check_box_outline_blank, color: color,),
    title: new Text(
      wordPair.asUpperCase,
      style: new TextStyle(fontSize: 18.0, color: color),
    ),
    onTap: (){
      setState(() {
              if(isChecked){
                _checkedWord.remove(wordPair);
              }else{
                _checkedWord.add(wordPair);
              }
            });
    },
  );
}
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(title: 'Test', home: new RandomEnglistWord());
  }
}

// void main() {
//   runApp(new FriendlyChat());
// }

// class FriendlyChat extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: "FriendlyChat",
//       home: new ChatScreen(),
//     );
//   }
// }

// class ChatScreen extends StatefulWidget {
//   @override
//   State createState() => new ChatScreenState();
// }

// class ChatScreenState extends State<ChatScreen> {
//   @override
//   void _handleSubmitted(String text) {
//     _textController.clear();
//   }

//   final TextEditingController _textController = new TextEditingController();
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(title: new Text("FriendlyChat")),
//       body: _buildTextComposer(),
//     );
//   }

//   Widget _buildTextComposer() {
//     return new IconTheme(
//         data: new IconThemeData(color: Theme.of(context).accentColor),
//         child: new Container(
//           margin: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: new Row(
//             children: <Widget>[
//               new Flexible(
//                 child: new TextField(
//                   controller: _textController,
//                   onSubmitted: _handleSubmitted,
//                   decoration:
//                       new InputDecoration.collapsed(hintText: 'Send a message'),
//                 ),
//               ),
//               new Container(
//                 margin: new EdgeInsets.symmetric(horizontal: 4.0),
//                 child: new IconButton(
//                   icon: new Icon(Icons.send),
//                   onPressed: () => _handleSubmitted(_textController.text),
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
// }
