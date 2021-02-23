import 'package:doughrise/widgets/account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plaid_flutter/plaid_flutter.dart';

class Accounts extends StatefulWidget {
  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  var newPublicToken;
  List<Account> accounts = [];
  final clientID = "5f30775e6f6fee0012b2633e";
  final secret = "288be1258ca905ad7426ea51da0ccb";
  final userID = "user_good";

  openPlaidLink() async {
    var headers = {
      'Content-Type': 'application/json',
    };

    var data =
        '{ "client_id": "$clientID", "secret": "$secret", "user": { "client_user_id": "$userID" }, "client_name": "DoughRise", "products": ["auth"], "country_codes": ["US"], "language": "en", "webhook": "https://sample-web-hook.com", "account_filters": { "depository": { "account_subtypes": ["checking"] } } }';

    var res = await http.post('https://sandbox.plaid.com/link/token/create', headers: headers, body: data);
    if (res.statusCode != 200) {
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    }
    print(res.body);

    Map<String, dynamic> responseJson = json.decode(res.body);
    final responseLinkToken = responseJson['link_token'];

    LinkConfiguration linkTokenConfiguration =
        LinkConfiguration(token: responseLinkToken);

    final _plaidLink = PlaidLink(
      configuration: linkTokenConfiguration,
      onSuccess: _onSuccessCallback,
      onEvent: _onEventCallback,
      onExit: _onExitCallback,
    );

    _plaidLink.open();
  }

  void _onSuccessCallback(String publicToken, LinkSuccessMetadata metadata) {
    print("onSuccess: $publicToken, metadata: ${metadata.description()}");
    final String institution = metadata.institution.name;
    Account account = Account(bankName: institution);
    if (this.mounted)
      setState(() {
        accounts.add(account);
      });
  }

  void _onEventCallback(String event, LinkEventMetadata metadata) {
    print("onEvent: $event, metadata: ${metadata.description()}");
  }

  void _onExitCallback(LinkError error, LinkExitMetadata metadata) {
    print("onExit metadata: ${metadata.description()}");

    if (error != null) {
      print("onExit error: ${error.description()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: 'Settings',
        middle: Text('Accounts', style: TextStyle(fontWeight: FontWeight.w700)),
        trailing: CupertinoButton(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.add),
          onPressed: () => openPlaidLink(),
        ),
      ),
      child: _buildAccounts(),
    );
  }

  _buildAccounts() {
    return SafeArea(
      child: Column(
        children: accounts,
      ),
    );
  }
}
