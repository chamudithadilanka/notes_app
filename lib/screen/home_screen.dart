import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note/services/database_helper.dart';
import 'package:note/utils/colors.dart';

import '../model/note_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Note> _notes = [];
  final List<Color> _noteColors = [
    Color(0xF49097),
    Color(0xDFB2F4),
    Color(0xF5E960),
    Color(0x85A1FF),
    Color(0x55D6C2),
    Color(0xEACEAA),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadNotes();
  }


  Future<void> _loadNotes()async{
    final notes = await _databaseHelper.getNotes();

    setState(() {
      _notes = notes;
    });

  }
  
  String _formatDateTime(String datTime){
    final DateTime dt = DateTime.parse(datTime);
    final now = DateTime.now();

    if(dt.year == now.year && dt.month == now.month && dt.day == now.day){
      return 'Today, ${dt.hour.toString().padLeft(2,'0')}:${dt.minute.toString().padLeft(0,'0')}';
    }
    return '${dt.day}/${dt.month}/${dt.year}, ${dt.hour.toString().padLeft(2,'0')}:${dt.minute.toString().padLeft(0,'0')}';
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainWhiteColor,
      appBar: AppBar(
        backgroundColor: kMainWhiteColor,
        title: Text("My Notes",style: TextStyle(fontWeight: FontWeight.w500),),
      )
    );

  }
}
