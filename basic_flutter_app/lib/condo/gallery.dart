import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'base_condo_page.dart';
import 'condo_config.dart';
import 'gallery_detail.dart';
import 'lib/api/album_api.dart';
import 'lib/model/album.dart';

class GalleryPage extends StatefulWidget {
  @override
  GalleryState createState() => GalleryState();

  const GalleryPage({Key key}) : super(key: key);
}

class GalleryState extends BaseCondoPageState<GalleryPage, Album> {
  AlbumApi albumApi;

  @override
  void initState() {
    super.initState();
    this.albumApi = condoService.jaguarApiGen.getAlbumApi();
  }

  @override
  Widget buildItem(Album album) {
    return Container(
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return new CarouselDemo(album);
                              }));
                            },
                            child: CachedNetworkImage(
                              fit: BoxFit.fitWidth,
                              imageUrl: "$condoBaseUrl/${album.cover.path}",
                            ))),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.only(left: 20),
                      child: Text(album.name),
                    )
                  ],
                )),
          ]),
    );
    // Image.network("$condoBaseUrl/${facility.image}"
    ;
  }

  @override
  get loadAll => albumApi.albumGet;
}
