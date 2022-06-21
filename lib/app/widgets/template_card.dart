
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tangani/app/widgets/app_style_text.dart';
import 'package:tangani/app/widgets/constants.dart';

class TemplateCard extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding,
      ),
      height: 140,
      child: new Stack(
        children: <Widget>[
          detailCard,
          imgCard,
          logoCard,
        ],
      ),
    );
  }

  final logoCard = new Container(
    child: Align(
      alignment: Alignment.topRight,
      child: Image(
        image: AssetImage("assets/images/logo-transparent.png"),
        width: 125,
        height: 125,
        fit: BoxFit.cover,
      ),
    ),
  );

  final imgCard = new Container(
    margin: new EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
    alignment: FractionalOffset.centerLeft,
    child: Stack(
      children: [
        new AvatarGlow(
          glowColor: kDefaultColor,
          endRadius: 55.0,
          duration: Duration(milliseconds: 1000),
          repeat: true,
          showTwoGlows: true,
          child: Material(
            // Replace this child with your own
            elevation: 2.0,
            shape: CircleBorder(),
            child: CircleAvatar(
              backgroundColor: Colors.grey[100],
              child: Image.asset(
                'assets/avatar/noimage.png',
                height: 90,
              ),
              radius: 50.0,
            ),
          ),
        ),
        // new Positioned(
        //   bottom: 0,
        //   right: -25,
        //   child: RawMaterialButton(
        //     onPressed: () {},
        //     elevation: 2.0,
        //     fillColor: kDefaultColor,
        //     child: InkWell(
        //       onTap: () {
        //         showBottomSheet;
        //       },
        //       child: Icon(
        //         Icons.camera_alt_outlined,
        //         color: Colors.white,
        //       ),
        //     ),
        //     padding: const EdgeInsets.all(kDefaultPadding / 2),
        //     shape: CircleBorder(),
        //   ),
        // ),
      ],
    ),
  );

  final detailCard = new Container(
    height: 124,
    margin: new EdgeInsets.only(left: kDefaultPadding * 5),
    padding: new EdgeInsets.only(left: kDefaultPadding * 6),
    decoration: new BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(KDefaultCircular),
      border: Border.all(
        width: 1.0,
        color: Colors.grey.shade300,
      ),
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Colors.white,
          new Color(0xFFFFA500),
        ],
      ),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: new Offset(0.0, 12.0),
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("John Doe", style: AppStyleText.CARDTEMPTITLE_TEXT),
            Text("0000-0000-0000-0000",
                style: AppStyleText.CARDTEMPSUBTITLE_TEXT),
          ],
        ),
      ],
    ),
  );
}
