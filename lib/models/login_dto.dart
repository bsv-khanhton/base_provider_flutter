class LoginDTO{
  int userId;
  int id;
  String title;
  String body;

  LoginDTO({this.userId,this.id,this.title,this.body});

  static LoginDTO fromJson(Map<String,dynamic> json){
    return LoginDTO(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body']
    );
  }

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'id': id,
    'title': title,
    'body': body
  };
}