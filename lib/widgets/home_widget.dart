import 'package:firebase_authentication/constants.dart';
import 'package:firebase_authentication/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xFFFCFCFC),
        child: Column(
          children: const [
             Text('Makes your',style: semiBoldTextStyle,),
             SizedBox(height: 10,),
            Text('Travel Easy!',style: boldTextStyle,),
            SizedBox(height: 10,),
            SearchBar()
          ],
        ),
      ),
    );
  }
}

// CustomScrollView(
// primary: false,
// slivers: <Widget>[
// SliverPadding(
// padding: const EdgeInsets.all(20),
// sliver: SliverGrid.count(
// crossAxisSpacing: 10,
// mainAxisSpacing: 10,
// crossAxisCount: 2,
// children: List.generate(
// 4, (index) {
// return const Text('Hello');
// }
// )
// ),
// ),
// ],
// )
