import 'package:flutter/material.dart';
import 'package:skillboxdemo/extension_validation.dart';

import '../commonClasses.dart';
import 'logic.dart';

class NumberSixView extends StatefulWidget {
  final String title;

  const NumberSixView({Key? key, required this.title}) : super(key: key);

  @override
  State<NumberSixView> createState() => _NumberSixViewState();
}

class _NumberSixViewState extends State<NumberSixView> {
  final _controllerX = TextEditingController();
  final _controllerY = TextEditingController();
  final _controllerZ = TextEditingController();
  double distance = 0;
  bool isValidateX = false;
  bool isValidateY = false;
  bool isValidateZ = false;
  double squareTriangle = 0;

  List<MyPoint> points = [];

  void findDistance() {
    distance = MyPoint(x: points.first.x, y: points.first.y, z: points.first.z).distanceTo(points.last);
    setState(() {});
  }

  void validateX(String s) {
    isValidateX = s.isFloat();
    setState(() {});
  }

  void validateY(String s) {
    isValidateY = s.isFloat();
    setState(() {});
  }

  void validateZ(String s) {
    isValidateZ = s.isFloat();
    setState(() {});
  }

  void findSquare() {
    squareTriangle =
        MyPoint(x: points[0].x, y: points[0].y, z: points[0].z).triangleSquare(points[1], points[2]);
    setState(() {});
  }

  void addPoint() {
    distance = 0;
    squareTriangle = 0;
    points.add(MyPoint(
        x: double.parse(_controllerX.text == '' ? '0' : _controllerX.text),
        y: double.parse(_controllerY.text == '' ? '0' : _controllerY.text),
        z: double.parse(_controllerZ.text == '' ? '0' : _controllerZ.text)));
    _controllerX.clear();
    _controllerY.clear();
    _controllerZ.clear();
    setState(() {});
  }

  void deletePoint() {
    distance = 0;
    squareTriangle = 0;
    points.removeLast();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: points.length == 2 ? findDistance : null,
                      child: const Text('Найти расстояние')),
                  ElevatedButton(
                      onPressed: points.length == 3 ? findSquare : null, child: const Text('Найти площадь')),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed:
                      (points.length < 3 && isValidateX && isValidateY && isValidateZ) ? addPoint : null,
                  child: const Text('Добавить точку')),
              ElevatedButton(
                  onPressed: points.isNotEmpty ? deletePoint : null, child: const Text('Удалить точку')),
              Row(
                children: [
                  const Text('X='),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: MyFormField(
                        isValid: isValidateX,
                        validation: validateX,
                        controller: _controllerX,
                        hintText: 'Input X',
                      )),
                  const Text('Y='),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: MyFormField(
                        isValid: isValidateY,
                        validation: validateY,
                        controller: _controllerY,
                        hintText: 'Input Y',
                      )),
                  const Text('Z='),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: MyFormField(
                        isValid: isValidateZ,
                        validation: validateZ,
                        controller: _controllerZ,
                        hintText: 'Input Z',
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              points.isNotEmpty
                  ? Wrap(
                      spacing: 10,
                      children: [
                        ...List.generate(
                            points.length,
                            (index) => SizedBox(
                                width: 150,
                                child: NumbersView(
                                  point: points[index],
                                )))
                      ],
                    )
                  : const SizedBox(),
              Text('Расстояние между точками : ${distance.toStringAsFixed(2)}'),
              Text('Площадь треугольника : ${squareTriangle.toStringAsFixed(2)}'),
            ],
          ),
        ),
      ),
    );
  }
}
