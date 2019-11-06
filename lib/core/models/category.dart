class Category {
  String name;
  String image;

  Category({this.name, this.image});

  Category.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        image = json["image"];

// Dummy Data
  static List<Category> listCategory = [
    Category(name: "All", image: ''), //0
    Category(name: "Vegetables", image: ''), //1
    Category(name: "Seafoods", image: ''), //2
    Category(name: "Chicken", image: ''), //3
    Category(name: "Pork", image: ''), //4
    Category(name: "Beef", image: ''), //5
    Category(name: "Desserts", image: ''), //6
    Category(name: "Best Seller", image: ''), //7
    Category(name: "Appetizer", image: ''), //8
  ];
}
