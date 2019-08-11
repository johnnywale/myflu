import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/widgets.dart' hide Action;
import 'package:we_rate_dogs/movie/actions/Adapt.dart';
import 'package:we_rate_dogs/movie/actions/apihelper.dart';
import 'package:we_rate_dogs/movie/actions/imageurl.dart';
import 'package:we_rate_dogs/movie/customwidgets/custom_stfstate.dart';
import 'package:we_rate_dogs/movie/customwidgets/gallery_photoview_wrapper.dart';
import 'package:we_rate_dogs/movie/models/enums/imagesize.dart';
import 'package:we_rate_dogs/movie/models/imagemodel.dart';
import 'package:palette_generator/palette_generator.dart';
import 'action.dart';
import 'state.dart';

Effect<TVDetailPageState> buildEffect() {
  return combineEffects(<Object, Effect<TVDetailPageState>>{
    TVDetailPageAction.action: _onAction,
    TVDetailPageAction.recommendationTapped: _onRecommendationTapped,
    TVDetailPageAction.castCellTapped: _onCastCellTapped,
    TVDetailPageAction.openMenu: _openMenu,
    TVDetailPageAction.showSnackBar: _showSnackBar,
    TVDetailPageAction.onImageCellTapped: _onImageCellTapped,
    Lifecycle.initState: _onInit,
  });
}

void _onAction(Action action, Context<TVDetailPageState> ctx) {}

Future _onInit(Action action, Context<TVDetailPageState> ctx) async {
  try {
    final ticker = ctx.stfState as CustomstfState;
    ctx.state.animationController = AnimationController(
        vsync: ticker, duration: Duration(milliseconds: 1000));
    /*var paletteGenerator = await PaletteGenerator.fromImageProvider(
          CachedNetworkImageProvider(ImageUrl.getUrl(ctx.state.posterPic, ImageSize.w300)));
      ctx.dispatch(TVDetailPageActionCreator.onsetColor(paletteGenerator));*/
    var r = await ApiHelper.getTVDetail(ctx.state.tvid,
        appendtoresponse:
            'keywords,recommendations,credits,external_ids,content_ratings');
    if (r != null) {
      ctx.dispatch(TVDetailPageActionCreator.onInit(r));
      ctx.state.animationController.forward();
    }
    var accountstate = await ApiHelper.getTVAccountState(ctx.state.tvid);
    if (accountstate != null)
      ctx.dispatch(TVDetailPageActionCreator.onSetAccountState(accountstate));
    var l = await ApiHelper.getTVReviews(ctx.state.tvid);
    if (l != null) ctx.dispatch(TVDetailPageActionCreator.onSetReviews(l));

    var k = await ApiHelper.getTVImages(ctx.state.tvid);
    if (k != null) ctx.dispatch(TVDetailPageActionCreator.onSetImages(k));
    var f = await ApiHelper.getTVVideo(ctx.state.tvid);
    if (f != null) ctx.dispatch(TVDetailPageActionCreator.onSetVideos(f));
  } on Exception catch (e) {}
}

Future _onRecommendationTapped(
    Action action, Context<TVDetailPageState> ctx) async {
  await Navigator.of(ctx.context).pushNamed('tvdetailpage',
      arguments: {'tvid': action.payload[0], 'bgpic': action.payload[1]});
}

Future _onCastCellTapped(Action action, Context<TVDetailPageState> ctx) async {
  await Navigator.of(ctx.context).pushNamed('peopledetailpage', arguments: {
    'peopleid': action.payload[0],
    'profilePath': action.payload[1],
    'profileName': action.payload[2]
  });
}

void _openMenu(Action action, Context<TVDetailPageState> ctx) {
  showModalBottomSheet(
      context: ctx.context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ctx.buildComponent('menu');
      });
}

void _showSnackBar(Action action, Context<TVDetailPageState> ctx) {
  ctx.state.scaffoldkey.currentState.showSnackBar(SnackBar(
    content: Text(action.payload ?? ''),
  ));
}

Future _onImageCellTapped(Action action, Context<TVDetailPageState> ctx) async {
  final int _index = action.payload[0];
  final List<ImageData> _images = action.payload[1];
  await Navigator.of(ctx.context).push(PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return new FadeTransition(
            opacity: animation,
            child: GalleryPhotoViewWrapper(
              imageSize: ImageSize.w400,
              galleryItems: _images,
              initialIndex: _index,
            ));
      }));
}
