import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/profilef/profile/profile_bloc.dart';
import 'package:jobmingle/domin/models/user_model.dart';
import 'package:jobmingle/utils/Cutomlist.dart';
import 'package:jobmingle/utils/cutomtextformfil.dart';

// ignore: must_be_immutable
class ProssionDetails extends StatefulWidget {
  ProssionDetails({
    super.key,
    this.workstatus,
    this.currentcity,
    this.currentcategory,
    this.currentdeparment,
    this.currentindustry
  });

  String? currentcity;
  String? workstatus;
  String?currentindustry;
  String ?currentdeparment;
  String ?currentcategory;

  @override
  State<ProssionDetails> createState() => _ProssionDetailsState();
}

class _ProssionDetailsState extends State<ProssionDetails> {
  TextEditingController currentcitycontroller = TextEditingController();
  TextEditingController workstatuscontroller = TextEditingController();
  TextEditingController currentcategorycontroller = TextEditingController();
  TextEditingController currentjobrolecontroller = TextEditingController();
  TextEditingController currentdeparment = TextEditingController();
  TextEditingController currentindustry = TextEditingController();

  List<Map<String, dynamic>> filteredDepartments = [];
  List<Map<String, dynamic>> filteredCategories = [];
  
  String? _selectedIndustryValue;
  String? _selectedDepartmentValue;
  String? _selectedCategoryValue;

  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    workstatuscontroller = TextEditingController(text: widget.workstatus);
    currentcitycontroller = TextEditingController(text: widget.currentcity);
    currentcategorycontroller= TextEditingController(text: widget.currentcategory);
    currentdeparment= TextEditingController(text: widget.currentdeparment);
    currentindustry=TextEditingController(text: widget.currentindustry);
  }

  void _onIndustryChanged(String? value) {
    setState(() {
      _selectedIndustryValue = value;
      filteredDepartments = _selectedIndustryValue != null
          ? CutomMap().department[_selectedIndustryValue!] ?? []
          : [];
      filteredCategories = [];
      _selectedDepartmentValue = null;
      _selectedCategoryValue = null;
      currentindustry.text = value ?? ''; // Set the selected industry value
      currentdeparment.clear();
      currentcategorycontroller.clear();
      print('Selected Industry: $value'); // Debug statement
      print('Filtered Departments: $filteredDepartments'); // Debug statement
    });
  }

  void _onDepartmentChanged(String? value) {
    setState(() {
      _selectedDepartmentValue = value;
      _selectedCategoryValue = null;
      filteredCategories = _selectedDepartmentValue != null
          ? CutomMap().category[_selectedDepartmentValue!] ?? []
          : [];
      currentcategorycontroller.clear();
      currentdeparment.text = value ?? ''; // Set the selected department value
      print('Selected Department: $value'); // Debug statement
      print('Filtered Categories: $filteredCategories'); // Debug statement
    });
  }

  void _onCategoryChanged(String? value) {
    setState(() {
      _selectedCategoryValue = value;
      currentcategorycontroller.text = value ?? ''; // Set the selected category value
      print('Selected Category: $value'); // Debug statement
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Professional Details",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'This information is important for the employer to know you better',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Text("Job Location * (Select From The Drop-down)"),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: CustomTextFormField(
                  controller: workstatuscontroller,
                  hintText: "Enter Work Experience",
                  labeltext: "Experience",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButtonFormField<String>(
                  value: _selectedIndustryValue,
                  items: CutomMap().industries.map((industry) {
                    return DropdownMenuItem<String>(
                      value: industry,
                      child: Text(industry),
                    );
                  }).toList(),
                  onChanged: _onIndustryChanged,
                  decoration: InputDecoration(
                    labelText: 'Select current industry',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButtonFormField<String>(
                  value: _selectedDepartmentValue,
                  items: filteredDepartments.map((department) {
                    return DropdownMenuItem<String>(
                      value: department['name'].toString(), // Store the value
                      child: Text(department['name']),
                    );
                  }).toList(),
                  onChanged: _onDepartmentChanged,
                  decoration: InputDecoration(
                    labelText: 'Select current department',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButtonFormField<String>(
                  value: _selectedCategoryValue,
                  items: filteredCategories.map((category) {
                    return DropdownMenuItem<String>(
                      value: category['name'].toString(), // Store the value
                      child: Text(category['name']),
                    );
                  }).toList(),
                  onChanged: _onCategoryChanged,
                  decoration: InputDecoration(
                    labelText: 'Select roll category',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 25),
                child: CustomTextFormField(
                  controller: currentjobrolecontroller,
                  hintText: "Enter the Current Job roll",
                  labeltext: "Job roll",
                ),
              ),
              FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      errorText: state.hasError ? state.errorText : null,
                    ),
                    isEmpty: currentcitycontroller.text.isEmpty,
                    child: SelectState(
                      onCountryChanged: (value) {
                        currentcitycontroller.text = value;
                        state.didChange(value);
                      },
                      onStateChanged: (value) {
                        currentcitycontroller.text = value;
                        state.didChange(value);
                      },
                      onCityChanged: (value) {
                        currentcitycontroller.text = value;
                        state.didChange(value);
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  ),
                  SizedBox(width: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        final basicdetails = Usermodel(
                          workstatus: workstatuscontroller.text,
                          currentcity: currentcitycontroller.text,
                          currentcategory: _selectedCategoryValue ?? '',
                          currentjobrole: currentjobrolecontroller.text,
                          currentdeparment: _selectedDepartmentValue ?? '',
                          currentindustry: _selectedIndustryValue ?? '',
                        );
                        context.read<ProfileBloc>().add(Basicdetails(
                          workstatus: basicdetails.workstatus!,
                          currentcity: basicdetails.currentcity!,
                          currentcategory: basicdetails.currentcategory,
                          currentdeparment: basicdetails.currentdeparment,
                          currentindustry: basicdetails.currentindustry,
                          jonroll: basicdetails.currentjobrole,
                        ));

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Profile Successfully Updated'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Future.delayed(Duration(seconds: 2), () {
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: Text("Save"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
