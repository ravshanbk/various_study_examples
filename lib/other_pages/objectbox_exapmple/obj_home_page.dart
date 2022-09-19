import 'dart:async';

import 'package:exapmles/objectbox.g.dart';
import 'package:exapmles/other_pages/objectbox_exapmple/box/my_object_box.dart';
import 'package:exapmles/other_pages/objectbox_exapmple/models/shop_order.dart';
import 'package:exapmles/other_pages/objectbox_exapmple/order_data_table.dart';
import 'package:exapmles/routes/rout_names.dart';
import 'package:exapmles/services/navigator_service.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as pp;
import 'package:path/path.dart' as p;

class ObjectBoxNextPage extends StatefulWidget {
  const ObjectBoxNextPage({Key? key}) : super(key: key);

  @override
  State<ObjectBoxNextPage> createState() => _ObjectBoxNextPageState();
}

class _ObjectBoxNextPageState extends State<ObjectBoxNextPage> {
  final Faker faker = Faker();
  late Store _store;
  bool hasBeenInitialized = false;
  late Customer _customer;
  late Stream<List<ShopOrder>> _stream;
  @override
  void initState() {
    super.initState();
    setNewCustomer();
    _store = MyObjectbox.store;

    setState(() {
      _stream = _store
          .box<ShopOrder>()
          .query()
          .watch(triggerImmediately: true)
          .map((q) => q.find());
      hasBeenInitialized = true;
    });
  }

  @override
  void dispose() {
    // _store.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: !hasBeenInitialized
          ? _indecator("Store has not been initialized!")
          : StreamBuilder<List<ShopOrder>>(
              stream: _stream,
              builder: (context, AsyncSnapshot<List<ShopOrder>> snapshot) {
                if (!snapshot.hasData) {
                  return _indecator("Snapshot has no data!");
                }
                return OrderDataTable(
                  store: _store,
                  orders: snapshot.data!,
                  onSort: (int columnIndex, bool ascending) {
                    final newQueryBuilder = _store.box<ShopOrder>().query();
                    final sortField =
                        columnIndex == 0 ? ShopOrder_.id : ShopOrder_.price;
                    newQueryBuilder.order(
                      sortField,
                      flags: ascending ? 0 : Order.descending,
                    );
                    setState(
                      () {
                        _stream =
                            newQueryBuilder.watch(triggerImmediately: true).map(
                                  (q) => q.find(),
                                );
                      },
                    );
                  },
                );
              },
            ),
    );
  }

  Widget _indecator(String v) {
    return Center(
      child: Column(
        children: [
          Text(
            v,
            textAlign: TextAlign.center,
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
         NavigatorService.pushNamedAndRemoveUntil(RouteName.OBJECTBOX);
        },
      ),
      title: const Text("Object Box App"),
      actions: [
        IconButton(
          onPressed: setNewCustomer,
          icon: const Icon(
            Icons.person_add_alt,
          ),
        ),
        IconButton(
          onPressed: addFakeOrderForCurrentCustomer,
          icon: const Icon(
            Icons.attach_money,
          ),
        ),
      ],
    );
  }

  void setNewCustomer() {
    String name = faker.person.name();
    _customer = Customer(
      name: name,
    );

    print("Name: $name");
  }

  addFakeOrderForCurrentCustomer() {
    final order = ShopOrder(price: faker.randomGenerator.integer(500, min: 10));
    print("Customer id: ==> ${_customer.id}");
    order.customer.target = _customer;
    _store.box<ShopOrder>().put(order);
    print("Price: ${faker.randomGenerator.integer(500, min: 10)}");
  }
}
