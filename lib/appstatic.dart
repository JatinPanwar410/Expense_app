import 'package:flutter/material.dart';


class AppStatic {

  static const String BasePath = "assets/icon/cat/";

  static const String coffeePath = "${BasePath}coffee.png";
  static const String fastFoodPath = "${BasePath}fast-food.png";
  static const String restaurantPath = "${BasePath}restaurant.png";
  static const String shoppingPath = "${BasePath}shopping-bag.png";
  static const String snackPath = "${BasePath}snack.png";
  static const String travelPath = "${BasePath}travel.png";
  static const String vegetablesPath = "${BasePath}vegetables.png";
  static const String smartphonePath = "${BasePath}smartphone.png";



  static const List<Map<String,dynamic>> catagories = [
    {'id': 1, 'name': 'Travel', 'img': coffeePath},
    {'id': 2, 'name': 'Coffee', 'img': fastFoodPath},
    {'id': 3, 'name': 'Movie', 'img': restaurantPath},
    {'id': 4, 'name': 'Petrol', 'img': shoppingPath},
    {'id': 5, 'name': 'Recharge', 'img': snackPath},
    {'id': 6, 'name': 'Shopping', 'img': travelPath},
    {'id': 7, 'name': 'Snacks', 'img': vegetablesPath},
    {'id': 8, 'name': 'Restaurant', 'img': smartphonePath},
  ];
}


// List<Map<String,dynamic>> dummyExpense = [
//   {
//     "date" : "Today",
//     "amt" : "5000",
//     "transactions" : [
//       {
//         "title" : "Coffee",
//         "desc" : "With Office frns",
//         "amt" : "500",
//         "balance" : "5000",
//         "catImg" : "https://img.freepik.com/free-photo/fresh-coffee-steams-wooden-table-close-up-generative-ai_188544-8923.jpg"
//       },
//       {
//         "title" : "Coffee",
//         "desc" : "With Family",
//         "amt" : "1000",
//         "balance" : "4000",
//         "catImg" : "https://img.freepik.com/free-photo/fresh-coffee-steams-wooden-table-close-up-generative-ai_188544-8923.jpg"
//       }
//     ]
//   },
//
//   {
//     "date" : "Yesterday",
//     "amt" : "7000",
//     "transactions" : [
//       {
//         "title" : "Shopping",
//         "desc" : "Jeans T-shirt",
//         "amt" : "2000",
//         "balance" : "2000",
//         "catImg" : "https://img.freepik.com/free-photo/fresh-coffee-steams-wooden-table-close-up-generative-ai_188544-8923.jpg"
//       },
//       {
//         "title" : "Petrol",
//         "desc" : "for car",
//         "amt" : "3000",
//         "balance" : "10000",
//         "catImg" : "https://img.freepik.com/free-photo/fresh-coffee-steams-wooden-table-close-up-generative-ai_188544-8923.jpg"
//       },
//       {
//         "title" : "Groceries",
//         "desc" : "for home",
//         "amt" : "200",
//         "balance" : "10000",
//         "catImg" : "https://img.freepik.com/free-photo/fresh-coffee-steams-wooden-table-close-up-generative-ai_188544-8923.jpg"
//       }
//     ]
//   },
//
//   {
//     "date" : "05-12-2023",
//     "amt" : "2000",
//     "transactions" : [
//       {
//         "title" : "Coffee",
//         "desc" : "With Office frns",
//         "amt" : "500",
//         "balance" : "5000",
//         "catImg" : "https://img.freepik.com/free-photo/fresh-coffee-steams-wooden-table-close-up-generative-ai_188544-8923.jpg"
//       },
//     ]
//   },
//
//   {
//     "date" : "04-12-2023",
//     "amt" : "20000",
//     "transactions" : [
//       {
//         "title" : "Coffee",
//         "desc" : "With Office frns",
//         "amt" : "500",
//         "balance" : "5000",
//         "catImg" : "https://img.freepik.com/free-photo/fresh-coffee-steams-wooden-table-close-up-generative-ai_188544-8923.jpg"
//       },
//     ]
//   }
//
// ];