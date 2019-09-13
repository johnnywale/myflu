import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'base_condo_page.dart';
import 'condo_config.dart';
import 'facility_booking.dart';
import 'lib/api/facility_api.dart';
import 'lib/model/facility.dart';

class FacilityPage extends StatefulWidget {
  @override
  FacilityPageState createState() => FacilityPageState();

  const FacilityPage({Key key}) : super(key: key);
}

class FacilityPageState extends BaseCondoPageState<FacilityPage, Facility> {
  FacilityApi facilityApi;

  @override
  void initState() {
    super.initState();
    facilityApi = condoService.jaguarApiGen.getFacilityApi();
  }

  Widget buildFacility(Facility facility) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return new FacilityBookingPage(
            facility: facility,
          );
        }));
      },
      child: Ink(
        padding: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Container(
              color: Colors.orange,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  Container(
                    child: Image.network("$condoBaseUrl/${facility.image}",
                        fit: BoxFit.contain),
                    width: double.infinity,
                  ),
                  //                ),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                            child: Text(
                              "${facility.name}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            padding: EdgeInsets.only(left: 20, bottom: 5)),
                        Container(
                          height: 11,
                          color: Color(0xff3c0e13),
                        )
                      ],
                    ),
                  ),
                ],
              )),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.14),
                      offset: Offset(0, 2),
                      blurRadius: 2,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: Offset(0, 0),
                      blurRadius: 0,
                    )
                  ]),
              child: Html(
                data: facility.description,
                padding: EdgeInsets.all(20),
              ))
        ]),
      ),
    );
  }

//  Widget buildNot() {
//    return Container(
//        height: double.infinity,
//        child: SingleChildScrollView(
//            child: Container(
//              child: Column(
//                  children: facilities.map((f) => buildFacility(f)).toList()),
//            ) //buildFacilityCard(),
//        ));
//  }

//  @override
//  Widget build(BuildContext context) {
//    return SlideTransition(
//        position: position,
//        child: ScaleTransition(
//            scale: resize,
//            child: Material(
//                color: condoBackgroundColor,
//                elevation: 16,
//                child: generate())));
//  }

  @override
  Widget buildItem(Facility facility) {
    return buildFacility(facility);
  }

  @override
  get loadAll => facilityApi.facilityGet;
}
