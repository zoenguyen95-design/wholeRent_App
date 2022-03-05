import 'package:flutter/material.dart';



class SearchInput extends StatefulWidget {


  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: TextField(
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: 'Search here ...',
            prefixIcon: Container(
              padding: EdgeInsets.all(15),
              child: Icon(Icons.search),
            ),
            contentPadding: EdgeInsets.all(2)),
      ),
    );
  }
}