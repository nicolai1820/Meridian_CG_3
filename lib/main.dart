import 'package:flutter/material.dart';

bool compareJson(dynamic json1, dynamic json2) {
  if (json1 == json2) {
    return true;
  }

  if (json1.runtimeType != json2.runtimeType) {
    return false;
  }

  if (json1 is Map) {
    if (json1.length != json2.length) {
      return false;
    }

    for (var key in json1.keys) {
      if (!json2.containsKey(key) || !compareJson(json1[key], json2[key])) {
        return false;
      }
    }

    return true;
  } else if (json1 is List) {
    if (json1.length != json2.length) {
      return false;
    }

    for (var i = 0; i < json1.length; i++) {
      if (!compareJson(json1[i], json2[i])) {
        return false;
      }
    }

    return true;
  } else {
    return json1 == json2;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comparación de Objetos',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Comparación de Objetos'),
        ),
        body: Center(
          child: JSONComparation(),
        ),
      ),
    );
  }
}

class JSONComparation extends StatelessWidget {
  final Map<String, dynamic> json1 = {
    "type": "FeatureCollection",
    "features": [
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "LineString",
          "coordinates": [
            [-80.85937499999999, -1.0546279422758742],
            [-71.3671875, 6.664607562172573],
            [-60.1171875, 13.239945499286312]
          ]
        }
      }
    ]
  };

  final Map<String, dynamic> json2 = {
    "type": "FeatureCollection",
    "features": [
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "LineString",
          "coordinates": [
            [-80.85937499999999, -1.0546279422758742],
            [-71.3671875, 6.664607562172573],
            [-60.1171875, 13.239945499286312]
          ]
        }
      }
    ]
  };

  @override
  Widget build(BuildContext context) {
    final result = compareJson(json1, json2);

    return Center(
      child: Text('Los objetos JSON son iguales? $result'),
    );
  }
}
