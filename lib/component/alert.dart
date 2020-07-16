import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_way/component/tipconfirm.dart';

class Tip {
  static Future<bool> alert(BuildContext context, String content,{String title="提示",Function onPressed}) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_){
        return TipConfirm(
          title: title,
          content: content,
          confirmCallback: onPressed,
        );
      }
    );
  }
}
