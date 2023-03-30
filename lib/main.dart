import 'package:flutter/material.dart';

class Player {
  String name;
  Player({required this.name});
}

void main() {
  var anon = Player(name: "Anon");
  runApp(App());
}

class App extends StatelessWidget {
  // @ 이 annotation(어노테이션) 은 flutter 에 관한건 아니고 dart의 것임
  // 부모 class 에 이미 있는 메소드를 override 한다는것
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello flutter"),
          centerTitle: true, // 중앙정렬
          elevation: 10, // 밑의 그림자 0 하면 그림자가 사라짐!
        ), // 여기 들어가는 Text 도 다 widget
        body: Center(child: Text("Hello world!")), // 여기도 widget 모든것이 widget!
        // 여기서 Center 은 child 이 중앙으로 오게 해주는 역활을함.
      ),
    );
  }
}
