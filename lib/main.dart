// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// 主函数 main, runApp() 函数会持有传入的 Widget
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // Widget 的主要工作是实现 build方法
    // build() 方法来描述如何根据其他较低级别的 widgets 来显示自己
    return MaterialApp(
      title: 'Startup Name Generator 1',
      home: RandomWords(),
      // title: 'Welcome to Flutter',
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('Welcome to Flutter'),
      //   ),
      //   body: Center(
      //     // child: Text(wordPair.asPascalCase),
      //     child: RandomWords(),
      //   ),
      // ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  // Widget 是临时对象，用于构造应用当前状态的展示。而 State 对象在调用 build() 之间是持久的，以此来存储信息
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0, color: Colors.red[300]);

  Widget _buildSuggestions() {
    EdgeInsets edgeInsets = EdgeInsets.all(16.0);
    return ListView.builder(
        padding: edgeInsets,
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          print(index);
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); // 额外产生10个word
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return Text(
      pair.asPascalCase,
      style: _biggerFont,
    );
    // return ListTile(
    //   title: Text(
    //     pair.asPascalCase,
    //     style: _biggerFont,
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Startup Name Generator 2',
          style: TextStyle(color: Colors.red),
        ),
        backgroundColor: Colors.green[100],
      ),
      body: _buildSuggestions(),
      backgroundColor: Colors.grey[100],
    );
  }
}
