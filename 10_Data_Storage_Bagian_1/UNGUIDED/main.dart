import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'add_data.dart';
import 'edit_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Biodata Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: StudentListPage(),
    );
  }
}

class StudentListPage extends StatefulWidget {
  @override
  _StudentListPageState createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  late Future<List<Map<String, dynamic>>> students;

  @override
  void initState() {
    super.initState();
    refreshStudents();
  }

  void refreshStudents() {
    setState(() {
      students = DatabaseHelper.instance.getStudents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Biodata Mahasiswa'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: students,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan saat memuat data.'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Belum ada data mahasiswa.'));
          }

          final data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(data[index]['name'],
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('NIM: ${data[index]['nim']}'),
                      Text('Alamat: ${data[index]['address']}'),
                      Text('Hobi: ${data[index]['hobby']}'),
                    ],
                  ),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) async {
                      if (value == 'edit') {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditStudentPage(
                              id: data[index]['id'],
                              name: data[index]['name'],
                              nim: data[index]['nim'],
                              address: data[index]['address'],
                              hobby: data[index]['hobby'],
                            ),
                          ),
                        );
                        refreshStudents();
                      } else if (value == 'delete') {
                        await DatabaseHelper.instance
                            .deleteStudent(data[index]['id']);
                        refreshStudents();
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'edit',
                        child: Text('Edit'),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Text('Hapus'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddStudentPage()),
          );
          refreshStudents();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
