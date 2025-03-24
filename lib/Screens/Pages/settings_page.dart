import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Anzahl der Tabs (z.B. Sprache und Passwort ändern)
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 30, 48, 87),
          title: const Text('Einstellungen'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Sprache'),
              Tab(text: 'Passwort ändern'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Erster Tab: Spracheinstellungen
            LanguageSettings(),
            // Zweiter Tab: Passwort ändern
            PasswordChange(),
          ],
        ),
      ),
    );
  }
}

class LanguageSettings extends StatelessWidget {
  const LanguageSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'Wählen Sie eine Sprache:',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Sprache'),
            items: const [
              DropdownMenuItem(value: 'Deutsch', child: Text('Deutsch')),
              DropdownMenuItem(value: 'Englisch', child: Text('Englisch')),
              // Füge weitere Sprachen hinzu
            ],
            onChanged: (String? newValue) {
              // Hier kannst du die Sprache ändern
            },
          ),
        ],
      ),
    );
  }
}

class PasswordChange extends StatelessWidget {
  const PasswordChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'Passwort ändern:',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          TextField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Neues Passwort',
              hintText: 'Geben Sie Ihr neues Passwort ein',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Hier kannst du die Passwortänderung durchführen
            },
            child: const Text('Passwort ändern'),
          ),
        ],
      ),
    );
  }
}
