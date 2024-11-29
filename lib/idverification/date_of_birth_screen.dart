import 'package:flutter/material.dart';
import 'package:new_ventripay/idverification/id_header_widget.dart';

class DateOfBirthScreen extends StatefulWidget {
  const DateOfBirthScreen({super.key});

  @override
  State<DateOfBirthScreen> createState() => _DateOfBirthScreen();
}

class _DateOfBirthScreen extends State<DateOfBirthScreen>{
  String? _selectedMonth;
  String? _selectedDay;
  String? _selectedYear;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          IdHeaderWidget(percentage: 30.0),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16.0,),
                const Text(
                  "Date of Birth (as it appears on your Official ID)",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(height: 16.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInputField(
                      value: _selectedMonth,
                      label: "Month",
                      items: List.generate(
                        12, (index) => "${index + 1}".padLeft(2, "0"),
                      ),
                      onChanged: (value){
                        setState(() {
                          _selectedMonth = value;
                        });
                      },
                    ),
                    const SizedBox(width: 8.0,),
                    _buildInputField(
                      value: _selectedDay,
                      label: "Day",
                      items: List.generate(31, (index) => "${index + 1}".padLeft(2, "0")),
                      onChanged: (value) {
                        setState(() {
                          _selectedDay = value;
                        });
                      },
                    ),
                    const SizedBox(width: 8.0,),
                    _buildInputField(
                      value: _selectedYear,
                      label: "Year",
                      items: List.generate(
                        100,
                          (index) => "${DateTime.now().year - index}",
                      ),
                      onChanged: (value) {
                        setState(() {
                          _selectedYear = value;
                        });
                      }
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: Color(0XFFCCD6E0),
                  backgroundColor: Color(0XFF003366),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  )
              ),
              child: const Text("Continue",
                style: TextStyle(color: Colors.white)
                ,),
            ),
          ),
          SizedBox(height: 16,),
        ],
      ),
    );
  }
  Widget _buildInputField({
    required String? value,
    required String label,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 12),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              DropdownButtonFormField<String>(
                value: value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(16, 4, 16, 12),
                ),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                )).toList(),
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
