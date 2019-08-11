import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:synchronized/synchronized.dart';

class ListAnimationController {
  Timer timer;
  var lock = new Lock();
  PublishSubject<int> _positionItem;
  List<int> fixedLengthList = [];

  ListAnimationController() {
    _positionItem = new PublishSubject<int>();
    const oneSec = const Duration(milliseconds: 50);
    timer = new Timer.periodic(oneSec, (Timer t) async {
      await check();
    });
  }

  check() async {
    List<int> publish;
    lock.synchronized(() async {
      publish = List.from(fixedLengthList, growable: false);
      fixedLengthList.clear();
    });
    for (var name in publish) {
      await new Future.delayed(const Duration(milliseconds: 200), () {
        print("publish === $name ==");
        _updatePosition(name);
      });
    }
  }


  Observable<int> get listenAnimation => _positionItem.stream;

  void _updatePosition(int position) {
    if (!_positionItem.isClosed) {
      _positionItem.add(position);
    }
  }

  dispose() {
    _positionItem.close();
    timer.cancel();
  }

  void publish(int index) async {
    print("receive data $index");
    await lock.synchronized(() async {
      fixedLengthList.add(index);
    });
  }
}
