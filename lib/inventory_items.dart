import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/inventory_item.dart';

class InventoryItems extends StatefulWidget {
  @override
  _InventoryItemsState createState() => _InventoryItemsState();
}

class _InventoryItemsState extends State<InventoryItems> {
  Widget _itemTile(InventoryItem item) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: item.hired ? Colors.redAccent : Colors.greenAccent,
          ),
          title: item.hired ? Text("Hired") : Text('Available'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final inventoryItems = Provider.of<List<InventoryItem>>(context);

    return ListView.builder(
      itemCount: inventoryItems.length,
      itemBuilder: (context, index) {
        return _itemTile(inventoryItems[index]);
      },
    );
  }
}
