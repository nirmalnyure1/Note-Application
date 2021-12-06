import 'package:flutter/material.dart';
import 'package:note_app/Constant/textstyle.dart';
import 'package:note_app/State/home_page_provider.dart';
import 'package:share_plus/share_plus.dart';

class ShareNote extends StatelessWidget {
  HomePageProvider state;
  int index;
  BuildContext context;
  ShareNote({required this.state, required this.index, required this.context});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // RenderBox? box = context.findRenderObject() as RenderBox?;
        Share.share(
          "title:\t${state.data[index].title} \n description:\t${state.data[index].desc} ",
          // sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size
        );
      },
      child: Text(
        "share",
        style: CustomTextStyle.kstyle1(),
      ),
    );
  }
}
