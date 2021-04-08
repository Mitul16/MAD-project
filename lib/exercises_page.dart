import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mad_app/simple_button.dart';
import 'package:mad_app/exercise.dart';

String userInput = '';
TextEditingController textEditingController = TextEditingController();
bool isDataRead = false;

final ExerciseModel exerciseModel = ExerciseModel();

class ExercisesPage extends StatefulWidget {
  ExercisesPage({Key key}) : super(key: key) {
    if (!isDataRead) {
      exerciseModel.readData();
      isDataRead = true;
    }
  }

  @override
  _ExercisesPageState createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  void update() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    exerciseModel.addListener(update);
  }

  @override
  void dispose() {
    exerciseModel.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Exercises - ${exerciseModel.getExerciseCount()}'),
            SimpleButton(
              icon: Icons.add,
              onTap: () {
                textEditingController = TextEditingController();

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Add an exercise',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Comfortaa',
                          ),
                        ),
                      ),
                      content: Wrap(
                        alignment: WrapAlignment.center,
                        runSpacing: 16,
                        children: <Widget>[
                          Material(
                            borderRadius: BorderRadius.circular(8),
                            child: TextField(
                              minLines: 1,
                              maxLines: 4,
                              maxLength: 256,
                              maxLengthEnforced: true,
                              controller: textEditingController,
                              onChanged: (current) {
                                userInput = current;
                              },
                              style: TextStyle(
                                fontFamily: 'Shadows Into Light Two',
                                fontSize: 24,
                              ),
                            ),
                          ),
                          FloatingActionButton.extended(
                            label: Text(
                              'Save',
                              style: TextStyle(
                                color: Theme.of(context).brightness == Brightness.light ?
                                Colors.black : Colors.white,
                              ),
                            ),
                            icon: Icon(
                              Icons.check,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              if (userInput.isNotEmpty) {
                                exerciseModel.addExercise(Exercise(userInput, false));
                                userInput = '';
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
        leading: ClipOval(
          child: Material(
            color: Theme.of(context).primaryColor,
            child: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        ),
      ),
      body: exerciseModel.isEmpty() ? Center(
        child: Text(
          'Add an exercise',
          style: TextStyle(
            fontSize: 32,
            fontFamily: 'Shadows Into Light Two',
          ),
        ),
      ) : ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemCount: exerciseModel.getExerciseCount(),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Ink(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(8),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {
                        textEditingController.value = TextEditingValue.fromJSON({'text': exerciseModel.getExercise(index).value});
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  'Viewing exercise',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'Comfortaa',
                                  ),
                                ),
                              ),
                              content: Wrap(
                                alignment: WrapAlignment.center,
                                runSpacing: 8,
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(8),
                                    child: TextField(
                                      minLines: 1,
                                      maxLines: 4,
                                      readOnly: true,
                                      controller: textEditingController,
                                      style: TextStyle(
                                        decoration: exerciseModel.getExercise(index).checked ? TextDecoration.lineThrough : TextDecoration.none,
                                        fontFamily: 'Shadows Into Light Two',
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        exerciseModel.getExercise(index).value,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: 4,
                        style: TextStyle(
                          fontSize: 24,
                          decoration: exerciseModel.getExercise(index).checked ? TextDecoration.lineThrough : TextDecoration.none,
                          fontFamily: 'Shadows Into Light Two',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SimpleButton(
                          icon: Icons.edit,
                          onTap: () {
                            userInput = exerciseModel.getExercise(index).value;
                            textEditingController.value = TextEditingValue.fromJSON({'text': exerciseModel.getExercise(index).value});
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoAlertDialog(
                                  title: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Editing exercise',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: 'Comfortaa',
                                      ),
                                    ),
                                  ),
                                  content: Wrap(
                                    alignment: WrapAlignment.center,
                                    runSpacing: 8,
                                    children: <Widget>[
                                      Material(
                                        borderRadius: BorderRadius.circular(8),
                                        child: TextField(
                                          minLines: 1,
                                          maxLines: 4,
                                          maxLength: 256,
                                          maxLengthEnforced: true,
                                          controller: textEditingController,
                                          onChanged: (current) {
                                            userInput = current;
                                          },
                                          style: TextStyle(
                                            fontFamily: 'Shadows Into Light Two',
                                            fontSize: 24,
                                          ),
                                        ),
                                      ),
                                      FloatingActionButton.extended(
                                        label: Text(
                                          'Save',
                                          style: TextStyle(
                                            color: Theme.of(context).brightness == Brightness.light ?
                                            Colors.black : Colors.white,
                                          ),
                                        ),
                                        icon: Icon(
                                          Icons.check_circle,
                                          color: Theme.of(context).iconTheme.color,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          if (userInput.isNotEmpty) {
                                            exerciseModel.editExercise(index, userInput);
                                            userInput = '';
                                          }
                                          else {
                                            // ask for confirmation
                                            exerciseModel.removeExercise(index);
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        SimpleButton(
                          icon: exerciseModel.getExercise(index).checked ? Icons.check_circle : Icons.radio_button_unchecked,
                          onTap: () {
                            exerciseModel.toggleExerciseCheckedMark(index);
                          },
                        ),
                        SimpleButton(
                          icon: Icons.delete,
                          onTap: () {
                            // ask for confirmation
                            exerciseModel.removeExercise(index);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
