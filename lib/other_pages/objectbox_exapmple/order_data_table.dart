import 'package:exapmles/objectbox.g.dart';
import 'package:exapmles/other_pages/objectbox_exapmple/models/shop_order.dart';
import 'package:flutter/material.dart';

class OrderDataTable extends StatefulWidget {
  final List<ShopOrder> orders;
  final Store store;

  final void Function(int columnIndex, bool ascending) onSort;
  const OrderDataTable({
    required this.store,
    required this.orders,
    Key? key,
    required this.onSort,
  }) : super(key: key);

  @override
  State<OrderDataTable> createState() => _OrderDataTableState();
}

class _OrderDataTableState extends State<OrderDataTable> {
  bool _sortAscending = true;
  int _sortColumnIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: DataTable(
          sortColumnIndex: _sortColumnIndex,
          sortAscending: _sortAscending,
          columns: [
            DataColumn(
              label: const Text("Number"),
              onSort: _onDataColumnSort,
            ),
            const DataColumn(
              label: Text("Customer"),
            ),
            DataColumn(label: const Text("Price"), onSort: _onDataColumnSort),
            DataColumn(
              label: Container(),
            ),
          ],
          rows: widget.orders.map((order) {
            return DataRow(
              cells: [
                DataCell(Text("${order.id}")),
                DataCell(
                  Text(order.customer.target?.name ?? "None"),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Material(
                            child: ListView(
                                children: order.customer.target!.orders
                                    .map((_) => ListTile(
                                          title: Text(
                                            "${_.id}  ${_.customer.target!.name}  \$${_.price}",
                                          ),
                                        ))
                                    .toList()),
                          );
                        });
                  },
                ),
                DataCell(
                  Text(
                    "\$${order.price}",
                  ),
                ),
                DataCell(const Icon(Icons.delete), onTap: () {
                  widget.store.box<ShopOrder>().remove(order.id);
                }),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  void _onDataColumnSort(int columnIndex, bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
    widget.onSort(columnIndex, ascending);
  }
}
