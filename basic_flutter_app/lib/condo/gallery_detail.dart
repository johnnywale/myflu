import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:we_rate_dogs/condo/lib/model/album.dart';

import 'condo_config.dart';
import 'condo_service.dart';
import 'lib/model/album_photo.dart';

final Widget placeholder = Container(color: Colors.grey);

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class CarouselWithIndicator extends StatefulWidget {
  CarouselWithIndicator(this.album);

  final Album album;

  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;
  CondoService condoService;
  List<AlbumPhoto> photos = [];

  @override
  void initState() {
    super.initState();
    condoService = CondoService();
    condoService.jaguarApiGen
        .getAlbumApi()
        .albumAlbumIdPhotoGet(widget.album.id)
        .then((f) {
      photos = f;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    //
    if (photos.length == 0) {
      return Container();
    }

    List<Widget> child = photos.asMap().entries.map((f) {
      return Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(children: <Widget>[
            Image.network("$condoBaseUrl/${f.value.path}",
                fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  "${f.value.name}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]),
        ),
      );
    }).toList();

    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            items: child,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
          ),
          Wrap(
            children: photos.asMap().entries.map((f) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == f.key
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4)),
              );
            }).toList(),
          ),
        ]);
  }
}

class CarouselDemo extends StatelessWidget {
  CarouselDemo(this.album);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: condoActionbarColor,
          title: Text("${album.name}"),
        ),
        body: Container(
            color: Colors.grey[200],
            height: double.infinity,
            child: CarouselWithIndicator(album)));
  }
}
