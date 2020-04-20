# ai_progress

![totem](https://raw.githubusercontent.com/pdliuw/pdliuw.github.io/master/images/totem_four_logo.jpg)

-----

|[English Document](https://github.com/pdliuw/ai_progress/blob/master/README_EN.md)|[中文文档](https://github.com/pdliuw/ai_progress)|
|:-|:-|

##### ai_progress 支持:

ai_progress: [![pub package](https://img.shields.io/pub/v/ai_progress.svg)](https://pub.dev/packages/ai_progress)

* 1. 圆环进度
* 2. 扇形进度
* 3. 线性进度
* 4. 步进进度
* 5. 仪表盘进度

## Effect

|iOS-ai_progress|Android-ai_progress|
|:-|:-|
|![ios](https://github.com/pdliuw/ai_progress/blob/master/example/gif/ai_progress_ios.gif)|![android](https://github.com/pdliuw/ai_progress/blob/master/example/gif/ai_progress_android.gif)|
|:-|:-|

|macOS-ai_progress|Web-ai_progress|
|:-|:-|
|![macOS](https://github.com/pdliuw/ai_progress/blob/master/example/gif/ai_progress_macOS.gif)|![web](https://github.com/pdliuw/ai_progress/blob/master/example/gif/ai_progress_web.gif)|
|:-|:-|



## 1.安装

使用当前包作为依赖库

### 1. 依赖此库

在文件 'pubspec.yaml' 中添加

[![pub package](https://img.shields.io/pub/v/ai_progress.svg)](https://pub.dev/packages/ai_progress)

```

dependencies:

  ai_progress: ^version

```

或者以下方式依赖

```
dependencies:

  # ai_progress package.
  ai_progress:
    git:
      url: https://github.com/pdliuw/ai_progress.git

```

### 2. 安装此库

你可以通过下面的命令行来安装此库

```

$ flutter pub get


```

你也可以通过项目开发工具通过可视化操作来执行上述步骤

### 3. 导入此库

现在，在你的Dart编辑代码中，你可以使用：

```

import 'package:ai_progress/ai_progress.dart';

```

## 2.使用

### 1. 圆环进度-方形帽

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


### 2. 圆环进度-圆形帽

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

### 3. 扇形进度

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


### 4. 线性进度-方形帽

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

### 5. 线性进度-圆形帽

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

### 6. 步进进度-normal

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

### 7. 步进进度-larger

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

### 8. 步进进度-圆形帽

|ai_progress: step-round|
|:-|
|![step-round](https://github.com/pdliuw/ai_progress/blob/master/example/gif/ai_progress_step-round.gif)|
|:-|

```
   
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          bottomLeft: Radius.circular(45),
                          topRight: Radius.circular(45),
                          bottomRight: Radius.circular(45),
                        )),
                      ),
                      width: 220,
                      height: 30.0,
                      child: AirStepStateProgressIndicator(
                        size: Size(150, 220),
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


### 9. 仪表盘进度-方形帽

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

### 10. 仪表盘进度-圆形帽

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

意犹未尽？[点击，查看项目示例](https://github.com/pdliuw/flutter_app_sample)


## LICENSE

    BSD 3-Clause License
    
    Copyright (c) 2020, pdliuw
    All rights reserved.


