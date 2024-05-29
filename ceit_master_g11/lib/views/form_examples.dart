import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormExampleScreen extends StatefulWidget {
  final String name;
  const FormExampleScreen({super.key, required this.name});

  @override
  State<FormExampleScreen> createState() => _FormExampleScreenState();
}

class _FormExampleScreenState extends State<FormExampleScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  List<String> genderOptions = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Example"),
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(24),
            child: Column(children: [
              FormBuilderTextField(
                name: "fullname",
                initialValue: widget.name,
                decoration: const InputDecoration(labelText: "Full Name"),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(5),
                  FormBuilderValidators.maxLength(30),
                ]),
              ),
              FormBuilderTextField(
                  name: "email",
                  decoration: const InputDecoration(labelText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ])),
              FormBuilderTextField(
                  name: "tel",
                  decoration: const InputDecoration(labelText: "Phone"),
                  keyboardType: TextInputType.phone,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                  ])),
              FormBuilderDropdown<String>(
                name: 'gender',
                initialValue: 'Male',
                decoration: InputDecoration(
                  labelText: 'Gender',
                  suffix: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      _formKey.currentState!.fields['gender']?.reset();
                    },
                  ),
                  hintText: 'Select Gender',
                ),
                items: genderOptions
                    .map((gender) => DropdownMenuItem(
                          alignment: AlignmentDirectional.center,
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
              ),
              FormBuilderTextField(
                name: 'username',
                decoration: const InputDecoration(labelText: 'Username'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(8),
                ]),
              ),
              FormBuilderTextField(
                name: 'password',
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(8),
                  FormBuilderValidators.maxLength(40)
                ]),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    print(_formKey.currentState!.value);
                  }
                },
                child: const Text("Submit"),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
