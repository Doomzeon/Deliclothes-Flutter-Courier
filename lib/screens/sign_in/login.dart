import 'package:courier_app/constant.dart';
import 'package:courier_app/logic/bloc/courier_bloc.dart';
import 'package:courier_app/logic/states/courier_states.dart';
import 'package:courier_app/screens/sign_in/widgets/container_form_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CourierBlocLogin, CourierState>(
      builder: (context, state) {
        if(state is CourierNotLoggedIn){
        return Container(
          child: Column(
            children: [ContainerLoginForm(size: size)],
          ),
        );
        }else{
          return Container();
        }
      },
    );
  }
}
