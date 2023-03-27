import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
// ignore_for_file: avoid_print
// ignore_for_file: library_private_types_in_public_api

class MqttDataDisplaySuhu extends StatefulWidget {
  const MqttDataDisplaySuhu({super.key});

  @override
  _MqttDataDisplayState createState() => _MqttDataDisplayState();
}

class _MqttDataDisplayState extends State<MqttDataDisplaySuhu> {
  MqttServerClient? client;
  String? mqttMsg = '';
  String? lastMqttMsg;
  @override
  void initState() {
    super.initState();
    connect();
  }

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
          // menerima data last mqtt  yang tersambung
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
  Widget build(BuildContext context) {
    return Container(
      child: mqttMsg != null
          ? Text(
              'Data Suhu: $mqttMsg',
              style: GoogleFonts.lato(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
          : Container(
              child: lastMqttMsg != null
                  ? Text(
                      'Data Suhu: $lastMqttMsg',
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
    );
  }
}
