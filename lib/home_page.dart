import 'package:flutter/material.dart';
import 'package:flutter_protobuf_sample/connections/json_page.dart';
import 'package:flutter_protobuf_sample/connections/method_channel_page.dart';
import 'package:flutter_protobuf_sample/connections/method_channel_pigeon_page.dart';
import 'package:flutter_protobuf_sample/connections/protobuf_page.dart';
import 'package:flutter_protobuf_sample/connections/xml_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  Widget _buildButton({
    required BuildContext context,
    required String title,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        color: Colors.blue,
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'List of possible connections:',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16.0,
              ),
              _buildButton(
                context: context,
                title: 'JSON',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const JsonPage(),
                      ),
                  );
                },
              ),
              _buildButton(
                context: context,
                title: 'XML',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const XmlPage(),
                    ),
                  );
                },
              ),
              _buildButton(
                context: context,
                title: 'Protobuf',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProtobufPage(),
                    ),
                  );
                },
              ),
              _buildButton(
                context: context,
                title: 'Method Channel',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MethodChannelPage(),
                    ),
                  );
                },
              ),
              _buildButton(
                context: context,
                title: 'Local Data',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MethodChannelPage(),
                    ),
                  );
                },
              ),
              _buildButton(
                context: context,
                title: 'Pigeon',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MethodChannelPigeonPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
