import 'package:courier_app/constant.dart';
import 'package:courier_app/logic/bloc/courier_bloc.dart';
import 'package:courier_app/logic/events/courier_event.dart';
import 'package:courier_app/logic/local_storage.dart';
import 'package:courier_app/logic/states/courier_states.dart';
import 'package:courier_app/push_notifications.dart';
import 'package:courier_app/screens/schedule/schedule.dart';
import 'package:courier_app/screens/sign_in/login.dart';
import 'package:courier_app/widgets/bottom_modal_take_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

void main() {
  runApp(MyApp());
}

int _selectedPage = 0;

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _idUser;
  String _user;

  void initState() {
    super.initState();
    print('asd');
    init();
  }

  Future init() async {
    _user = await LocalStorageSecure.readUser();
    print(_user.runtimeType);
    this._idUser = int.parse(_user);
    print(_idUser);
    print('_idUser');
    print(_idUser);
    setState(() => {});
    if (this._idUser != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CourierBlocLogin>(
            create: (BuildContext context) => CourierBlocLogin(
                this._idUser != null
                    ? CourierLoginSuccess(this._idUser)
                    : CourierNotLoggedIn()),
          ),
          BlocProvider<CourierBlocOrders>(
            create: (BuildContext context) =>
                CourierBlocOrders(CourierSelectOrdersInitialState()),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Deliclothes',
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          //onGenerateRoute: _appRouter.onGenerateRoute,
          //channel: IOWebSocketChannel.connect('wss://echo.websocket.org'),
          home: InitialPoint(idUser: _idUser),
        ));
  }
}

PageController _pageController = new PageController();

void onPressedNavItem(int pageSelected) {
  _pageController.jumpToPage(pageSelected);
}

class InitialPoint extends StatefulWidget {
  final int idUser;

  const InitialPoint({Key key, this.idUser}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InitialPointState();
  }
}

IO.Socket socket = IO.io(
    'http://127.0.0.1:8081/',
    OptionBuilder()
        .setTransports(['websocket']) // for Flutter or Dart VM
        .disableAutoConnect() // disable auto-connection
        .setExtraHeaders({'foo': 'bar'}) // optional
        .build());

class InitialPointState extends State<InitialPoint> {
  List<Widget> _pages = [SignIn(), Schedule()];
  void _onPageChanged(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  //PushNotificationsManager manager = new PushNotificationsManager();


  @override
  Widget build(BuildContext 
  context) {
   // manager.init();
    Size size = MediaQuery.of(context).size;
    socket.connect();
    //  socket.once('connect', (data) => print(data));
    print(widget.idUser);
    // socket.emit('queque', {'data':0});
    // TODO: implement build

    /*socket.on(
        'new_order',
        (data) => {
          print('received data from socket:'),
          print(data),
              buildShowModalBottomSheet(context, data['order_id'], 0)
                  .then((value) => setState(() => {
                        BlocProvider.of<CourierBlocOrders>(context)
                            .add(CourierEventSelectOrders(widget.idUser)),
                       // _onPageChanged(1),
                      }))
            });*/

    return Scaffold(
          resizeToAvoidBottomPadding: false,
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: _selectedPage >= 1
          ? BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    title: Text(''),
                    icon: Icon(
                      Icons.delivery_dining,
                      color: _selectedPage == 1
                          ? kTextFilterTypeColor
                          : kTextColor,
                    )),
                BottomNavigationBarItem(
                    title: Text(''),
                    icon: Icon(
                      Icons.person_outline_outlined,
                      color: kTextColor,
                    ))
              ],
            )
          : null,
    );
  }
}
