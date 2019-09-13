import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as f;
import 'package:progress_hud/progress_hud.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'base_condo_page.dart';
import 'child_updatable.dart';
import 'condo_config.dart';
import 'lib/api/user_api.dart';
import 'lib/model/facility_booking.dart';

class BookingHistoryPage extends StatefulWidget {
  @override
  FacilityPageState createState() => FacilityPageState();

  const BookingHistoryPage({Key key}) : super(key: key);
}

class FacilityPageState
    extends BaseCondoPageState<BookingHistoryPage, FacilityBooking> {
  UserApi userApi;
  Color canceledColor = Color(0xffcccccc);
  f.DateFormat formatter;

  @override
  void initState() {
    super.initState();
    formatter = f.DateFormat("yyyy-MM-dd");

    userApi = condoService.jaguarApiGen.getUserApi();
  }

  @override
  Widget buildItem(FacilityBooking facility) {
    print(facility);
    return Column(children: <Widget>[
      Material(
        child: InkWell(
          onTap: () {
            print("||");
          },
          child: Ink(
              color: condoBackgroundColor,
              width: double.infinity,
              child: Ink(
                decoration: BoxDecoration(
                    color: condoBackgroundColor,
                    border: Border(
                        bottom: BorderSide(width: 0.5, color: canceledColor))),
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      facility.facility.name,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: canceledColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    RichText(
                        text: TextSpan(
                            text:
                                'Date: ${formatter.format(facility.bookingBegin)}',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: canceledColor,
                            )),
                        textDirection: TextDirection.rtl),
                    SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                          color: canceledColor,
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      padding: EdgeInsets.all(4),
                      child: Text(
                        "${facility.bookingStatus}",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    ]);
    ;
  }

  Future<List<FacilityBooking>> userUserIdFacilityBookingGet() {
    return userApi.userUserIdFacilityBookingGet(condoService.member.id);
  }

  @override // TODO: implement loadAll
  get loadAll => userUserIdFacilityBookingGet;
}
