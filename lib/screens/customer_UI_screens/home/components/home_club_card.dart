import 'package:bookario/screens/customer_UI_screens/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:bookario/models/Clubs.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../components/size_config.dart';

class HomeClubCard extends StatelessWidget {
  const HomeClubCard({
    Key key,
    @required this.club,
  }) : super(key: key);

  final Club club;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth * .96,
      height: getProportionateScreenWidth(200),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          DetailsScreen.routeName,
          arguments: ClubDetailsArguments(club: club),
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Stack(
              children: [
                SizedBox(
                  width: SizeConfig.screenWidth,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color(0xFF343434).withOpacity(0.3),
                          Color(0xFF343434).withOpacity(0.1),
                        ],
                      ),
                    ),
                    child: Hero(
                      tag: club.id.toString(),
                      child: Image.asset(
                        club.images[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: SizedBox(
                    width: SizeConfig.screenWidth * 0.96,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(12, 2, 12, 5),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFF343434).withOpacity(0.8),
                            Color(0xFF343434).withOpacity(0.4),
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: club.clubName,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    fontSize: getProportionateScreenWidth(16),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                              children: [
                                TextSpan(
                                  text: '  (${club.location})',
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(12),
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/Location point.svg",
                                height: getProportionateScreenWidth(13),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    club.address,
                                    style: TextStyle(color: Colors.white),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
