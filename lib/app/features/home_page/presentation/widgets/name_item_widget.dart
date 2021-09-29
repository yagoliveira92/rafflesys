import 'package:flutter/material.dart';
import 'package:rafflesys_hugo/app/features/home_page/models/name_model.dart';

class NameItemWidget extends StatefulWidget {
  const NameItemWidget({
    required this.nameModel,
    required this.isSelected,
    this.unavaliable = false,
    Key? key,
    this.onlyRead = false,
  }) : super(key: key);

  final NameModel? nameModel;
  final bool onlyRead;
  final bool unavaliable;
  final ValueChanged<bool>? isSelected;

  @override
  State<NameItemWidget> createState() => _NameItemWidgetState();
}

class _NameItemWidgetState extends State<NameItemWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!this.widget.onlyRead && !this.widget.unavaliable) {
          setState(() {
            isSelected = !isSelected;
            widget.isSelected!(isSelected);
          });
        }
      },
      child: Stack(
        children: <Widget>[
          SizedBox.square(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.child_care,
                    color: isSelected ? Colors.blue[900] : Colors.black,
                  ),
                  Text(
                    widget.nameModel!.name,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: isSelected ? Colors.blue[900] : Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  this.widget.unavaliable
                      ? Text(
                          'Indisponível',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.blueGrey,
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ),
          isSelected
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                    ),
                  ),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
