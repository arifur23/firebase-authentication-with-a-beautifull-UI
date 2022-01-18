import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child:  TextField(
        decoration:InputDecoration(
          hintText: 'Search places..',
          border: OutlineInputBorder(
            borderRadius:  BorderRadius.circular(30),
          ),
          prefixIcon: const IconButton(
            onPressed: null,
            icon: Icon(Icons.search,size: 30,),
          ),
          // suffix: const Suffix(),
          fillColor: Colors.white,
      ),
      ),
    );
  }
}

class Suffix extends StatelessWidget {
  const Suffix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      // height: 25,
      // width: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      ),
      // child: const IconButton(
      //     onPressed: null,
      //     icon: Icon(Icons.filter)) ,
    );
  }
}

