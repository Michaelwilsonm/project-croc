import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_croc/models/inventory_item.dart';
import 'package:project_croc/services/database.dart';
import 'package:provider/provider.dart';

import 'common/drawer.dart';
import 'common/app_tool_bar.dart';
import 'inventory_items.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<InventoryItem>>.value(
      initialData: null,
      value: DatabaseService().inventoryItems,
      child: Scaffold(
        appBar: AppToolBar(),
        drawer: MainDrawer(),
        body: InventoryItems(),
      ),
    );
  }
}
