import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:numerical_lotto/constant.dart';
import 'package:numerical_lotto/services/api_services.dart';
import 'package:numerical_lotto/widget/custom_appbar.dart';

import 'widget/custom_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _services = ApiServices();
  List<int> _listNumbers = new List<int>.generate(6, (index) => 0);
  bool _isShake = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'SAYISAL LOTO '),
      body: Column(
        children: [
          Spacer(flex: 1),
          Expanded(flex: 4, child: buildAnimatedOpacitySVG()),
          buildListView(),
          Spacer(flex: 1),
          buildComponentsButton(),
          Spacer(flex: 1),
        ],
      ),
    );
  }

  Widget buildAnimatedOpacitySVG() {
    return Container(
      margin: EdgeInsets.all(30),
      child: SvgPicture.asset(
        GUESS_SVG,
      ),
    );
  }

  Widget buildListView() {
    return Container(
      height: 55,
      margin: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: _listNumbers.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ShakeAnimatedWidget(
          enabled: this._isShake,
          duration: Duration(milliseconds: 15),
          shakeAngle: Rotation.deg(z: 15),
          curve: Curves.linear,
          child: Card(
            elevation: 4,
            margin: EdgeInsets.all(5),
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
                width: 45,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white),
                child: Text(
                  _listNumbers[index].toString(),
                  textAlign: TextAlign.center,
                  style: textTextStyle,
                )),
          ),
        ),
      ),
    );
  }

  buildComponentsButton() {
    return ComponentsButton(
      buttonColor: Colors.white,
      textColor: mainColor,
      splashColor: Colors.blueAccent,
      buttonFontSize: 20,
      buttonText: 'Görüntüle',
      radius: 15,
      onPressed: () {
        setState(() {
          _isShake = !_isShake;
        });
        _services.getNumbers().then((data) async {
          await Future.delayed(Duration(milliseconds: 200));
          setState(() {
            _listNumbers = data;
            _isShake = false;
          });
        });
      },
    );
  }
}
