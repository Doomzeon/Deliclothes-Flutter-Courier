import 'package:courier_app/constant.dart';
import 'package:flutter/material.dart';

class ContainerTextFormField extends StatefulWidget {
  final Function calbbackOnTap;
  final String hintText;
  final IconData iconTextForm;
  final bool passwordTextForm;

  const ContainerTextFormField({
    Key key,
    @required this.size,
    this.calbbackOnTap,
    this.hintText,
    this.iconTextForm,
    this.passwordTextForm,
  }) : super(key: key);

  final Size size;

  @override
  _ContainerTextFormFieldState createState() => _ContainerTextFormFieldState();
}

class _ContainerTextFormFieldState extends State<ContainerTextFormField> {
  bool _showPass = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80,
          width: widget.size.width,
          child: Stack(children: [
            Positioned(
              top: 15,
              left: widget.size.width * 0.13,
              child: Container(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 300,
                      height: 45,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 30.0,
                                color: kTextColor,
                                offset: Offset(0, 0))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                      padding: EdgeInsets.only(left: 5, bottom: 5),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            widget.calbbackOnTap(value);
                          });
                        },
                        obscureText: widget.passwordTextForm == true
                            ? this._showPass == false
                                ? true
                                : false
                            : false,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 13.0,
                            fontFamily: 'AvenirRegular'),
                        decoration: InputDecoration(
                            prefixIcon: Icon(widget.iconTextForm,
                                size: 22, color: Colors.grey[800]),
                            hintText: widget.hintText,
                            hintStyle: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 11.0,
                                fontFamily: 'AvenirRegular'),
                            border: InputBorder.none,
                            suffixIcon: widget.passwordTextForm == true
                                ? GestureDetector(
                                    onLongPressStart: (details) {
                                      this._showPass = true;
                                      setState(() {});
                                    },
                                    onLongPressEnd: (details) {
                                      this._showPass = false;
                                      setState(() {});
                                    },
                                    child: Icon(Icons.visibility_outlined,
                                        size: 20, color: Colors.grey[800]),
                                  )
                                : null),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        )
      ],
    );
  }
}
