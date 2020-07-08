import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to FreeCap",
      theme: new ThemeData(
        primaryColor: Colors.amber,
      ),
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {

  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
       appBar: new AppBar(
          title: const Text('FreeCao APP'),
         actions: <Widget>[
           new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved)
         ],
       ),
      bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem (
                icon: const Icon(Icons.add),
              title: new Text('추가'),
            ),
            new BottomNavigationBarItem (
                icon: const Icon(Icons.favorite),
                title: new Text('목록'),
            ),
            new BottomNavigationBarItem(
                icon: const Icon(Icons.ac_unit),
                title: new Text('좋아요'),
            ),
          ]
      ),
      body: _buildSuggestions(),
     );
  }

  void _pushSaved() {
    Navigator.of(context).push(
        new MaterialPageRoute<void> (
           builder: (BuildContext context) {
              final Iterable<ListTile> tiles = _saved.map(
                  (WordPair pair) {
                  return new ListTile(
                        title: new Text(
                          pair.asPascalCase,
                          style: _biggerFont,
                        ),
                      );
                  },
              );
              final List<Widget> divided = ListTile
                .divideTiles(
                context: context,
                tiles: tiles,
              ).toList();

              return new Scaffold(
                appBar: new AppBar(
                  title:const Text('Saves Suggestions'),
                ),
                body: new ListView(children: divided),
              );
            },
       ),
    );
  }

  Widget _buildSuggestions() {
//     final WordPair wordPair = new WordPair.random();
//     return new Text(wordPair.asPascalCase);
  return new  DataTable(
    columns: const <DataColumn>[
      DataColumn(
        label: Text(
          '종목',
          style: TextStyle(fontStyle: FontStyle.normal),
        ),
      ),
      DataColumn(
        label: Text(
          '현재가',
          style: TextStyle(fontStyle: FontStyle.normal),
        ),
      ),
      DataColumn(
        label: Text(
          '등락률',
          style: TextStyle(fontStyle: FontStyle.normal),
        ),
      ),
      DataColumn(
        label: Text(
          '거래량',
          style: TextStyle(fontStyle: FontStyle.normal),
        ),
      ),
    ],
    rows: const <DataRow>[
      DataRow(
        cells: <DataCell>[
          DataCell(Text('6AU20')),
          DataCell(Text('0.6888')),
          DataCell(Text('+0.20%')),
          DataCell(Text('+0.20%')),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text('6AU20')),
          DataCell(Text('0.6888')),
          DataCell(Text('+0.20%')),
          DataCell(Text('+0.20%')),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text('6AU20')),
          DataCell(Text('0.6888')),
          DataCell(Text('+0.20%')),
          DataCell(Text('+0.20%')),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text('6AU20')),
          DataCell(Text('0.6888')),
          DataCell(Text('+0.20%')),
          DataCell(Text('+0.20%')),
        ],
      ),
    ],
  );
  }

//  Widget _buildRow(WordPair pair) {
//    final bool alreadySaved = _saved.contains(pair);
//    return new ListTile(
//      title: new Text(
//        pair.asPascalCase,
//        style: _biggerFont,
//      ),
//      trailing: new Icon(
//          alreadySaved ? Icons.favorite : Icons.favorite_border,
//        color: alreadySaved ? Colors.red : null
//      ),
//      onTap: () {
//        setState(() {
//          if(alreadySaved) {
//            _saved.remove(pair);
//          } else {
//            _saved.add(pair);
//          }
//        });
//      },
//    );
//  }
}
