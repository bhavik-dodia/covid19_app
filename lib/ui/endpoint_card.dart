import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:covid19_app/services/api.dart';
import 'package:flutter/material.dart';

class EndpointCardData {
  EndpointCardData(this.title, this.assetName, this.color);

  final String title;
  final String assetName;
  final Color color;
}

class EndpointCard extends StatelessWidget {
  const EndpointCard({Key key, this.endpoint, this.value}) : super(key: key);

  final Endpoint endpoint;
  final int value;

  static Map<Endpoint, EndpointCardData> _cardsData = {
    Endpoint.cases: EndpointCardData('Cases', 'assets/count.png', Colors.blue),
    Endpoint.casesSuspected: EndpointCardData(
        'Suspected Cases', 'assets/suspect.png', Colors.orangeAccent),
    Endpoint.casesConfirmed: EndpointCardData(
        'Confirmed Cases', 'assets/fever.png', Colors.purpleAccent),
    Endpoint.deaths:
        EndpointCardData('Deaths', 'assets/death.png', Colors.redAccent),
    Endpoint.recovered:
        EndpointCardData('Recovered', 'assets/patient.png', Colors.greenAccent),
  };

  String get formattedValue {
    if (value == null) return '';
    return NumberFormat('#,##,##,###').format(value);
  }

  @override
  Widget build(BuildContext context) {
    final cardData = _cardsData[endpoint];
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardData.title,
              style: TextStyle(fontSize: 20.0, color: cardData.color),
            ),
            SizedBox(
              height: 5.0,
            ),
            SizedBox(
              height: 55.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(cardData.assetName, color: cardData.color),
                  Text(
                    formattedValue,
                    style: TextStyle(
                        fontSize: 30.0,
                        color: cardData.color,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
