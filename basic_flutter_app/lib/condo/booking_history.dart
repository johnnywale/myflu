import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as f;
import 'package:progress_hud/progress_hud.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:we_rate_dogs/condo/toast_notification.dart';

import 'base_condo_page.dart';
import 'child_updatable.dart';
import 'condo_config.dart';
import 'lib/api/facility_api.dart';
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

  FacilityApi facilityApi;
  Color canceledColor = Color(0xffcccccc);
  f.DateFormat formatter;
  f.DateFormat timeFormatter;

  @override
  void initState() {
    super.initState();
    formatter = f.DateFormat("yyyy-MM-dd");
    timeFormatter = f.DateFormat("h:mm a");
    userApi = condoService.jaguarApiGen.getUserApi();
    facilityApi = condoService.jaguarApiGen.getFacilityApi();
  }

  @override
  void dispose() {

  }


  Widget buildCanceled(FacilityBooking facility) {
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
                            'Date: ${formatter.format(
                                facility.bookingBegin)} Slot: ${timeFormatter
                                .format(
                                facility.bookingBegin)} to ${timeFormatter
                                .format(facility.bookingEnd)}',
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
  }

  @override
  Widget buildItem(FacilityBooking facility) {
    if (facility.status == "invalid") {
      return buildCanceled(facility);
    } else
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            print("||");
          },
          child: Ink(
            decoration: BoxDecoration(
                color: condoBackgroundColor,
                border: Border(
                    bottom: BorderSide(width: 0.5, color: canceledColor))),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Ink(
                      child: Ink(
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
                                color: condorTextColor,
                              ),
                            ),
                            SizedBox(height: 5),
                            RichText(
                                text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Date: ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text:
                                        '${formatter.format(
                                            facility.bookingBegin)}',
                                        style: TextStyle(
                                          //
                                            color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: '  Slot: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black.withOpacity(
                                                1.0)),
                                      ),
                                      TextSpan(
                                        text:
                                        '${timeFormatter.format(facility
                                            .bookingBegin)} to ${timeFormatter
                                            .format(facility.bookingEnd)}',
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(
                                                1.0)),
                                      ),
                                    ],
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: canceledColor,
                                    )),
                                textDirection: TextDirection.rtl),
                            SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                  color: condoActionbarColor,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                              padding: EdgeInsets.all(4),
                              child: Text(
                                "${facility.bookingStatus}",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      )),
                  Container(
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: () {
                        userApi
                            .userFacilityBookingFacilityBookingIdDelete(
                            facility.id)
                            .then((condo) {
                          ToastNotification(
                              msgType: MsgType.INFO, msg: "Cancel success")
                              .dispatch(context);
                          refreshController.requestRefresh();
                        });
                      },
                      icon: Icon(
                        Icons.cancel,
                        color: condoActionbarColor,
                      ),
                    ),
                  )
                ]),
          ),
        ),
      );
  }

  Future<List<FacilityBooking>> userUserIdFacilityBookingGet() {
    return userApi.userUserIdFacilityBookingGet(condoService.member.id);
  }

  @override // TODO: implement loadAll
  get loadAll => userUserIdFacilityBookingGet;
}
