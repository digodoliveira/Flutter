class User {
  int id;
  String name;
  DateTime birthdate;
  String genre;
  num height;
  num weight;
  num goal;

  User({
    this.id,
    this.name,
    this.birthdate,
    this.genre,
    this.height,
    this.weight,
    this.goal,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'birthdate': birthdate,
      'genre': genre,
      'height': height,
      'weight': weight,
      'goal': goal
    };
  }

  User.fromMap(Map map) {
    id = map['id'];
    name = map['name'];
    birthdate = map['birthdate'];
    genre = map['genre'];
    height = map['height'];
    weight = map['weight'];
    id = map['id'];
    goal = map['goal'];
  }
}
