import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:we_rate_dogs/condo/tc.dart';

import 'condo_config.dart';
import 'condo_service.dart';
import 'lib/api/facility_api.dart';
import 'lib/model/booking_session_status.dart';
import 'lib/model/facility.dart';
import 'swagger_date_time.dart';

// Example holidays
final Map<DateTime, List> _holidays = {
  DateTime(2019, 1, 1): ['New Year\'s Day'],
  DateTime(2019, 1, 6): ['Epiphany'],
  DateTime(2019, 2, 14): ['Valentine\'s Day'],
  DateTime(2019, 4, 21): ['Easter Sunday'],
  DateTime(2019, 4, 22): ['Easter Monday'],
};

class FacilityBookingPage extends StatefulWidget {
  FacilityBookingPage({Key key, this.facility}) : super(key: key);
  final Facility facility;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FacilityBookingPage>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  CalendarController _calendarController;
  CondoService _condoService;
  FacilityApi facilityApi;
  int groupId = 0;
  bool agreed = false;
  List<BookingSessionStatus> bookingSessionStatus = [];
  SwaggerDateTime selectedDay;
  Animation<double> opacity;

  @override
  void initState() {
    super.initState();

    selectedDay = SwaggerDateTime.fromMillisecondsSinceEpoch(
        DateTime
            .now()
            .add(Duration(days: 7))
            .millisecondsSinceEpoch);
    _condoService = new CondoService();
    _calendarController = CalendarController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.50,
        1.00,
        curve: Curves.linear,
      ),
    ));

    _animationController.addListener(() {
      setState(() {});
    });

    facilityApi = _condoService.jaguarApiGen.getFacilityApi();
    loadBookingStatus();
  }

  void loadBookingStatus() {
    facilityApi
        .facilityFacilityIdSessionGet(widget.facility.id, selectedDay)
        .then((e) {
      print("found status $e");
      bookingSessionStatus = e;
      _animationController.forward(from: 0.0);

//      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    SwaggerDateTime newDay =
    SwaggerDateTime.fromMillisecondsSinceEpoch(day.millisecondsSinceEpoch);
    if (newDay != selectedDay) {
      print("${selectedDay}");
      selectedDay = newDay;
      loadBookingStatus();
    }
  }

  void _onVisibleDaysChanged(DateTime first, DateTime last,
      CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void goTc() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return new TcPage(facility: widget.facility);
    }));
  }

  Widget generateSlots() {
    print("==gen==");
    if (bookingSessionStatus.length == 0) {
      return Container();
    } else {
      List<Widget> data = [];
      data.add(Container(
        height: 0.5,
        margin: EdgeInsets.only(left: 20, right: 20),
        color: Colors.black,
      ));
      data.add(SizedBox(height: 20));
      data.add(Container(
        padding: EdgeInsets.only(left: 5),
        child: Text(
          "Time",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ));
      bookingSessionStatus.forEach((f) =>
      {
        if ("valid" == f.status.toLowerCase())
          {
            data.add(Row(children: [
              Radio(
                  value: f.id,
                  groupValue: groupId,
                  activeColor: condoActionbarColor,
                  onChanged: (e) {
                    groupId = f.id;
                    setState(() {});
                  }),
              Text(
                "${f.startTime} - ${f.endTime}",
              )
            ]))
          }
        else
          {
            data.add(Row(children: [
              Radio(
                value: f.id,
                groupValue: groupId,
                activeColor: condoActionbarColor,
              ),
              Text(
                "${f.startTime} - ${f.endTime}",
                style: TextStyle(color: Colors.grey),
              )
            ]))
          }
      });
      print("opacity  ${opacity.value}");
      return Opacity(
        opacity: opacity.value,
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: data,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: condoActionbarColor,
        title: Text("${widget.facility.name}"),
      ),
      body: SingleChildScrollView(
        child: Container(
//          color: Colors.green,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTableCalendar(),
              generateSlots(),
//              const SizedBox(height: 8.0),
              Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Wrap(
                    runAlignment: WrapAlignment.start,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 0.0,
                    runSpacing: 8.0,
                    children: [
                      Checkbox(
                        value: agreed,
                        activeColor: condoActionbarColor,
                        onChanged: (checked) {
                          this.agreed = checked;
                          setState(() {});
                        },
                      ),
                      Text("By clicking Submit you agree to the "),
                      GestureDetector(
                        onTap: () {
                          goTc();
                        },
                        child: Text(
                          "Terms",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color(0xff9d661b)),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            goTc();
                          },
                          child: Text(" and",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color(0xff9d661b)))),
                      GestureDetector(
                          onTap: () {
                            goTc();
                          },
                          child: Text(" Conditions",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color(0xff9d661b))))
                    ],
                  )),
              const SizedBox(height: 12.0),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: CondoBotton("SUBMIT", onTap: () {
                          print("SUBMIT");
                        })),
                  ),
                  Expanded(
                      flex: 5,
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: CondoBotton("CANCEL", onTap: () {
                            print("CANCEL");
                          })))
                ],
              )

              // _buildButtons(),
              //   const SizedBox(height: 8.0),
              //   Expanded(child: _buildEventList()),
            ],
          ),
        ),
      ),
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      initialSelectedDay: selectedDay,
      //  events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: condoActionbarColor,
        todayColor: Colors.deepOrange[200],
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
        formatButtonTextStyle:
        TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }
}
