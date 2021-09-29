import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rafflesys_hugo/app/features/home_page/models/name_model.dart';
import 'package:rafflesys_hugo/app/features/home_page/presentation/widgets/name_item_widget.dart';

class GridNamesWidget extends StatelessWidget {
  const GridNamesWidget({
    required this.listName,
    required this.function,
    Key? key,
  }) : super(key: key);

  final List<NameModel> listName;
  final Function({
    required bool add,
    required NameModel nameModel,
  }) function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.4),
                BlendMode.modulate,
              ),
              repeat: ImageRepeat.repeat,
              image: AssetImage("assets/background_card.jpg"),
              fit: BoxFit.contain,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.child_friendly),
                  Text(
                    'Escolha o nome que mais te agrada!',
                    style: GoogleFonts.pacifico(
                      fontSize: 18.0,
                    ),
                  ),
                  Icon(Icons.crib),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Center(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: this.listName.length,
                  itemBuilder: (BuildContext context, int index) {
                    return NameItemWidget(
                      unavaliable: this.listName[index].status,
                      key: Key(this.listName[index].id),
                      nameModel: this.listName[index],
                      isSelected: (bool value) async => function(
                        add: value,
                        nameModel: this.listName[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
