// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:alwafeer/features/homepage/pay_bills/presentation/screens/pay_bill_screen.dart';
import 'package:flutter/material.dart';

class PayBillItem extends StatelessWidget {
  final String title;
  final String icon;
  final List<String> children;
  const PayBillItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: Colors.purple,
      iconColor: Colors.purple,
      title: _buildTitle(title),
      leading: _buildLeading(icon),
      children: _buildChildren(context, children),
    );
  }

  List<InkWell> _buildChildren(BuildContext context, List<String> children) {
    return children
        .map(
          (e) => InkWell(
            onTap: () {
              Navigator.pushNamed(context, PayBillScreen.routeName,
                  arguments: {'billType': e});
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 0.5,
                    color: Colors.grey.shade200,
                  ),
                  bottom: BorderSide(
                    width: 0.5,
                    color: Colors.grey.shade200,
                  ),
                ),
              ),
              child: ListTile(
                title: Text(e),
                leading: const SizedBox(),
              ),
            ),
          ),
        )
        .toList();
  }

  SizedBox _buildLeading(String icon) {
    return SizedBox(
      width: 30,
      height: 30,
      child: Image.asset(icon),
    );
  }

  Text _buildTitle(String title) {
    return Text(
      title,
      style: const TextStyle(color: Colors.black),
    );
  }
}
