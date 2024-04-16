import 'package:flutter/material.dart';

class NotificationForm extends StatefulWidget {
  @override
  _NotificationFormState createState() => _NotificationFormState();
}

class _NotificationFormState extends State<NotificationForm> {
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, dynamic>> _notifications = [];

  String _title = '';
  String _body = '';
  String _recipient = '';

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final notificationData = {
        'title': _title,
        'body': _body,
        'recipient': _recipient,
      };
      _notifications.add(notificationData);
      // TODO: Integrate with the API once it's ready
      print('Saved notification: $notificationData');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Alert'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title of the alert';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _title = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Body'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter description of the alert';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _body = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Recipient Phone Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a recipient phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _recipient = value!;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: _saveForm,
                  child: Text('Save Notification'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
