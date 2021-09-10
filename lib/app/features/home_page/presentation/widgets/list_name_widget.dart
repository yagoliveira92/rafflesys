import 'package:flutter/material.dart';
import 'package:rafflesys_hugo/app/features/home_page/models/name_model.dart';

class NameItemWidget extends StatefulWidget {
  const NameItemWidget({this.nameModel, this.isSelected, Key? key})
      : super(key: key);

  final NameModel? nameModel;

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
        setState(() {
          isSelected = !isSelected;
          widget.isSelected!(isSelected);
        });
      },
      child: Stack(
        children: <Widget>[
          SizedBox.square(
            child: Center(
              child: Text(
                widget.nameModel!.name,
                style: TextStyle(fontSize: 15),
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
