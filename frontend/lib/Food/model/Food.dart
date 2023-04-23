// class to store the nutrients value in a food
class Nutrients {
  Nutrients(
      {required this.calories,
      required this.mass_in_g,
      required this.protien,
      required this.carbs,
      required this.fat});
  double calories, mass_in_g, protien, carbs, fat;
}

// class to store information about the food
class Food {
  Food(
      {required this.name,
      required this.desc,
      required this.img,
      required this.price,
      required this.nutrients});
  String name, img, desc;
  double price;
  Nutrients nutrients;
}
