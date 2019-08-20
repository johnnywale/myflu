import 'package:flutter/material.dart';

class Floating extends StatefulWidget {
  final VoidCallback onAgree;
  final VoidCallback onReject;
  final double agreeBtnRadius;
  final double rejectBtnMoveToCenter;
  final double rejectBtnHeight;
  final double rejectBtnRadius;
  final double rejectDisappear;
  final double agreeBtnMoveToCenter;
  final double agreeBtnHeight;
  final double agreeShowPercentage;

  const Floating({
    Key key,
    this.onAgree,
    this.onReject,
    this.agreeBtnRadius,
    this.rejectBtnMoveToCenter,
    this.rejectBtnHeight,
    this.rejectBtnRadius,
    this.rejectDisappear,
    this.agreeBtnMoveToCenter,
    this.agreeBtnHeight,
    this.agreeShowPercentage,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FloatingState();
  }
}

class FloatingState extends State<Floating> with TickerProviderStateMixin {
  double agreeBtnRadius;

  double rejectBtnMoveToCenter;

  double rejectBtnHeight;

  double rejectBtnRadius;

  double rejectDisappear;

  double agreeBtnMoveToCenter;

  double agreeBtnHeight;

  double agreeShowPercentage;

  @override
  void initState() {
    super.initState();
    agreeBtnRadius = widget.agreeBtnHeight;
    rejectBtnMoveToCenter = widget.rejectBtnMoveToCenter;
    rejectBtnHeight = widget.rejectBtnHeight;
    rejectBtnRadius = widget.rejectBtnRadius;
    rejectDisappear = widget.rejectDisappear;
    agreeBtnMoveToCenter = widget.agreeBtnMoveToCenter;
    agreeBtnHeight = widget.agreeBtnHeight;
    agreeShowPercentage = widget.agreeShowPercentage;
  }

  void setChanges({
    double agreeBtnRadius,
    double rejectBtnMoveToCenter,
    double rejectBtnHeight,
    double rejectBtnRadius,
    double rejectDisappear,
    double agreeBtnMoveToCenter,
    double agreeBtnHeight,
    double agreeShowPercentage,
  }) {
    bool changed = false;

    if (this.agreeBtnRadius != agreeBtnRadius) {
      this.agreeBtnRadius = agreeBtnRadius;
      changed = true;
    }

    if (this.rejectBtnMoveToCenter != rejectBtnMoveToCenter) {
      this.rejectBtnMoveToCenter = rejectBtnMoveToCenter;
      changed = true;
    }

    if (this.rejectBtnHeight != rejectBtnHeight) {
      this.rejectBtnHeight = rejectBtnHeight;
      changed = true;
    }

    if (this.rejectBtnRadius != rejectBtnRadius) {
      this.rejectBtnRadius = rejectBtnRadius;
      changed = true;
    }

    if (this.rejectDisappear != rejectDisappear) {
      this.rejectDisappear = rejectDisappear;
      changed = true;
    }

    if (this.agreeBtnMoveToCenter != agreeBtnMoveToCenter) {
      this.agreeBtnMoveToCenter = agreeBtnMoveToCenter;
      changed = true;
    }

    if (this.agreeBtnHeight != agreeBtnHeight) {
      this.agreeBtnHeight = agreeBtnHeight;
      changed = true;
    }

    if (this.agreeShowPercentage != agreeShowPercentage) {
      this.agreeShowPercentage = agreeShowPercentage;
      changed = true;
    }

    if (changed) {
      setState(() {});
    }
  }

  Widget buildReject() {
    if (agreeBtnRadius > 0) {
      return Container();
    }
    return LayoutBuilder(builder: (context, covariant) {
      return Align(
          alignment: Alignment(-1.1 + (1.1 * rejectBtnMoveToCenter),
              0.1 - rejectBtnHeight * 0.2),
          child: Container(
            child: Material(
              color: Colors.transparent,
              shadowColor: const Color(0x44000000),
              child: Container(
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.black
                      .withOpacity(0.8 - 0.8 * rejectBtnMoveToCenter),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(rejectBtnRadius * 44),
                      topLeft: Radius.circular(rejectBtnRadius * 44),
                      bottomRight: Radius.circular(44),
                      topRight: Radius.circular(44)),
                ),
                width: 88,
                height: 88,
                child: InkWell(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(44),
                        topRight: Radius.circular(44)),
                    child: Align(
                      alignment: Alignment(0.0, 0.0),
                      child: Container(
                        width: 88,
                        height: 88,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(44)),
                            border: Border.all(
                                color: rejectDisappear > 0
                                    ? Colors.white
                                    .withOpacity(1 - 0 * rejectDisappear)
                                    : Colors.transparent,
                                width: 3)),
                        child: Icon(
                          Icons.close,
                          size: 34,
                          color: Colors.white
                              .withOpacity(1 - 0.2 * rejectDisappear),
                        ),
                      ),
                    ),
                    splashColor: const Color(0x44000000),
                    radius: 400.0,
                    onTap: () {
                      if (widget.onReject != null) {
                        widget.onReject();
                      }
                    }),
              ),
            ),
          ));
    });
  }

  Widget buildApprove() {
    return Align(
      alignment:
      Alignment(1.1 - agreeBtnMoveToCenter * 1, 0.1 - agreeBtnHeight),
      child: Material(
        color: Colors.transparent,
        child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFFE5F63).withOpacity(0.9),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(44 * agreeBtnRadius),
                  bottomRight: Radius.circular(44 * agreeBtnRadius),
                  topLeft: Radius.circular(44),
                  bottomLeft: Radius.circular(44)),
            ),
            width: 88,
            height: 88,
            child: InkWell(
              onTap: () {
                if (widget.onAgree != null) {
                  widget.onAgree();
                }
              },
              radius: 400,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(44)),
                      border: Border.all(
                          color: agreeShowPercentage > 0
                              ? Colors.white
                              .withOpacity(1 - 0 * agreeShowPercentage)
                              : Colors.transparent,
                          width: 3)),
                  child: Icon(
                    Icons.done,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
              splashColor: const Color(0x44000000),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(44),
                  bottomLeft: Radius.circular(44)),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        buildReject(),
        buildApprove(),
      ],
    );
  }

  void resetReject() {
    rejectDisappear = 0.0;
    rejectBtnRadius = 0.0;
    rejectBtnHeight = 0.0;
    rejectBtnMoveToCenter = 0.0;
    setState(() {

    });
  }
}
