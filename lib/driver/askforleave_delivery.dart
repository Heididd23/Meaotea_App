import 'package:flutter/material.dart';

class LeaveRequestPage extends StatefulWidget {
  const LeaveRequestPage({super.key});

  @override
  _LeaveRequestPageState createState() => _LeaveRequestPageState();
}

class _LeaveRequestPageState extends State<LeaveRequestPage> {
  final _formKey = GlobalKey<FormState>();

  String? _leaveType;
  DateTime? _startDate;
  DateTime? _endDate;
  String? _reason;

  final List<String> leaveTypes = ['Sick Leave', 'Annual Leave', 'Personal Leave'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ask For Leave'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Request Leave',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                // Leave Type
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Leave Type'),
                  value: _leaveType,
                  items: leaveTypes.map((String leave) {
                    return DropdownMenuItem<String>(
                      value: leave,
                      child: Text(leave),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _leaveType = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a leave type';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Start Date
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Start Date'),
                  readOnly: true,
                  controller: TextEditingController(
                    text: _startDate == null
                        ? ''
                        : '${_startDate?.toLocal()}'.split(' ')[0],
                  ),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != _startDate) {
                      setState(() {
                        _startDate = picked;
                      });
                    }
                  },
                  validator: (value) {
                    if (_startDate == null) {
                      return 'Please select a start date';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // End Date
                TextFormField(
                  decoration: const InputDecoration(labelText: 'End Date'),
                  readOnly: true,
                  controller: TextEditingController(
                    text: _endDate == null
                        ? ''
                        : '${_endDate?.toLocal()}'.split(' ')[0],
                  ),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != _endDate) {
                      setState(() {
                        _endDate = picked;
                      });
                    }
                  },
                  validator: (value) {
                    if (_endDate == null) {
                      return 'Please select an end date';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Reason for Leave
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Reason'),
                  maxLines: 3,
                  onChanged: (value) {
                    setState(() {
                      _reason = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide a reason for your leave request';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Handle leave request submission logic here
                      String leaveDetails = '''
                        Leave Type: $_leaveType
                        Start Date: $_startDate
                        End Date: $_endDate
                        Reason: $_reason
                        ''';
                      print(leaveDetails); // Use the variable

                      // You can now pass the `leaveDetails` to your backend or perform necessary actions
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Leave Request Submitted')),
                      );

                      // Optionally, navigate to another screen or reset the form
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => AnotherPage()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Set background color to red
                  ),
                  child: const Text(
                    'Submit Request',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
