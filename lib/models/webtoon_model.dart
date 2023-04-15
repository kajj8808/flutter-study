class WebtoonModel {
  final String title, thumb, id;

  // named constructor 라고 하고 이름이 있는 클래스 생성자 밑에는 편하게 초기화를 위한 문법.
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
