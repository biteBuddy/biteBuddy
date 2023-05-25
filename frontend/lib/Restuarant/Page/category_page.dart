import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/ApiSerives/cart.dart';
import 'package:frontend/Restuarant/Page/RestaurantCard.dart';
import 'package:frontend/Restuarant/model/restaurant.dart';
import 'package:frontend/common/theme.dart';
import 'package:frontend/main.dart';

class RestroCategory extends ConsumerStatefulWidget {
  RestroCategory({super.key, required this.category});
  String? category;
  @override
  ConsumerState<RestroCategory> createState() => _RestroCategoryState();
}

class _RestroCategoryState extends ConsumerState<RestroCategory> {
  @override
  Widget build(BuildContext context) {
    final _restors = ref.watch(RestroProvider);
    List<Restaurant> _category = [];
    List<Restaurant> _getCategory(String category) {
      for (Restaurant r in _restors.restaurants) {
        if (r.category == category) {
          _category.add(r);
        }
      }
      return _category;
    }

    _getCategory(widget.category!);
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          children: [
            Stack(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios)),
                Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${widget.category}",
                      style: CustomTheme().pageTitle,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 5,
                      height: 2.5,
                      color: CustomTheme().primaryColor1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\"Explore  Various ${widget.category} Restuarants.\"",
                      style: CustomTheme().cardDesc.copyWith(fontSize: 13),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ))
              ],
            ),
            _category.isEmpty
                ? Center(
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
                          "Try looking for a different category of Restaurant.",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.black54,
                              fontSize: 16),
                        )
                      ],
                    ),
                  )
                : Column(
                    children: [
                      ..._category.map((e) => RestaurantCard(restaurantInfo: e))
                    ],
                  )
          ],
        ),
      ),
    )));
  }
}
