import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KontakPage(),
    );
  }
}

class KontakPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Kontak"),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth > 600;

          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isDesktop ? 600 : double.infinity,
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: isDesktop
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // LEFT: INPUT
                          Expanded(child: inputSection()),

                          SizedBox(width: 20),

                          // RIGHT: LIST
                          Expanded(child: listSection()),
                        ],
                      )
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            inputSection(),
                            SizedBox(height: 20),
                            listSection(),
                          ],
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget inputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: "Nama Kontak",
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
            labelText: "Nomor HP",
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.phone,
        ),
        SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Tambah Kontak"),
          ),
        ),
      ],
    );
  }

  Widget listSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Daftar Kontak",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Big Boss"),
                subtitle: Text("08123456789"),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Byby"),
                subtitle: Text("081234567890"),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Pinjaman Online"),
                subtitle: Text("081345678901"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
