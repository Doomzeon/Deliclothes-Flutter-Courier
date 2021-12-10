import 'package:courier_app/constant.dart';
import 'package:courier_app/logic/bloc/courier_bloc.dart';
import 'package:courier_app/logic/events/courier_event.dart';
import 'package:courier_app/main.dart';
import 'package:courier_app/screens/sign_in/widgets/container_tet_field.dart';
import 'package:courier_app/screens/sign_in/widgets/procced_button_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContainerLoginForm extends StatefulWidget {
  const ContainerLoginForm({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _ContainerLoginFormState createState() => _ContainerLoginFormState();
}

class _ContainerLoginFormState extends State<ContainerLoginForm> {
  String _email, _password;

  _setEmail(String value) {
    setState(() {
      this._email = value;
      print('Email is : ' + this._email);
    });
  }

  _setPassword(String value) {
    setState(() {
      this._password = value;
      print('Password is : ' + this._password);
    });
  }
  test(){
    BlocProvider.of<CourierBlocLogin>(context)
        .add(CourierEventLogin(this._email, this._password));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: widget.size.height * 0.25),
      width: widget.size.width,
      height: widget.size.height * 0.80,
      //color: Colors.orange,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(300),
            bottomRight: Radius.circular(100)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Benvenuto',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      fontFamily: 'AvenirLight'))
            ],
          ),
          ContainerTextFormField(
            size: widget.size,
            calbbackOnTap: this._setEmail,
            hintText: 'Inserisci la tua mail',
            iconTextForm: Icons.person_outlined,
            passwordTextForm: false,
          ),
          ContainerTextFormField(
              size: widget.size,
              hintText: 'Inserisci la tua password',
              iconTextForm: Icons.lock_outlined,
              calbbackOnTap: this._setPassword,
              passwordTextForm: true),
          ProccedButtonSignContainer(
            textButton: 'Sign In',
            colorButton: kSecondaryColor,
            callbackFunction: this.test,
          )
        ],
      ),
    );
  }
}
