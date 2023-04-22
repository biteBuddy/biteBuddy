import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/pages/homePage.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
              decoration: InputDecoration(
                  filled: true,
                  labelText: "Search for Restaurant or Food",
                  labelStyle: const TextStyle(fontFamily: "Poppins"),
                  prefixIcon: const Icon(Icons.search),
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(image: AssetImage("Group.png")),
                SizedBox(
                  height: 10,
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
                      fontFamily: "Poppins",
                      color: Colors.black54,
                      fontSize: 16),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
