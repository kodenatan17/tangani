import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tangani/app/widgets/constants.dart';

class CarouselLoading extends StatelessWidget {
  const CarouselLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey.shade300,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(
                kDefaultPadding, kDefaultPadding, kDefaultPadding, 0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(kDefaultPadding),
              ),
              child: AspectRatio(
                aspectRatio: 20 / 9,
                child: Container(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 8,
                width: 8,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
              ),
              SizedBox(
                width: 3,
              ),
              Container(
                height: 8,
                width: 8,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
              ),
              SizedBox(
                width: 3,
              ),
              Container(
                height: 8,
                width: 8,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
              ),
              SizedBox(
                width: 3,
              ),
              Container(
                height: 8,
                width: 8,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
              ),
              SizedBox(
                width: 3,
              ),
              Container(
                height: 8,
                width: 8,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
              ),
              SizedBox(
                width: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
