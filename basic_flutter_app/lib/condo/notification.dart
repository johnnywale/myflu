import 'dart:async';

import 'package:flutter/material.dart';
import 'package:progress_hud/progress_hud.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'base_condo_page.dart';
import 'child_updatable.dart';
import 'condo_config.dart';
import 'lib/api/article_api.dart';
import 'lib/model/article.dart';
import 'lib/model/paged_article.dart';

class NotificationPage extends StatefulWidget {
  @override
  NotificationPageState createState() => NotificationPageState();

  const NotificationPage({Key key}) : super(key: key);
}

class NotificationPageState
    extends BaseCondoPageState<NotificationPage, Article> {
  ArticleApi articleApi;

  @override
  void initState() {
    super.initState();

    articleApi = condoService.jaguarApiGen.getArticleApi();
  }

  Color canceledColor = Color(0xffcccccc);

  Widget buildFacilityBooking() {}

//  @override
//  Widget build(BuildContext context) {
//    return SlideTransition(
//        position: position,
//        child: ScaleTransition(
//            scale: resize,
//            child: Material(
//                color: condoBackgroundColor,
//                elevation: 16,
//                child: Container(
//                    height: double.infinity,
//                    width: MediaQuery.of(context).size.width,
//                    child: SingleChildScrollView(
//                      child: buildFacilityBooking(),
//                    )))));
//  }

  Future<List<Article>> articleGet() {
    Future<PagedArticle> future =
        articleApi.articleGet(1, 999, null, null, null);
    var completer = new Completer<List<Article>>.sync();
    future.then((onValue) {
      completer.complete(onValue.data);
    }).catchError((onError) {
      completer.completeError(onError);
    });
    return completer.future;
  }

  @override
  Widget buildItem(Article facility) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: () {
          print("||");
        },

        child: Container(
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 0.5, color: canceledColor))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Ink(
                  color: condoBackgroundColor,
                  child: Ink(
                    decoration: BoxDecoration(
                      color: condoBackgroundColor,
                    ),
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          width: 300,
                          child: Text(
                            facility.title,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        RichText(
                            text: TextSpan(
                                text: 'Fri Nov 24 2017 GMT+0800',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xfffbb041),
                                )),
                            textDirection: TextDirection.rtl),
                      ],
                    ),
                  )),
              Icon(
                Icons.arrow_forward_ios,
                color: condoActionbarColor,
              )
            ],
          ),
        ),
//        ),
      ),
    );
  }

  @override
  get loadAll => articleGet;
}
