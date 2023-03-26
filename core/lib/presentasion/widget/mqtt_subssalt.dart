import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
// ignore_for_file: avoid_print
// ignore_for_file: library_private_types_in_public_api

class MqttDataDisplay extends StatefulWidget {
  const MqttDataDisplay({super.key});

  @override
  _MqttDataDisplayState createState() => _MqttDataDisplayState();
}

class _MqttDataDisplayState extends State<MqttDataDisplay> {
  MqttServerClient? client;
  String? mqttMsg = '';

  @override
  void initState() {
    super.initState();
    connect();
  }

  void connect() async {
    client = MqttServerClient('test.mosquitto.org', '');
    client!.logging(on: true);
    client!.onDisconnected = onDisconnected;
    client!.onConnected = onConnected;

    try {
      await client!.connect();
      client!.subscribe('test/lol', MqttQos.atMostOnce);
      client!.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
        final MqttPublishMessage receivedMessage =
            c[0].payload as MqttPublishMessage;
        final String message = MqttPublishPayload.bytesToStringAsString(
            receivedMessage.payload.message);
        setState(() {
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
    return Center(
      child: Text(
        'MQTT Message: $mqttMsg',
        style: const TextStyle(fontSize: 24.0),
      ),
    );
  }
}
