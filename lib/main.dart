import 'dart:io';

import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';

//https://gist.github.com/preinpost/941efd33dff90d9f8c7a208da40c18a9
// 방법 2. (global override)
// [main.dart]
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..userAgent =
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36';
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key}); // 요 친구(widget)가 하는일은
  // key 를 stateless widget 이란느 슈퍼 클래스에 보낸것
  // 이 위젯은 id 같은 식별자 역활을 하는 key 가 있음.! 플러터가 찾기쉽도록!
  // 여기서 알아야 할것은 위젯은 key라는 걸 가지고 있고 id처럼 쓰인다는것!.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
