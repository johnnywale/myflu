import 'package:fish_redux/fish_redux.dart';
import 'package:we_rate_dogs/movie/views/home_page/components/movie_component/component.dart';
import 'package:we_rate_dogs/movie/views/home_page/components/popular_cpmponent/component.dart';
import 'package:we_rate_dogs/movie/views/home_page/components/searchbar_component/component.dart';

import 'components/movie_component/state.dart';
import 'components/popular_cpmponent/state.dart';
import 'components/searchbar_component/state.dart';
import 'components/tv_component/component.dart';
import 'components/tv_component/state.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomePage extends Page<HomePageState, Map<String, dynamic>> {
  HomePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HomePageState>(
                adapter: null,
                slots: <String, Dependent<HomePageState>>{
                  'searchbar':SearchBarConnector()+SearchBarComponent(),
                  'moviecells':MovieCellsConnector()+MovieCellsComponent(),
                  'tvcells':TVCellsConnector()+TVCellsComponent(),
                  'popular':PopularConnector()+PopularComponent()
                }),
            middleware: <Middleware<HomePageState>>[
            ],);

}
