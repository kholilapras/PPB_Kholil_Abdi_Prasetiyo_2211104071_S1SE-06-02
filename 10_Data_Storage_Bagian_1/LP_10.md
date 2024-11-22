<div align="center">

**LAPORAN PRAKTIKUM**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**PERTEMUAN 10**  
**DATA STORAGE (BAGIAN 1)**


<img src="https://github.com/user-attachments/assets/8ffbc3d9-1f18-4a72-8723-692ba5757f0c" alt="Logo_Telkom_University" width="25%">


**Disusun Oleh**:  
Kholil Abdi Prasetiyo / 2211104071  
SISE-06-02

**Asisten Praktikum**:  
Muhammad Faza Zulian Gesit Al Barru  
Aisyah Hasna Aulia

**Dosen Pengampu**:  
Yudha Islami Sulistya, S.Kom., M.Cs

**PROGRAM STUDI S1 SOFTWARE ENGINEERING**  
**FAKULTAS INFORMATIKA**  
**TELKOM UNIVERSITY PURWOKERTO**  
**2024**
</div>

---
# GUIDED

## 1. Pengenalan SQLite
SQLite adalah database relasional yang merupakan penyimpanan data secara offline untuk sebuah mobile app (pada local storage, lebih tepatnya pada cache memory aplikasi). SQLite memiliki CRUD (create, read, update dan delete).


## 2. SQL Helper Dasar
Dalam Flutter, SQL Helper biasanya merujuk pada penggunaan paket seperti sqflite untuk mengelola database SQLite. SQL Helper merupakan class untuk membuat beberapa method yang berkaitan dengan perubahan data. sqflite adalah plugin Flutter yang memungkinkan untuk melakukan operasi CRUD (Create, Read, Update, Delete) pada database SQLite.


## Praktikum

#### Konfigurasi

Tambahkan package sqflite & path pada file pubspec.yaml  
![image](https://github.com/user-attachments/assets/3c3d3a95-368d-4e90-8cfb-d5d77f9de570)

#### lib/helper/db_helper.dart
```dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    {
      _database = await _initDatabase();
      return _database!;
    }
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'my_prakdatabase.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE my_table(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title TEXT,
    description TEXT,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)
    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('my_table', row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await database;
    return await db.query('my_table');
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await database;
    int id = row['id'];
    return await db.update('my_table', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await database;
    return await db.delete('my_table', where: 'id = ?', whereArgs: [id]);
  }
}
```

#### lib/view/my_db_view.dart
```dart
import 'package:flutter/material.dart';
import 'package:prak10_ppb/helper/db_helper.dart';

class MyDatabaseView extends StatefulWidget {
  const MyDatabaseView({super.key});

  @override
  State<MyDatabaseView> createState() => _MyDatabaseViewState();
}

class _MyDatabaseViewState extends State<MyDatabaseView> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _dbData = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _refreshData() async {
    final data = await dbHelper.queryAllRows();
    setState(() {
      _dbData = data;
    });
  }

  void _addData() async {
    await dbHelper.insert({
      'title': _titleController.text,
      'description': _descriptionController.text,
    });
    _titleController.clear();
    _descriptionController.clear();
    _refreshData();
  }

  void _updateData(int id) async {
    await dbHelper.update({
      'id': id,
      'title': _titleController.text,
      'description': _descriptionController.text,
    });
    _titleController.clear();
    _descriptionController.clear();
    _refreshData();
  }

  void _deleteData(int id) async {
    await dbHelper.delete(id);
    _refreshData();
  }

  void _showEditDialog(Map<String, dynamic> item) {
    _titleController.text = item['title'];
    _descriptionController.text = item['description'];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Data'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _updateData(item['id']);
                Navigator.of(context).pop();
              },
              child: const Text('Update'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Praktikum Database - sqflite'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _addData,
            child: const Text('Add Data'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _dbData.length,
              itemBuilder: (context, index) {
                final item = _dbData[index];
                return ListTile(
                  title: Text(item['title']),
                  subtitle: Text(item['description']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          _showEditDialog(item);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteData(item['id']),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
```

#### lib/main.dart
```dart
import 'package:flutter/material.dart';
import 'package:prak10_ppb/view/my_db_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyDatabaseView(),
    );
  }
}
```

#### Output
![Screenshot_2024-11-22-12-38-52-42_9803d94677cbadff63d2ad58f77ae0e0](https://github.com/user-attachments/assets/c6a3b9d0-9c43-456d-a6f8-94e7e2cca1df)

![Screenshot_2024-11-22-12-38-58-49_9803d94677cbadff63d2ad58f77ae0e0](https://github.com/user-attachments/assets/15266b05-b865-4d35-aca7-ad6149ccef99)

#### Deskripsi
- db_helper.dart  
  berisi implementasi kelas DatabaseHelper, sebuah singleton untuk mempermudah pengelolaan database. Kelas ini menyediakan metode seperti insert, queryAllRows, update, dan delete untuk operasi CRUD pada tabel.
  Beberapa metode disediakan untuk mengelola data di tabel:
  - insert(Map<String, dynamic> row): Menyisipkan baris baru ke tabel.
  - queryAllRows(): Mengambil semua data dari tabel.
  - update(Map<String, dynamic> row): Memperbarui data berdasarkan id.
  - delete(int id): Menghapus data berdasarkan id.
- my_db_view.dart
  terdapat implementasi antarmuka pengguna yang memanfaatkan DatabaseHelper. Data ditampilkan dalam bentuk daftar (ListView), di mana setiap item memiliki tombol untuk mengedit atau menghapusnya. Selain itu, terdapat input teks dan tombol untuk menambah data baru ke dalam database.
- main.dart
  adalah titik awal aplikasi, yang memuat widget utama MyApp. Widget ini menggunakan widget MyDatabaseView sebagai tampilan utama aplikasi.

# UNGUIDED

## Tugas Mandiri
1. Buatlah sebuah project aplikasi Flutter dengan SQLite untuk menyimpan data biodata mahasiswa yang terdiri dari nama, NIM, domisili, dan hobi. Data yang dimasukkan melalui form akan ditampilkan dalam daftar di halaman utama. Alur Aplikasi:  
a) Form Input: Buat form input untuk menambahkan biodata mahasiswa, dengan kolom:  
   - Nama  
   - Nim  
   - Alamat  
   - Hobi  
b) Tampilkan Daftar Mahasiswa: Setelah data berhasil ditambahkan, tampilkan daftar semua data mahasiswa yang sudah disimpan di halaman utama.  
c) Implementasikan fitur Create (untuk menyimpan data mahasiswa) dan Read (untuk menampilkan daftar mahasiswa yang sudah disimpan). 
  
d) Contoh output:  
![image](https://github.com/user-attachments/assets/b8096fda-fdb7-418b-83b4-69b2e955f090)



#### Konfigurasi
Tambahkan package sqflite & path pada file pubspec.yaml  
![image](https://github.com/user-attachments/assets/3c3d3a95-368d-4e90-8cfb-d5d77f9de570)


#### Source Code
lib/database_helper.dart
```dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('students.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE students (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        nim TEXT,
        address TEXT,
        hobby TEXT
      )
    ''');
  }

  Future<int> addStudent(Map<String, dynamic> student) async {
    final db = await instance.database;
    return db.insert('students', student);
  }

  Future<List<Map<String, dynamic>>> getStudents() async {
    final db = await instance.database;
    return db.query('students');
  }

  Future<int> updateStudent(int id, Map<String, dynamic> student) async {
    final db = await instance.database;
    return db.update(
      'students',
      student,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteStudent(int id) async {
    final db = await instance.database;
    return db.delete(
      'students',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
```

lib/add_data.dart
```dart
import 'package:flutter/material.dart';
import 'database_helper.dart';

class AddStudentPage extends StatefulWidget {
  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String nim = '';
  String address = '';
  String hobby = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Biodata Mahasiswa'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama'),
                onSaved: (value) => name = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'NIM'),
                onSaved: (value) => nim = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Alamat'),
                onSaved: (value) => address = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Hobi'),
                onSaved: (value) => hobby = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await DatabaseHelper.instance.addStudent({
                      'name': name,
                      'nim': nim,
                      'address': address,
                      'hobby': hobby,
                    });
                    Navigator.pop(context);
                  }
                },
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

lib/edit_data.dart
```dart
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
```

lib/main.dart
```dart
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
```

#### Output
![Screenshot_2024-11-22-17-26-56-33_3133f7d517c5ece376a47d7b347f711a](https://github.com/user-attachments/assets/158d205b-9f6c-4fdf-ac71-8cce7dfca758)

![Screenshot_2024-11-22-17-28-00-56_3133f7d517c5ece376a47d7b347f711a](https://github.com/user-attachments/assets/8f8a6c00-ab94-40da-b8e5-5f29aa82f8f3)

![Screenshot_2024-11-22-17-28-09-74_3133f7d517c5ece376a47d7b347f711a](https://github.com/user-attachments/assets/f61b52d8-6922-4239-9f58-3fcbc9401971)

![Screenshot_2024-11-22-17-28-14-34_3133f7d517c5ece376a47d7b347f711a](https://github.com/user-attachments/assets/4dbd3846-14ba-466f-8402-358b8c0fe64e)

#### Deskripsi
- main.dart  
  Fungsi utama:  
  Menyediakan halaman utama untuk menampilkan daftar mahasiswa.  
  Memanfaatkan widget FutureBuilder untuk memuat data mahasiswa dari database.  
  Menyediakan tombol Tambah (+) menggunakan FloatingActionButton untuk membuka halaman tambah mahasiswa.  
  Menyediakan menu popup Edit dan Hapus pada setiap mahasiswa menggunakan PopupMenuButton.  
  Navigasi:  
  Membuka halaman tambah mahasiswa (AddStudentPage) untuk menambahkan data.  
  Membuka halaman edit mahasiswa (EditStudentPage) untuk mengedit data.  
  Database:  
  Memanggil metode refreshStudents untuk memperbarui daftar mahasiswa setelah operasi tambah, edit, atau hapus.  
- database_helper.dart  
  Fungsi utama:  
  Mengatur koneksi dan operasi pada database SQLite.  
  Membuat tabel students dengan kolom: id, name, nim, address, dan hobby.  
  Metode CRUD:  
  addStudent: Menambahkan data mahasiswa ke database.  
  getStudents: Mengambil semua data mahasiswa dari database.  
  updateStudent: Memperbarui data mahasiswa berdasarkan id.  
  deleteStudent: Menghapus data mahasiswa berdasarkan id.  
- add_data.dart  
  Fungsi utama:  
  Menyediakan halaman untuk menambahkan data mahasiswa baru.  
  Komponen:  
  Form input dengan 4 field: Nama, NIM, Alamat, dan Hobi.  
  Tombol Simpan untuk menyimpan data mahasiswa ke database.  
  Aksi:  
  Data yang dimasukkan dalam form akan dikirim ke database melalui metode addStudent pada DatabaseHelper.edit_student.dart  
- edit_data.dart  
  Fungsi utama :  
  Menyediakan halaman untuk mengedit data mahasiswa yang sudah ada.  
  Komponen:  
  Form input yang sudah diisi dengan data mahasiswa saat ini (menggunakan parameter yang dikirim dari main.dart).  
  Tombol Simpan Perubahan untuk memperbarui data mahasiswa di database.  
  Aksi:  
  Memanggil metode updateStudent pada DatabaseHelper untuk memperbarui data di database.  
