import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'creatics_tv/tv_home_screen.dart';

const channel = BasicMessageChannel<dynamic>('flutter/gamepadtouchevent', JSONMessageCodec());

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppleTVGestureHandler().init();
  bool isAppleTV = (String.fromEnvironment('TARGET_PLATFORM') == 'TVOS');
  runApp(const MyApp());

  RawKeyboard.instance.addListener((event) {
    if ((LogicalKeyboardKey.backspace == event.logicalKey) || (LogicalKeyboardKey.escape == event.logicalKey)) {
      exit(0); // not the correct way to close / minimize it
    }
  });
}

class AppleTVGestureHandler {
  static AppleTVGestureHandler? _instance;

  factory AppleTVGestureHandler() => _instance ??= AppleTVGestureHandler._();

  num swipeStartX = 0.0;
  num swipeStartY = 0.0;
  bool isMoving = false;
  static const gamePadChannelName = 'flutter/gamepadtouchevent';

  //static const keyEventChannelName = 'flutter/keyevent';
  static const codec = JSONMessageCodec();

  static const channel = BasicMessageChannel<dynamic>(gamePadChannelName, codec);

  //static const channel_key = BasicMessageChannel<dynamic>(keyEventChannelName, codec);

  AppleTVGestureHandler._();

  void init() {
    channel.setMessageHandler(_onMessage);

    // (< flutter 1.26) Workarround for the fact that ios (and therefore also AppleTV) does not support keyboards and
    // therefor do not handle key events for ios in the Focusmanger in the flutter library (outside the scope of the engine)
    HardwareKeyboard.instance.addHandler((event) {
      if (event.runtimeType == RawKeyUpEvent) {
        if (LogicalKeyboardKey.arrowLeft == event.logicalKey) {
          _moveLeft();
          return true;
        } else if (LogicalKeyboardKey.arrowRight == event.logicalKey) {
          _moveRight();
          return true;
        } else if (LogicalKeyboardKey.arrowUp == event.logicalKey) {
          _moveUp();
          return true;
        } else if (LogicalKeyboardKey.arrowDown == event.logicalKey) {
          _moveDown();
          return true;
        } else if ((LogicalKeyboardKey.enter == event.logicalKey) || (LogicalKeyboardKey.select == event.logicalKey)) {
          return true;
        } else if ((LogicalKeyboardKey.backspace == event.logicalKey) ||
            (LogicalKeyboardKey.escape == event.logicalKey)) {
          ByteData message = const JSONMethodCodec().encodeMethodCall(const MethodCall('popRoute'));
          ServicesBinding.instance.defaultBinaryMessenger.handlePlatformMessage('flutter/navigation', message, (_) {});
          return true;
        }
      } else if (event.runtimeType == RawKeyDownEvent) {
        if ((LogicalKeyboardKey.enter == event.logicalKey) || (LogicalKeyboardKey.select == event.logicalKey)) {
          return true;
        }
      }
      return false;
    });
  }

// Using "FocusManager.instance.primaryFocus.focusInDirection" is a workarround because ios target does not handle key presses in flutter focusmanager. Ideally we would send key events!
// In the future when ios does support, the code needs to be update to simulate the key press. At that point also key codes sent need to be validated corrected in the code below!

  void _moveUp() {
    FocusManager.instance.primaryFocus?.focusInDirection(TraversalDirection.up);
  }

  void _moveDown() {
    FocusManager.instance.primaryFocus?.focusInDirection(TraversalDirection.down);
  }

  void _moveLeft() {
    FocusManager.instance.primaryFocus?.focusInDirection(TraversalDirection.left);
  }

  void _moveRight() {
    FocusManager.instance.primaryFocus?.focusInDirection(TraversalDirection.right);
  }

  Future<void> _onMessage(dynamic arguments) async {
    num x = arguments['x'];
    num y = arguments['y'];
    String type = arguments['type'];

    if (type == 'started') {
      swipeStartX = x;
      swipeStartY = y;
      isMoving = true;
    } else if (type == 'move') {
      if (isMoving) {
        var moveX = swipeStartX - x;
        var moveY = swipeStartY - y;

        // need to move min distance in any direction
        // the 150px needs tweaking and might needs to be variable based on location of the widget on screen and duration/time of the movement to make it smoother
        if ((moveX.abs() >= 150) || (moveY.abs() >= 150)) {
          // determine direction horz/vert
          if (moveX.abs() >= moveY.abs()) {
            if (moveX >= 0) {
              _moveLeft();
            } else {
              _moveRight();
            }
          } else {
            if (moveY >= 0) {
              _moveUp();
            } else {
              _moveDown();
            }
          }
          // reset start point (direction could change based on next cooordinates received)
          swipeStartX = x;
          swipeStartY = y;
        }
      }
    } else if (type == 'ended') {
      isMoving = false;
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const TvHomeScreen(),
      ),
    );
  }
}
