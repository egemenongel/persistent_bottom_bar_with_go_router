import 'package:flutter/material.dart';

/// The details screen for either the A or B screen.
class DetailsView extends StatefulWidget {
  /// Constructs a [DetailsView].
  const DetailsView({
    required this.label,
    super.key,
  });

  /// The label to display in the center of the screen.
  final String label;

  @override
  State<StatefulWidget> createState() => DetailsViewState();
}

/// The state for DetailsScreen
class DetailsViewState extends State<DetailsView> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen - ${widget.label}'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Details for ${widget.label} - Counter: $_counter',
                style: Theme.of(context).textTheme.titleLarge),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              child: const Text('Increment counter'),
            ),
          ],
        ),
      ),
    );
  }
}
