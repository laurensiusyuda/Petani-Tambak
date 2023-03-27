// ignore_for_file: unnecessary_null_comparison

import 'package:utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
// ignore_for_file: avoid_print
// ignore_for_file: unused_local_variable

class BuildMonitoringSuhu extends StatefulWidget {
  const BuildMonitoringSuhu({super.key});
  @override
  State<BuildMonitoringSuhu> createState() => _BuildMonitoringSuhuState();
}

class _BuildMonitoringSuhuState extends State<BuildMonitoringSuhu> {
  MqttServerClient? client;
  String? mqttMsg = '';
  String? lastMqttMsg;

  // membuat fungsi koneski menuju mqtt
  void connect() async {
    client = MqttServerClient.withPort(
        'broker.mqtt-dashboard.com', 'myClientIdentifier', 1883);
    client!.logging(on: true);
    client!.keepAlivePeriod = 30;
    client!.autoReconnect = true;
    client!.resubscribeOnAutoReconnect = true;
    client!.onDisconnected = onDisconnected;
    client!.onConnected = onConnected;
    try {
      await client!.connect();
      client!.subscribe('topicName/temperature', MqttQos.atMostOnce);
      client!.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
        final MqttPublishMessage receivedMessage =
            c[0].payload as MqttPublishMessage;
        final String message = MqttPublishPayload.bytesToStringAsString(
            receivedMessage.payload.message);
        setState(() {
          lastMqttMsg = mqttMsg;
          mqttMsg = message;
        });
      });
    } on Exception catch (e) {
      print('Exception: $e');
      client!.disconnect();
    }
  }

  void onDisconnected() {
    print('Client disconnected');
  }

  void onConnected() {
    print('Client connected');
  }

  @override
  void initState() {
    super.initState();
    connect();
  }

  @override
  Widget build(BuildContext context) {
    int suhu = int.tryParse(mqttMsg ?? '') ?? 0;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '');
      },
      child: Card(
        color: kSecondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kMainColor,
                  border: Border.all(
                    color: suhu != null
                        ? suhu >= 30
                            ? kRedColor
                            : suhu >= 25 && suhu <= 29
                                ? kGreenColor
                                : kYellowColor
                        : kYellowColor,
                    width: 4.0,
                  ),
                ),
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(30),
                  child: Image.asset(
                    'asset/thermometer.png',
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Suhu',
                      style: GoogleFonts.lato(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      child: mqttMsg != null
                          ? Text(
                              'Data Suhu: $suhu',
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(
                              'Data Suhu : 27\u00b0',
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
