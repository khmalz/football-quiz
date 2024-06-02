class Score {
  String? idUser;
  String? category;
  int? currentLevel;
  Level? level;

  Score({
    this.idUser,
    this.category,
    this.currentLevel,
    this.level,
  });

  Score.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    category = json['category'];
    currentLevel = json['current_level'];
    level = json['level'] != null ? Level.fromJson(json['level']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_user'] = idUser;
    data['category'] = category;
    data['current_level'] = currentLevel;
    if (level != null) {
      data['level'] = level!.toJson();
    }
    return data;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idUser': idUser,
      'category': category,
      'currentLevel': currentLevel,
      'level': level?.toMap(),
    };
  }

  factory Score.fromMap(Map<String, dynamic> map) {
    return Score(
      idUser: map['idUser'] != null ? map['idUser'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      currentLevel:
          map['currentLevel'] != null ? map['currentLevel'] as int : null,
      level: map['level'] != null
          ? Level.fromMap(map['level'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  String toString() {
    return 'Score(idUser: $idUser, category: $category, currentLevel: $currentLevel, level: $level)';
  }
}

class Level {
  Map<String, int>? levels;

  Level({this.levels});

  Level.fromJson(Map<String, dynamic> json) {
    levels = {};
    json.forEach((key, value) {
      levels![key] = value;
    });
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    levels?.forEach((key, value) {
      data[key] = value;
    });
    return data;
  }

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    levels?.forEach((key, value) {
      data[key] = value;
    });
    return data;
  }

  factory Level.fromMap(Map<String, dynamic> map) {
    return Level(
      levels: Map<String, int>.from(map),
    );
  }

  @override
  String toString() {
    return 'Level(levels: $levels)';
  }
}
