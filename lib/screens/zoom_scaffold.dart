import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ZoomScaffold extends StatefulWidget {
  final Widget menuScreen;
  final Widget contentScreen;
  final String title;

  ZoomScaffold({this.menuScreen, this.contentScreen, this.title});

  @override
  _ZoomScaffoldState createState() => new _ZoomScaffoldState();
}

class _ZoomScaffoldState extends State<ZoomScaffold> with TickerProviderStateMixin {
  Curve interval = new Interval(0.0, 1.0, curve: Curves.linear);

  createContentDisplay() {
    return zoomAndSlideContent(
      new Container(
        child: new Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: new AppBar(
            backgroundColor: Color(0xff21254A),
            elevation: 0.0,
            leading: new IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  Provider.of<MenuController>(context, listen: false).toggle();
                }),
            title: Text(widget.title, textAlign: TextAlign.center),
            centerTitle: true,
          ),
          body: GestureDetector(
            onPanUpdate: (details) {
              //on swiping left
              if (details.delta.dx < -3) {
                Provider.of<MenuController>(context, listen: false).close();
              } else if (details.delta.dx > 3) {
                Provider.of<MenuController>(context, listen: false).open();
              }
            },
            child: widget.contentScreen,
          ),
        ),
      ),
    );
  }

  zoomAndSlideContent(Widget content) {
    var slidePercent, scalePercent;

    switch (Provider.of<MenuController>(context, listen: true).state) {
      case MenuState.closed:
        slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MenuState.open:
        slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MenuState.opening:
        slidePercent = interval.transform(Provider.of<MenuController>(context, listen: true).percentOpen);
        scalePercent = interval.transform(Provider.of<MenuController>(context, listen: true).percentOpen);
        break;
      case MenuState.closing:
        slidePercent = interval.transform(Provider.of<MenuController>(context, listen: true).percentOpen);
        scalePercent = interval.transform(Provider.of<MenuController>(context, listen: true).percentOpen);
        break;
    }

    final slideAmount = 275.0 * slidePercent;
    final contentScale = 1.0 - (0.24 * scalePercent);
    final cornerRadius = 30.0 * Provider.of<MenuController>(context, listen: true).percentOpen;

    return new Transform(
      transform: new Matrix4.translationValues(slideAmount, 0.0, 0.0)..scale(contentScale, contentScale),
      alignment: Alignment.centerLeft,
      child: new Container(
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(cornerRadius),
          boxShadow: [
            new BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 2.0),
              blurRadius: 12.0,
              spreadRadius: 8.0,
            ),
          ],
        ),
        child: new ClipRRect(borderRadius: new BorderRadius.circular(cornerRadius), child: content),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
//          color: Colors.black,
          child: Scaffold(
            body: widget.menuScreen,
          ),
        ),
        createContentDisplay()
      ],
    );
  }
}

class ZoomScaffoldMenuController extends StatefulWidget {
  final ZoomScaffoldBuilder builder;

  ZoomScaffoldMenuController({
    this.builder,
  });

  @override
  ZoomScaffoldMenuControllerState createState() {
    return new ZoomScaffoldMenuControllerState();
  }
}

class ZoomScaffoldMenuControllerState extends State<ZoomScaffoldMenuController> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(context, Provider.of<MenuController>(context, listen: true));
  }
}

typedef Widget ZoomScaffoldBuilder(BuildContext context, MenuController menuController);

//class Layout {
//  final WidgetBuilder contentBuilder;
//
//  Layout({
//    this.contentBuilder,
//  });
//}

class MenuController extends ChangeNotifier {
  final TickerProvider vsync;
  final AnimationController _animationController;
  MenuState state = MenuState.closed;

  MenuController({
    this.vsync,
  }) : _animationController = new AnimationController(vsync: vsync) {
    _animationController
      ..duration = const Duration(milliseconds: 220)
      ..addListener(() {
        notifyListeners();
      })
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            state = MenuState.opening;
            break;
          case AnimationStatus.reverse:
            state = MenuState.closing;
            break;
          case AnimationStatus.completed:
            state = MenuState.open;
            break;
          case AnimationStatus.dismissed:
            state = MenuState.closed;
            break;
        }
        notifyListeners();
      });
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  get percentOpen {
    return _animationController.value;
  }

  open() {
    _animationController.forward();
  }

  close() {
    _animationController.reverse();
  }

  toggle() {
    if (state == MenuState.open) {
      close();
    } else if (state == MenuState.closed) {
      open();
    }
  }
}

enum MenuState {
  closed,
  opening,
  open,
  closing,
}
