import 'package:utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

// ignore_for_file: avoid_print
// ignore_for_file: unused_local_variable
// ignore_for_file: unnecessary_null_comparison

class BuildMonitoringPh extends StatefulWidget {
  const BuildMonitoringPh({super.key});

  @override
  State<BuildMonitoringPh> createState() => _BuildMonitoringPhState();
}

class _BuildMonitoringPhState extends State<BuildMonitoringPh> {
  MqttServerClient? client;
  String? mqttMsg = '';
  String? lastMqttMsg;

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
    return const Placeholder();
  }
}
