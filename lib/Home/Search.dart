import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _controller = TextEditingController();
  List<String> suggestions = ['anhdeptrai', 'cute', 'handsome'];
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onChanged: (query) {},
                ),
              ),
              IconButton(
                icon: Icon(Icons.chat),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.grid_view),
                onPressed: () {},
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.location_on),
              Flexible(child: Text('Khu Vực :')),
              Container(
                width: 200.0,
                child: SearchField(
                  hint: 'ádasdasd',
                  suggestions: suggestions
                      .map((suggestion) => SearchFieldListItem(suggestion))
                      .toList(),
                  searchInputDecoration: SearchInputDecoration(
                    suffixIcon: Icon(Icons.arrow_drop_down),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white24),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white24),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.filter_alt_rounded),
              Text('Lọc'),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                width: 1,
                height: 35,
                color: Colors.grey,
              ),
              Expanded(
                child: Container(
                  width: 600.0,
                  child:
                   SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 100.0,
                          height: 50.0,
                          // margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: DropdownButton<String>(
                              value: selectedOption,
                              isExpanded: true,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedOption = newValue;
                                });
                              },
                              items: suggestions.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Container(
                          width: 100.0,
                          height: 50.0,
                          margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: DropdownButton<String>(
                              value: selectedOption,
                              isExpanded: true,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedOption = newValue;
                                });
                              },
                              items: suggestions.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Container(
                          width: 100.0,
                          height: 50.0,
                          // margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: DropdownButton<String>(
                              value: selectedOption,
                              isExpanded: true,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedOption = newValue;
                                });
                              },
                              items: suggestions.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Container(
                          width: 100.0,
                          height: 50.0,
                          margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: DropdownButton<String>(
                              value: selectedOption,
                              isExpanded: true,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedOption = newValue;
                                });
                              },
                              items: suggestions.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Text('Thuê phòng trọ >> '),
              Flexible(child: Text('Khu Vực :')),

            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  width: 600.0,
                  child:
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 100.0,
                          height: 50.0,
                          // margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: DropdownButton<String>(
                              value: selectedOption,
                              isExpanded: true,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedOption = newValue;
                                });
                              },
                              items: suggestions.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Container(
                          width: 100.0,
                          height: 50.0,
                          margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: DropdownButton<String>(
                              value: selectedOption,
                              isExpanded: true,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedOption = newValue;
                                });
                              },
                              items: suggestions.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Container(
                          width: 100.0,
                          height: 50.0,
                          // margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: DropdownButton<String>(
                              value: selectedOption,
                              isExpanded: true,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedOption = newValue;
                                });
                              },
                              items: suggestions.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Container(
                          width: 100.0,
                          height: 50.0,
                          margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: DropdownButton<String>(
                              value: selectedOption,
                              isExpanded: true,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedOption = newValue;
                                });
                              },
                              items: suggestions.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
