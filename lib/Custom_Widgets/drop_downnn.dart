import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class Drop_Down extends StatefulWidget {
  Drop_Down(TextEditingController blood_groupController);

  @override
  State<Drop_Down> createState() => _Drop_DownState();
}

class _Drop_DownState extends State<Drop_Down> {
  List<dynamic> items = [];

  String? itemsId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.items.add({"val": 1, "name": "O+"});
    this.items.add({"val": 2, "name": "O-"});
    this.items.add({"val": 3, "name": "A+"});
    this.items.add({"val": 4, "name": "A-"});
    this.items.add({"val": 5, "name": "B+"});
    this.items.add({"val": 6, "name": "B-"});
    this.items.add({"val": 7, "name": "AB+"});
    this.items.add({"val": 8, "name": "AB-"});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormHelper.dropDownWidgetWithLabel(
        context,
        "Blood Group",
        "Select Blood Group",
        this.itemsId,
        this.items,
        (onChangedVal) {
          this.itemsId = onChangedVal;
          print("Selected Country: $onChangedVal");
        },
        (onValidateVal) {
          if (onValidateVal == null) {
            return "Please Select Blood Group";
          }
          // return null;
        },
        borderRadius: 10,
        borderColor: Theme.of(context).primaryColor,
        borderFocusColor: Theme.of(context).primaryColor,
        optionValue: 'val',
        optionLabel: 'name',
      ),
    );
  }
}
