import 'package:flutter/material.dart';

class AppWidget {
  showProgressGlobal(var context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      useRootNavigator: false,
      builder: (BuildContext contextAlert) {
        return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: Container(
                width: MediaQuery.of(context).size.width - 250,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 70,
                        child: Image.asset("assets/images/gif/loading.gif"),
                        margin: EdgeInsets.only(right: 20),
                      ),
                      Text(
                        "Cargando",
                        textAlign: TextAlign.center,
                        //  style: AppStyle().styleText(18, AppColors.mainColor, true),
                      ),
                    ],
                  ),
                )));
      },
    );
  }
}
