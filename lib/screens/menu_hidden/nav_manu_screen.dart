import 'package:alquinet/routes/app_routes.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  final Function position, logout, changeMode;
  final bool stateMode;
  final String title;
  const MenuScreen({
    Key? key,
    required this.position,
    required this.logout,
    required this.stateMode,
    required this.changeMode,
    required this.title,
  }) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // NAV HEAD
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 50.0, left: 20.0),
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.position(0);
                }),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: Image.asset('assets/images/alquinet_logo.jpeg'),
                  ),
                ),
              ),
            ),
          ],
        ),
        Flexible(
          // NAV BODY
          child: ListView.builder(
            itemCount: AppRoutes().appRoutes.length,
            itemExtent: 40.0,
            itemBuilder: (context, index) => ListTile(
              onTap: () => setState(() {
                widget.position(index);
              }),
              leading: Icon(
                AppRoutes().appRoutes[index].icon,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                AppRoutes().appRoutes[index].nameText,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ),
        Padding(
          // NAV FOTTER
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => setState(() {
                  widget.position(1);
                }),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.app_registration_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      'Register',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  widget.position(2);
                }),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.login_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      'Login',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => widget.logout(),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.logout_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      'Logout',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  widget.changeMode();
                }),
                child: Row(
                  children: <Widget>[
                    Icon(
                      widget.stateMode
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      'Mode',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
