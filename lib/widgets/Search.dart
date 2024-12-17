import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:student_lite/Model/Phong.dart';
import 'package:student_lite/widgets/AppBar.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();


}

class _SearchState extends State<Search> {

  List<String> suggestions = ['anhdeptrai', 'cute', 'handsome'];
  String? selectedOption;
  String getDistrict(String address) {
    final parts = address.split(',').map((e) => e.trim()).toList();
    return parts.isNotEmpty ? parts.first : '';
  }

  String getProvince(String address) {
    final parts = address.split(',').map((e) => e.trim()).toList();
    return parts.length > 1 ? parts.last : '';
  }
  Set<String> getProvinces(List<Phong> phongList) {
    return phongList.map((phong) {
      final addressParts = (phong.address ?? '').split(',').map((e) => e.trim()).toList();
      return addressParts.isNotEmpty ? addressParts.last : '';
    }).toSet();
  }


  @override
  Widget build(BuildContext context) {
    Set<String> getProvinces(List<Phong> phongList) {
      return phongList.map((phong) => getProvince(phong.address ?? '')).toSet();
    }

    List<Phong> filterByProvince(List<Phong> phongList, String selectedProvince) {
      return phongList.where((phong) => getProvince(phong.address ?? '') == selectedProvince).toList();
    }

    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: CustomAppBar(onSearchSubmitted: (String ) {  },))
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
