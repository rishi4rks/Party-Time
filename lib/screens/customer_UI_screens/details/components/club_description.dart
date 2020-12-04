import 'package:bookario/screens/customer_UI_screens/details/components/description_text.dart';
import 'package:flutter/material.dart';
import 'package:bookario/models/Clubs.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../components/constants.dart';
import '../../../../components/size_config.dart';

class ClubDescription extends StatelessWidget {
  const ClubDescription({
    Key key,
    @required this.club,
  }) : super(key: key);

  final Club club;
  // final GestureTapCallback pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          club.clubName,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenWidth(5),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/icons/Location point.svg",
                height: getProportionateScreenWidth(15),
              ),
              const SizedBox(
                width: 5,
              ),
              Flexible(
                child: Container(
                  child: Text(
                    club.address,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                child: Text(
                  "Directions",
                  style: TextStyle(
                    color: kSecondaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            SvgPicture.asset(
              "assets/icons/directions.svg",
              height: getProportionateScreenWidth(12),
              color: kSecondaryColor,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 25,
          ),
          child: Text(
            "About us",
            style: TextStyle(fontSize: 18, color: Colors.black87),
          ),
        ),
        DescriptionTextWidget(text: club.description),
      ],
    );
  }
}