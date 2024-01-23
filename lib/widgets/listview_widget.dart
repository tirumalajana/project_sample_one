import 'package:flutter/material.dart';
import 'package:project_sample/components/textfrom_field.dart';

import '../models/answersoptions_model.dart';

class Listviewscreen extends StatefulWidget {
  final List<AnswersOptions> listData;
  final String questions;
  Listviewscreen({
    super.key,
    required this.questions,
    required this.listData,
  });

  @override
  State<Listviewscreen> createState() => _ListviewscreenState();
}

class _ListviewscreenState extends State<Listviewscreen> {
  TextEditingController _answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      elevation: 0,
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            title: Text(widget.questions),
          ),
          // Divider(),
          ListView.builder(
            itemCount: widget.listData.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return CheckboxListTile(
                value: widget.listData[index].isSelected,
                controlAffinity: ListTileControlAffinity.leading,
                dense: true,
                activeColor: Colors.blue,
                onChanged: (bool? value) {
                  setState(() {
                    widget.listData.forEach((element) {
                      element.isSelected = false;
                      _answerController.text = element.answer;
                    });
                    final val = widget.listData[index].answer;
                      _answerController.text = val;
                    widget.listData[index].isSelected = value!;
                  });
                },
                title: Text(widget.listData[index].answer),
              );
            },
          ),
          AppInputTextfieldscreen(
            controller: _answerController,
            validator: (value) {
              if (value == false) {
                return 'Required.';
              }
            },
          ),
        ],
      ),
    );
  }
}
// var questiondata=[
//   [
// {
// "question":"*1.What is the name of the largest ocean in the world?",
// "options":[
// {
// "1":'Indian Ocean',
// "2":'Arctic Ocean',
// "3":'North Atlantic Ocean',
// "4":'others',
// }
// ],
// "selected":1,
// },
// {
// "question":"*2.Who is the current Prime Minister of India?",
// "options":[
// {
// "1":'Narendra Modi',
// "2":'Jawahar Lal Nehru',
// "3":'Gulzarilal Nanda',
// "4":'Lal Bahadur Shastri',
// "5":'others',
// }
// ],
// "selected":1,
// },
// {
// "question":"*3.When was India’s independence day?",
// "options":[
// {
// "1":'15 August 1947',
// "2":'15 August 1957',
// "3":'15 August 1967',
// "4":'15 August 1937',
// "5":'others',
// }
// ],
// "selected":1,
// },
// {
// "question":"*4.What is the current GDP of India?",
// "options":[
// {
// "1":'10.4 trillion USD',
// "2":'10.3 trillion USD',
// "3":'11.4 trillion USD',
// "4":'11.3 trillion USD',
// "5":'others'
// }
// ],
// "selected":1,
// },
// {
// "question":"*5.What is the capital of India?",
// "options":[
// {
// "1":'New Delhi',
// "2":'Hyderabad',
// "3":'Bangalore',
// "4":'Kolkata',
// "5":'others',
// }
// ],
// "selected":1,
// }
// ]
// ];
