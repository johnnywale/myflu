import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:we_rate_dogs/movie/actions/Adapt.dart';
import 'package:we_rate_dogs/movie/actions/imageurl.dart';
import 'package:we_rate_dogs/movie/generated/i18n.dart';
import 'package:we_rate_dogs/movie/models/combinedcredits.dart';
import 'package:we_rate_dogs/movie/models/enums/imagesize.dart';
import 'package:shimmer/shimmer.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    KnownForState state, Dispatch dispatch, ViewService viewService) {
  Widget _buildCastCell(CastData d) {
    return Container(
      key: ValueKey(d.id),
      margin: EdgeInsets.only(left: Adapt.px(20)),
      width: Adapt.px(240),
      height: Adapt.px(400),
      child: Card(
        shape:
            RoundedRectangleBorder(side: BorderSide(color: Colors.grey[100])),
        elevation: 1.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeInImage.assetNetwork(
              fit: BoxFit.cover,
              width: Adapt.px(240),
              height: Adapt.px(342),
              placeholder: 'images/CacheBG.jpg',
              image: ImageUrl.getUrl(
                  d.poster_path ?? '/eIkFHNlfretLS1spAcIoihKUS62.jpg',
                  ImageSize.w300),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: Adapt.px(15), left: Adapt.px(20), right: Adapt.px(20)),
              child: Text(
                d.title ?? d.name,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black, fontSize: Adapt.px(26)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerCell() {
    return SizedBox(
      width: Adapt.px(240),
      height: Adapt.px(480),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[200],
        highlightColor: Colors.grey[100],
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.grey[200],
              width: Adapt.px(240),
              height: Adapt.px(342),
            ),
            Container(
              height: Adapt.px(24),
              margin: EdgeInsets.fromLTRB(0, Adapt.px(15), Adapt.px(20), 0),
              color: Colors.grey[200],
            ),
            Container(
              height: Adapt.px(24),
              margin: EdgeInsets.fromLTRB(
                  0, Adapt.px(5), Adapt.px(50), Adapt.px(20)),
              color: Colors.grey[200],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKnownForCell() {
    if (state.cast.length > 0)
      return Container(
        height: Adapt.px(480),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: state.cast.take(8).map(_buildCastCell).toList(),
        ),
      );
    else
      return Container(
        height: Adapt.px(480),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(
              width: Adapt.px(30),
            ),
            _buildShimmerCell(),
            SizedBox(
              width: Adapt.px(20),
            ),
            _buildShimmerCell(),
            SizedBox(
              width: Adapt.px(20),
            ),
            _buildShimmerCell(),
          ],
        ),
      );
  }

  return AnimatedSwitcher(
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      duration: Duration(milliseconds: 600),
      child: Container(
        key: ValueKey(state.cast),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: Adapt.px(30), right: Adapt.px(30)),
              child: Text(
                I18n.of(viewService.context).knownFor,
                softWrap: true,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Adapt.px(40)),
              ),
            ),
            SizedBox(
              height: Adapt.px(10),
            ),
            _buildKnownForCell(),
          ],
        ),
      ));
}
