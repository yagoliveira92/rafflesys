import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        centerTitle: true,
        title: Text(
          'Rifa de Fralda do Hugo',
          style: GoogleFonts.dancingScript(
            color: Colors.blue[700],
            fontSize: 26,
          ),
        ),
        background: ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.transparent],
            ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
          },
          blendMode: BlendMode.dstIn,
          child: Image.asset(
            'assets/bg_sliver.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
