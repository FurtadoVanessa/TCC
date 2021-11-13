import 'package:flutter/material.dart';
import 'account_view_model.dart';

class AccountViewController extends StatefulWidget {
  final Function(ListType item) didTapItem;

  AccountViewController(this.didTapItem);

  _AccountView createState() => _AccountView();
}

class _AccountView extends State<AccountViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: new List.generate(ListType.values.length, (int index) {
        return new ListTile(
          title: new Text(ListType.values[index].title),
          onTap: () {
            widget.didTapItem(ListType.values[index]);
          },
        );
      }),
    ));
  }
}
