import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/ApiSerives/search.dart';
import 'package:frontend/Food/Page/singleCard.dart';
import 'package:frontend/Food/model/Food.dart';
import 'package:frontend/Restuarant/Page/RestaurantCard.dart';
import 'package:frontend/Restuarant/model/restaurant.dart';
import 'package:frontend/pages/homePage.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool _searchRestro = true;
  late List<dynamic> restros;
  late List<Food> foods;
  bool _results = false;
  Widget noResult = Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.search_off_rounded,
          size: 50,
          color: Colors.grey,
        ),
        Text(
          "No Results Found",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
              fontFamily: "Poppins"),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Try searching for a different keyword.",
          style: TextStyle(
              fontFamily: "Poppins", color: Colors.black54, fontSize: 16),
        )
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.centerStart,
            children: const [
              Center(
                child: Text(
                  "Search",
                  style: TextStyle(fontFamily: "Poppins", fontSize: 18),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: TextField(
              onChanged: (value) async {
                List<dynamic> _restros = _searchRestro
                    ? await SearchAPI.searchForRestaurant(value)
                    : await SearchAPI.searchForFood(value);
                setState(() {
                  if (value == "") {
                    _results = false;
                  } else if (_restros.isEmpty) {
                    _results = false;
                  } else {
                    restros = _restros;
                    _results = true;
                  }
                  print(restros);
                });
              },
              decoration: InputDecoration(
                  filled: true,
                  labelText:
                      "Search for ${_searchRestro ? "Restaurant" : "Food"}",
                  labelStyle: const TextStyle(fontFamily: "Poppins"),
                  prefixIcon: const Icon(Icons.search),
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          _results
              ? Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        ...restros.map((e) => _searchRestro
                            ? RestaurantCard(restaurantInfo: e)
                            : SingleFood(food: e))
                      ],
                    ),
                  ),
                )
              : noResult,
        ],
      ),
    );
  }
}
