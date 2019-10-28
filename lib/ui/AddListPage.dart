import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/model/Task.dart';

class AddListPage extends StatefulWidget {
  @override
  _AddListPageState createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  TextEditingController _listNameController = new TextEditingController();
  TextEditingController _listDetailController = new TextEditingController();
  Color pickerColor = Color(0xff6633ff);
  Color currentColor = Color(0xff6633ff);

  bool _saving = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Stack(
          children: <Widget>[
            _getToolBar(context),
            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Nova",
                                style:
                                    TextStyle(fontSize: 28, color: Colors.grey),
                              ),
                              Text(
                                "Tarefa",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal)),
                              labelText: "Nome",
                              contentPadding: EdgeInsets.only(
                                  left: 16, top: 20, right: 16, bottom: 5)),
                          controller: _listNameController,
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          keyboardType: TextInputType.text,
                          maxLength: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal)),
                              labelText: "Descrição",
                              contentPadding: EdgeInsets.only(
                                  left: 16, top: 20, right: 16, bottom: 5)),
                          controller: _listDetailController,
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          keyboardType: TextInputType.text,
                          maxLength: 50,
                        ),
                        ButtonTheme(
                          minWidth: double.infinity,
                          child: RaisedButton(
                            elevation: 3,
                            onPressed: () {
                              pickerColor = currentColor;
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                          "Selecione a cor do cartão"),
                                      content: SingleChildScrollView(
                                        child: ColorPicker(
                                          pickerColor: pickerColor,
                                          onColorChanged: (Color color) {
                                            setState(() {
                                              pickerColor = color;
                                            });
                                          },
                                          enableLabel: true,
                                          colorPickerWidth: 1000,
                                          pickerAreaHeightPercent: 0.7,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Pronto!"),
                                          onPressed: () {
                                            setState(() {
                                              currentColor = pickerColor;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: Text('COR DO CARTÃO'),
                            color: currentColor,
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: IconButton(
                                iconSize: 35,
                                icon: Icon(
                                  Icons.save,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  tasks.add(Task(_listNameController.text,
                                      _listDetailController.text, pickerColor));

                                  Navigator.of(context).pop();
                                },
                                //color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _getToolBar(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(left: 10, top: 40),
      child: BackButton(
        color: Colors.black,
      ),
    );
  }
}
