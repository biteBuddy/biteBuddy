// class to store the nutrients value in a food
class Nutrients {
  Nutrients(
      {required this.calories,
      required this.mass_in_g,
      required this.protien,
      required this.carbs,
      required this.fat});
  late double calories, mass_in_g, protien, carbs, fat;

  Nutrients.fromMap(Map map) {
    calories = map['calories'] as double;
    protien = map['protien'] as double;
    carbs = map['carbs'] as double;
    fat = map['fat'] as double;
    mass_in_g = map['mass_in_g'] as double;
  }
  Map toMap() {
    return {
      "calories": calories,
      "protien": protien,
      "carbs": carbs,
      "fat": fat,
      "mass_in_g": mass_in_g,
    };
  }
}

// class to store information about the food
class Food {
  Food(
      {required this.name,
      required this.id,
      required this.desc,
      required this.img,
      required this.price,
      required this.nutrients});
  late String name, img, desc;
  late double price;
  late Nutrients nutrients;
  late String id;

  Food.fromMap(Map map) {
    id = map['id'] as String;
    name = map['name'] as String;
    desc = map['desc'] as String;
    img = map['img'] as String;
    price = map['price'] as double;
    nutrients = Nutrients.fromMap(map['nutrients'].toMap()) as Nutrients;
  }
  Map toMap() {
    return {
      "name": name,
      "id": id,
      "desc": desc,
      "img": img,
      "price": price,
      "nutrients": nutrients.toMap(),
    };
  }
}
