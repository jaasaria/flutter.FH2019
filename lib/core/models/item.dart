import 'category.dart';

enum Emotion { SAD, HAPPY, ANGER, SURPRISE, FEAR }

class Item {
  String name;
  String price;
  List<Category> category;
  Emotion emotion;
  String image;

  Item({this.name, this.price, this.category, this.image, this.emotion});

  Item.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        category = json["category"],
        image = json["image"];

  // Dummy Data
  static List<Item> listServices = [
    //   Chicken
    Item(
        name: "Chicken Adobo",
        category: <Category>[Category.listCategory[3]],
        emotion: Emotion.SAD,
        image: 'assets/images/items/chicken/easy-chicken-adobo.jpg',
        price: '50.00'),
    Item(
        name: "Bacon and Egg Filipino Chicken Adobo",
        category: <Category>[Category.listCategory[3]],
        emotion: Emotion.SAD,
        image:
            'assets/images/items/chicken/Bacon-and-Egg-Chicken-Adobo-Recipe.jpg',
        price: '70.00'),

    // PORK
    Item(
        name: "Pork Adobo",
        category: <Category>[Category.listCategory[4]],
        emotion: Emotion.SAD,
        image: 'assets/images/banner/banner1.jpg',
        price: '50.00'),
    Item(
        name: "Lechon Belly Pork Adobo",
        category: <Category>[Category.listCategory[4]],
        emotion: Emotion.SAD,
        image: 'assets/images/banner/banner1.jpg',
        price: '75.00'),
    Item(
        name: "Liempo Inihaw",
        category: <Category>[Category.listCategory[4]],
        emotion: Emotion.SAD,
        image: 'assets/images/banner/banner1.jpg',
        price: '60.00'),
    Item(
        name:
            "Grilled Pork Belly with Garlic Fried Rice and Fried Egg – Liempo Sinangag Itlog",
        category: <Category>[Category.listCategory[4]],
        emotion: Emotion.SAD,
        image: 'assets/images/banner/banner1.jpg',
        price: '80.00'),

    // Seafoods
    Item(
        name:
            "Fried Daing na Bangus with Garlic Fried Rice, Fried Egg, and Pickled Papaya (Daing Silog)",
        category: <Category>[Category.listCategory[2]],
        emotion: Emotion.SAD,
        image: 'assets/images/banner/banner1.jpg',
        price: '80.00'),
    Item(
        name: "Danggit Silog",
        category: <Category>[Category.listCategory[2]],
        emotion: Emotion.SAD,
        image: 'assets/images/banner/banner1.jpg',
        price: '60.00'),

    // Beef
    Item(
        name: "Bistek Silog",
        category: <Category>[Category.listCategory[5]],
        emotion: Emotion.SAD,
        image: 'assets/images/banner/banner1.jpg',
        price: '65.00'),
    Item(
        name: "Corned Beef Silog",
        category: <Category>[Category.listCategory[5]],
        emotion: Emotion.SAD,
        image: 'assets/images/banner/banner1.jpg',
        price: '60.00'),
    Item(
        name: "Beef Kaldereta sa Gata with Peanut Butter",
        category: <Category>[Category.listCategory[5]],
        emotion: Emotion.SAD,
        image: 'assets/images/banner/banner1.jpg',
        price: '60.00'),

    // Vegetables
    Item(
        name: "Ampalaya con Carne",
        category: <Category>[Category.listCategory[1]],
        emotion: Emotion.SAD,
        image: 'assets/images/banner/banner1.jpg',
        price: '50.00'),
    Item(
        name: "Ginataang Gulay with Pork and Shrimp",
        category: <Category>[
          Category.listCategory[1],
          Category.listCategory[4]
        ],
        emotion: Emotion.SAD,
        image: 'assets/images/banner/banner1.jpg',
        price: '65.00'),
    Item(
        name: "Ginisang Gulay",
        category: <Category>[Category.listCategory[1]],
        emotion: Emotion.SAD,
        image: 'assets/images/banner/banner1.jpg',
        price: '50.00'),
    Item(
        name: "Pinakbet with Squid in Coconut Milk (Pinakbet sa Gata)",
        category: <Category>[Category.listCategory[1]],
        emotion: Emotion.SAD,
        image: 'assets/images/banner/banner1.jpg',
        price: '50.00'),
  ];
}
