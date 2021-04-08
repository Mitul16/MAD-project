import 'package:flutter/material.dart';
import 'package:mad_app/simple_button.dart';
import 'package:mad_app/utils.dart';

class ItemWidget extends StatefulWidget {
  final String name;
  final int unitCount;
  final List<String> units;
  final List<double> starts, ends;
  final List<double> unitConversionMappings;
  final ItemWidgetController controller;

  const ItemWidget({
    Key key,
    this.name = 'item',
    this.unitCount = 1,
    this.units = const <String>['units'],
    this.starts = const <double>[0],
    this.ends = const <double>[1],
    this.unitConversionMappings = const <double>[1],
    this.controller
  }) : super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState(controller);
}

class _ItemWidgetState extends State<ItemWidget> {
  double value;
  int currentUnitIndex;

  _ItemWidgetState(ItemWidgetController _controller) {
    currentUnitIndex = 0;

    if (_controller != null) {
      _controller.getConvertedValue = this.getConvertedValue;
    }
  }

  @override
  void initState() {
    super.initState();
    this.value = widget.starts[currentUnitIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      padding: EdgeInsets.all(8),
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 8,
        children: <Widget>[
          Opacity(
            opacity: 0.8,
            child: Text(
              '${widget.name}',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Shadows Into Light Two',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SimpleButton(
                icon: Icons.remove,
                size: 48,
                onTap: decrementValue,
                onTapDown: decrementValue,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,

                children: <Widget>[
                  Text(
                    '${value.toStringAsFixed(1)}',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Shadows Into Light Two',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: DropdownButton<int>(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Shadows Into Light Two',
                      ),
                      hint: Text(
                        '${widget.units[currentUnitIndex]}',
                      ),
                      items: widget.units.map((String value) {
                        return DropdownMenuItem<int>(
                          value: widget.units.indexOf(value),
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newUnitIndex) {
                        if (currentUnitIndex != newUnitIndex) {
                          setState(() {
                            value = convertValueFromTo(value, currentUnitIndex, newUnitIndex);
                            currentUnitIndex = newUnitIndex;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              SimpleButton(
                icon: Icons.add,
                size: 48,
                onTap: incrementValue,
                onTapDown: incrementValue,
              ),
            ],
          ),
          Slider(
            value: getSliderValue(),
            onChanged: (newValue) => {
              setState(() {
                value = calculateValue(newValue);
              }),
            },
          ),
        ],
      ),
    );
  }

  double getConvertedValue() => convertValueFromTo(value, currentUnitIndex, 0);

  double getSliderValue() {
    return (value - widget.starts[currentUnitIndex]) / (widget.ends[currentUnitIndex] - widget.starts[currentUnitIndex]);
  }

  double calculateValue(double t) {
    return toPrecision(widget.starts[currentUnitIndex] + (widget.ends[currentUnitIndex] - widget.starts[currentUnitIndex]) * t, 1);
  }

  double convertValueFromTo(double value, int from, int to) {
    return constrain(value * widget.unitConversionMappings[from * widget.unitCount + to],
        widget.starts[to], widget.ends[to]);
  }

  void decrementValue() {
    if (value > widget.starts[currentUnitIndex]) {
      setState(() {
        value = constrain(value - 0.1, widget.starts[currentUnitIndex], widget.ends[currentUnitIndex]);
      });
    }
  }

  void incrementValue() {
    if (value < widget.ends[currentUnitIndex]) {
      setState(() {
        value = constrain(value + 0.1, widget.starts[currentUnitIndex], widget.ends[currentUnitIndex]);
      });
    }
  }
}

class ItemWidgetController {
  double Function() getConvertedValue;
}
