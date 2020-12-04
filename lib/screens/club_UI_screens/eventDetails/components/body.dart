import 'package:bookario/components/constants.dart';
import 'package:bookario/components/hoveringBackButton.dart';
import 'package:bookario/models/Clubs.dart';
import 'package:bookario/models/Events.dart';
import 'package:bookario/screens/club_UI_screens/eventDetails/components/pie_chart_view.dart';
import 'package:bookario/screens/club_UI_screens/eventDetails/components/row_display.dart';
import 'package:bookario/screens/customer_UI_screens/details/components/all_prices.dart';
import 'package:bookario/screens/customer_UI_screens/eventDetails/components/event_description.dart';
import 'package:flutter/material.dart';
import 'package:bookario/components/size_config.dart';

class Body extends StatelessWidget {
  final int eventId;

  Body({Key key, @required this.eventId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset('assets/images/dummyPub1.jpg'),
                    HoveringBackButton(),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: getProportionateScreenWidth(10)),
                  padding: EdgeInsets.only(top: 16, left: 20, right: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      EventDescription(
                        event: demoEvents[eventId - 1],
                        pressOnSeeMore: () {},
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      // TODO: Display remaining stags here
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 25,
                          ),
                          child: Text(
                            "Pass Prices",
                            style:
                                TextStyle(fontSize: 18, color: Colors.black87),
                          ),
                        ),
                      ),
                      AllPrices(club: demoClubs[0]),
                      ChartView(eventId: eventId),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                          children: [
                            divider(),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RowDisplay(
                                  icon: "assets/icons/group.svg",
                                  title: "Total Bookings :  ",
                                  value: (16 + 12).toString(),
                                ),
                                RowDisplay(
                                  icon: "assets/icons/m-f.svg",
                                  title: "Male / Female : ",
                                  value:
                                      16.toString() + // variable male & female count
                                          " / " +
                                          12.toString(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Earnings\n",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: "₹ " +
                                        (16 * 1000 +
                                                12 *
                                                    1500) // variable male & female count
                                            .toString(),
                                    style: TextStyle(color: kSecondaryColor),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30)
                      // SizedBox(
                      //   height: SizeConfig.orientation == Orientation.portrait
                      //       ? SizeConfig.screenHeight * .1
                      //       : SizeConfig.screenHeight * .2,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     color: Colors.white70,
          //     child: Padding(
          //       padding: EdgeInsets.only(
          //         left: SizeConfig.screenWidth * 0.15,
          //         right: SizeConfig.screenWidth * 0.15,
          //         bottom: getProportionateScreenWidth(10),
          //         top: getProportionateScreenWidth(2),
          //       ),
          //       child: DefaultButton(
          //         text: "Get Pass",
          //         press: () {},
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
