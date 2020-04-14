# ai_progress

![totem](https://raw.githubusercontent.com/pdliuw/pdliuw.github.io/master/images/totem_four_logo.jpg)

-----

|[English Document](https://github.com/pdliuw/ai_progress/blob/master/README_EN.md)|[中文文档](https://github.com/pdliuw/ai_progress)|
|:-|:-|

##### ai_progress Support:

ai_progress: [![pub package](https://img.shields.io/pub/v/ai_progress.svg)](https://pub.dev/packages/ai_progress)

* 1. circular progress
* 2. arc progress
* 3. linear progress
* 4. step progress

## Effect

|iOS-ai_progress|Android-ai_progress|
|:-|:-|
|![ios](https://github.com/pdliuw/ai_progress/blob/master/example/gif/ai_progress_ios.gif)|![android](https://github.com/pdliuw/ai_progress/blob/master/example/gif/ai_progress_android.gif)|
|:-|:-|

|macOS-ai_progress|Web-ai_progress|
|:-|:-|
|![macOS](https://github.com/pdliuw/ai_progress/blob/master/example/gif/ai_progress_macOS.gif)|![web](https://github.com/pdliuw/ai_progress/blob/master/example/gif/ai_progress_web.gif)|
|:-|:-|



## 1.Installing

Use this package as a library

### 1. Depend on it

Add this to your package's pubspec.yaml file:

[![pub package](https://img.shields.io/pub/v/ai_progress.svg)](https://pub.dev/packages/ai_progress)

```

dependencies:

  ai_progress: ^version

```

Or depending on

```
dependencies:

  # ai_progress plugin.
  ai_progress:
    git:
      url: https://github.com/pdliuw/ai_progress.git

```

### 2. Install it

You can install packages from the command line:

with Flutter:


```

$ flutter pub get


```

Alternatively, your editor might support flutter pub get. Check the docs for your editor to learn more.

### 3. Import it

Now in your Dart code, you can use:

```

import 'package:ai_progress/ai_progress.dart';


```

## 2.Usage

### 1. circular progress-square cap

|ai_progress: circular-square|
|:-|
|![circular-square](https://github.com/pdliuw/ai_progress/blob/master/example/gif/ai_progress_circular-square.gif)|
|:-|


```
    
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 150,
                  padding: EdgeInsets.all(5),
                  child: CircularProgressIndicator(
                    value: _segmentValue / 10,
                    strokeWidth: 10.0,
                    valueColor: _colorTween,
                  ),
                ),
                Text("${_segmentValue / 10 * 100}%"),
              ],
            ),
    
```


### 2. circular progress-round cap

|ai_progress: circular-round|
|:-|
|![circular-round](https://github.com/pdliuw/ai_progress/blob/master/example/gif/ai_progress_circular-round.gif)|
|:-|


```
    
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 150,
                      padding: EdgeInsets.all(5),
                      child: AirCircularStateProgressIndicator(
                        size: Size(150, 150),
                        value: _segmentValue / 10 * 100, //1~100
                        pathColor: Colors.white,
                        valueColor:
                            ColorTween(begin: Colors.grey, end: Colors.blue)
                                .transform(_segmentValue / 10),
                        pathStrokeWidth: 10.0,
                        valueStrokeWidth: 10.0,
                        useCenter: false,
                        filled: false,
                      ),
                    ),
                    Text("${_segmentValue / 10 * 100}%"),
                  ],
                ),
    
```


### 3. arc progress

|ai_progress: circular-arc|
|:-|
|![circular-arc](https://github.com/pdliuw/ai_progress/blob/master/example/gif/ai_progress_circular-arc.gif)|
|:-|


```
    
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 150,
                      padding: EdgeInsets.all(5),
                      child: AirCircularStateProgressIndicator(
                        size: Size(150, 150),
                        value: _segmentValue / 10 * 100, //1~100
                        pathColor: Colors.white,
                        valueColor:
                            ColorTween(begin: Colors.grey, end: Colors.blue)
                                .transform(_segmentValue / 10),
                        pathStrokeWidth: 10.0,
                        valueStrokeWidth: 10.0,
                        useCenter: true,
                        filled: true,
                      ),
                    ),
                    Text("${_segmentValue / 10 * 100}%"),
                  ],
                ),
    
```


### 4. linear progress-square

|ai_progress: linear-square|
|:-|
|![linear-square](https://github.com/pdliuw/ai_progress/blob/master/example/gif/ai_progress_linear-square.gif)|
|:-|


```
    
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 150,
                      padding: EdgeInsets.all(5),
                      child: LinearProgressIndicator(
                        value: _segmentValue / 10,
                        valueColor: _colorTween,
                      ),
                    ),
                    Text("${_segmentValue / 10 * 100}%"),
                  ],
                ),
    
```


### 5. linear progress-round

|ai_progress: linear-round|
|:-|
|![linear-round](https://github.com/pdliuw/ai_progress/blob/master/example/gif/ai_progress_linear-round.gif)|
|:-|



```
    
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 50,
                          padding: EdgeInsets.all(5),
                          child: AirLinearStateProgressIndicator(
                            size: Size(150, 150),
                            value: _segmentValue / 10 * 100, //1~100
                            valueColor:
                                ColorTween(begin: Colors.grey, end: Colors.blue)
                                    .transform(_segmentValue / 10),
                            pathStrokeWidth: 10.0,
                            valueStrokeWidth: 10.0,
                            roundCap: true,
                          ),
                        ),
                        Text("${_segmentValue / 10 * 100}%"),
                      ],
                    ),
    
```


### 6. step progress-normal

|ai_progress: step-normal|
|:-|
|![step-normal](https://github.com/pdliuw/ai_progress/blob/master/example/gif/ai_progress_step-normal.gif)|
|:-|


```

    
                    Row(
                      children: [
                        Container(
                          width: 90,
                          height: 50,
                          padding: EdgeInsets.all(0),
                          child: AirStepStateProgressIndicator(
                            size: Size(150, 150),
                            stepCount: _segmentChildren.length,
                            stepValue: _segmentValue,
                            valueColor:
                                ColorTween(begin: Colors.grey, end: Colors.blue)
                                    .transform(_segmentValue / 10),
                            pathStrokeWidth: 10.0,
                            valueStrokeWidth: 10.0,
                          ),
                        ),
                        Text("${_segmentValue / 10 * 100}%"),
                      ],
                    ),
    
```


### 7. step progress-larger

|ai_progress: step-larger|
|:-|
|![step-larger](https://github.com/pdliuw/ai_progress/blob/master/example/gif/ai_progress_step-larger.gif)|
|:-|


```
   
                   Row(
                     children: [
                       Container(
                         width: 250,
                         height: 50,
                         padding: EdgeInsets.all(0),
                         child: AirStepStateProgressIndicator(
                           size: Size(150, 150),
                           stepCount: _segmentChildren.length,
                           stepValue: _segmentValue,
                           valueColor:
                               ColorTween(begin: Colors.grey, end: Colors.blue)
                                   .transform(_segmentValue / 10),
                           pathStrokeWidth: 30.0,
                           valueStrokeWidth: 30.0,
                         ),
                       ),
                       Text("${_segmentValue / 10 * 100}%"),
                     ],
                   ), 
    
```

### 8. Dashboard-square

|ai_progress: dashboard-square|
|:-|
|![dashboard-square](https://github.com/pdliuw/ai_progress/blob/master/example/gif/ai_progress_dashboard-square.gif)|
|:-|

```
   
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 150,
                      padding: EdgeInsets.all(5),
                      child: AirDashboardStateProgressIndicator(
                        size: Size(150, 150),
                        value: _segmentValue / 10 * 100, //1~100
                        valueColor:
                            ColorTween(begin: Colors.grey, end: Colors.blue)
                                .transform(_segmentValue / 10),
                        pathStrokeWidth: 10,
                        valueStrokeWidth: 10,
                        gapDegree: 60,
                        roundCap: false,
                      ),
                    ),
                    Text("${_segmentValue / 10 * 100}%"),
                  ],
                ),
    
```

### 9. Dashboard-round

|ai_progress: dashboard-round|
|:-|
|![dashboard-round](https://github.com/pdliuw/ai_progress/blob/master/example/gif/ai_progress_dashboard-round.gif)|
|:-|

```
   
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 150,
                      padding: EdgeInsets.all(5),
                      child: AirDashboardStateProgressIndicator(
                        size: Size(150, 150),
                        value: _segmentValue / 10 * 100, //1~100
                        valueColor:
                            ColorTween(begin: Colors.grey, end: Colors.blue)
                                .transform(_segmentValue / 10),
                        pathStrokeWidth: 10,
                        valueStrokeWidth: 10,
                        gapDegree: 60,
                        roundCap: true,
                      ),
                    ),
                    Text("${_segmentValue / 10 * 100}%"),
                  ],
                ),
    
```


want to look more?[Click me，Look more](https://github.com/pdliuw/flutter_app_sample)


## LICENSE

    BSD 3-Clause License
    
    Copyright (c) 2020, pdliuw
    All rights reserved.


