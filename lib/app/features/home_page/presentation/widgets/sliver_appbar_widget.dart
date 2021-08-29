import 'package:flutter/material.dart';

class SliverAppbarWidget extends StatefulWidget {
  const SliverAppbarWidget({Key? key}) : super(key: key);

  @override
  _SliverAppbarWidgetState createState() => _SliverAppbarWidgetState();
}

class _SliverAppbarWidgetState extends State<SliverAppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Rifa de Fralda do Hugo',
          style: TextStyle(color: Colors.blue),
        ),
        background: Image.asset(
          'assets/bg_sliver.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
