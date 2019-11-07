import 'category.dart';

enum Emotion { SAD, HAPPY, ANGER, SURPRISE, FEAR }

class Item {
  String name;
  String price;
  List<Category> category;
  Emotion emotion;
  String image;
  bool addCart;
  double orderQty;

  Item(
      {this.name,
      this.price,
      this.category,
      this.image,
      this.emotion,
      this.addCart,
      this.orderQty});

  Item.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        category = json["category"],
        image = json["image"];

  // Dummy Data
  static List<Item> listServices = [
    Item(
        name: "Chicken Adobo",
        category: <Category>[
          Category.listCategory[3],
          Category.listCategory[7]
        ],
        emotion: Emotion.SAD,
        image: 'assets/images/items/chicken/easy_chicken_adobo.jpg',
        price: '50.00',
        addCart: true,
        orderQty: 1),
    Item(
        name: "Bacon and Egg Filipino Chicken Adobo",
        category: <Category>[Category.listCategory[3]],
        emotion: Emotion.SAD,
        image:
            'assets/images/items/chicken/bacon_and_egg_chicken_adobo_recipe.jpg',
        price: '70.00',
        addCart: false,
        orderQty: 1),

    // PORK
    Item(
        name: "Pork Adobo",
        category: <Category>[
          Category.listCategory[4],
          Category.listCategory[7]
        ],
        emotion: Emotion.SAD,
        image: 'assets/images/items/pork/pork_adobo.jpg',
        price: '50.00',
        addCart: false,
        orderQty: 1),
    Item(
        name: "Lechon Belly Pork Adobo",
        category: <Category>[Category.listCategory[4]],
        emotion: Emotion.SAD,
        image: 'assets/images/items/pork/Lechon_Belly_Pork_Adobo_Recipe.jpg',
        price: '75.00',
        addCart: false,
        orderQty: 1),
    Item(
        name: "Liempo Inihaw",
        category: <Category>[
          Category.listCategory[4],
          Category.listCategory[7]
        ],
        emotion: Emotion.SAD,
        image: 'assets/images/items/pork/Easy_Liempo_Inihaw.jpg',
        price: '60.00',
        addCart: false,
        orderQty: 1),
    Item(
        name:
            "Grilled Pork Belly with Garlic Fried Rice and Fried Egg – Liempo Sinangag Itlog",
        category: <Category>[Category.listCategory[4]],
        emotion: Emotion.SAD,
        image:
            'assets/images/items/pork/How_to_Cook-Liempo_Sinangag_at_Itlog_Meal.jpg',
        price: '80.00',
        addCart: false,
        orderQty: 1),

    // Seafoods
    Item(
        name:
            "Fried Daing na Bangus with Garlic Fried Rice, Fried Egg, and Pickled Papaya (Daing Silog)",
        category: <Category>[Category.listCategory[2]],
        emotion: Emotion.SAD,
        image: 'assets/images/items/seafood/Daing_na_Bangus.jpg',
        price: '80.00',
        addCart: false,
        orderQty: 1),
    Item(
        name: "Danggit Silog",
        category: <Category>[
          Category.listCategory[2],
          Category.listCategory[7]
        ],
        emotion: Emotion.SAD,
        image: 'assets/images/items/seafood/Danggit_Sinangag.jpg',
        price: '60.00',
        addCart: false,
        orderQty: 1),

    // Beef
    Item(
        name: "Bistek Silog",
        category: <Category>[Category.listCategory[5]],
        emotion: Emotion.SAD,
        image: 'assets/images/items/beef/Bistek_Sinangag_at-_tlog.jpg',
        price: '65.00',
        addCart: false,
        orderQty: 1),
    Item(
        name: "Corned Beef Silog",
        category: <Category>[
          Category.listCategory[5],
          Category.listCategory[7]
        ],
        emotion: Emotion.SAD,
        image: 'assets/images/items/beef/Breakfast_Corned_Beef_Silog.jpg',
        price: '60.00',
        addCart: false,
        orderQty: 1),
    Item(
        name: "Beef Kaldereta sa Gata with Peanut Butter",
        category: <Category>[Category.listCategory[5]],
        emotion: Emotion.SAD,
        image:
            'assets/images/items/beef/Beef_Kaldereta_sa_Gata_with_Peanut_Butter_Recipe.jpg',
        price: '60.00',
        addCart: false,
        orderQty: 1),

    // Vegetables
    Item(
        name: "Ampalaya con Carne",
        category: <Category>[Category.listCategory[1]],
        emotion: Emotion.SAD,
        image: 'assets/images/items/vegetables/beef_stir_fry.jpg',
        price: '50.00',
        addCart: false,
        orderQty: 1),
    Item(
        name: "Ginataang Gulay with Pork and Shrimp",
        category: <Category>[
          Category.listCategory[1],
          Category.listCategory[4]
        ],
        emotion: Emotion.SAD,
        image: 'assets/images/items/vegetables/Ginataang_Gulay.jpg',
        price: '65.00',
        addCart: false,
        orderQty: 1),
    Item(
        name: "Ginisang Gulay",
        category: <Category>[Category.listCategory[1]],
        emotion: Emotion.SAD,
        image: 'assets/images/items/vegetables/ginisang_gulay.jpg',
        price: '50.00',
        addCart: false,
        orderQty: 1),
    Item(
        name: "Pinakbet with Squid in Coconut Milk (Pinakbet sa Gata)",
        category: <Category>[Category.listCategory[1]],
        emotion: Emotion.SAD,
        image: 'assets/images/items/vegetables/Pinakbet_with_Squid.jpg',
        price: '50.00',
        addCart: false,
        orderQty: 1),
    Item(
        name: "Maja Blanca",
        category: <Category>[Category.listCategory[6]],
        emotion: Emotion.HAPPY,
        image: 'assets/images/items/desserts/Maja_Blanca_Recipe.jpg',
        price: '50.00',
        addCart: false,
        orderQty: 1),
    Item(
        name: "Leche Flan",
        category: <Category>[Category.listCategory[6]],
        emotion: Emotion.HAPPY,
        image: 'assets/images/items/desserts/Leche_Flan.jpg',
        price: '50.00',
        addCart: false,
        orderQty: 1),
  ];
}
