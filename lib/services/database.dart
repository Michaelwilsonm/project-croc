import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_croc/models/inventory_item.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference usersInventoryItems = FirebaseFirestore.instance
      .collection('inventory')
      .doc("3kiKgLAG9USIhoaj0MFIE9dmAG22")
      .collection('items');

  // will need to connect the inventory collection to the user
  // Future updateuserData(String stuff) async {
  //   return await inventoryCollection.doc(uid).set({
  //     'hired': false,
  //   });
  // }

  // Future getInventoryList() async {
  //   try {
  //     await inventoryCollection.doc('3kiKgLAG9USIhoaj0MFIE9dmAG22').get()
  //   } catch (e) {}
  // }
  // get inventory items streams

  // Inventory list from snapshot
  List<InventoryItem> _inventoryListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map(
      (doc) {
        return InventoryItem(hired: doc.data()['hired'] ?? '');
      },
    ).toList();
  }

  // get inventory items stream
  Stream<List<InventoryItem>> get inventoryItems {
    return usersInventoryItems.snapshots().map(_inventoryListFromSnapshot);
  }
}
