import 'package:flutter/material.dart';
import 'database_helper.dart';

class EditStudentPage extends StatefulWidget {
  final int id;
  final String name;
  final String nim;
  final String address;
  final String hobby;

  EditStudentPage({
    required this.id,
    required this.name,
    required this.nim,
    required this.address,
    required this.hobby,
  });

  @override
  _EditStudentPageState createState() => _EditStudentPageState();
}

class _EditStudentPageState extends State<EditStudentPage> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String nim;
  late String address;
  late String hobby;

  @override
  void initState() {
    super.initState();
    name = widget.name;
    nim = widget.nim;
    address = widget.address;
    hobby = widget.hobby;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Biodata Mahasiswa'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: name,
                decoration: InputDecoration(labelText: 'Nama'),
                onSaved: (value) => name = value!,
              ),
              TextFormField(
                initialValue: nim,
                decoration: InputDecoration(labelText: 'NIM'),
                onSaved: (value) => nim = value!,
              ),
              TextFormField(
                initialValue: address,
                decoration: InputDecoration(labelText: 'Alamat'),
                onSaved: (value) => address = value!,
              ),
              TextFormField(
                initialValue: hobby,
                decoration: InputDecoration(labelText: 'Hobi'),
                onSaved: (value) => hobby = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await DatabaseHelper.instance.updateStudent(widget.id, {
                      'name': name,
                      'nim': nim,
                      'address': address,
                      'hobby': hobby,
                    });
                    Navigator.pop(context);
                  }
                },
                child: Text('Simpan Perubahan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
