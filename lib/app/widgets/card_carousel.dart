import 'package:flutter/material.dart';
import 'package:tangani/app/models/card_model.dart';
import 'package:tangani/app/widgets/app_style_text.dart';
import 'package:tangani/app/widgets/constants.dart';

class CardCarousel extends StatelessWidget {
  final CardModel card;
  const CardCarousel({required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 200,
        minHeight: 200,
        maxWidth: MediaQuery.of(context).size.width,
        minWidth: MediaQuery.of(context).size.width,
      ),
      decoration: BoxDecoration(
        color: card.cardColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding / 2,
                ),
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      card.title,
                      style: AppStyleText.TANGA_TITLE_CARD,
                    ),
                    SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    Text(
                      card.subtitle,
                      style: AppStyleText.TANGA_SUBTITLE_CARD,
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Image(
                  image: AssetImage("assets/images/logo-transparent.png"),
                  width: 70,
                  height: 35,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 200,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kDefaultPadding * 2),
                bottomLeft: Radius.circular(kDefaultPadding * 2),
              ),
              image: DecorationImage(
                image: AssetImage(card.cardImage),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.rectangle,
            ),
          ),
        ],
      ),
    );
  }
}
