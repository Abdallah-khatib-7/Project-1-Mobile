import 'package:flutter/material.dart';
import '../widgets/category_selector.dart';
import '../widgets/unit_dropdown.dart';
import '../widgets/result_display.dart';
import '../widgets/conversion_info.dart';
import '../utils/conversion_logic.dart';

class UnitConverterPage extends StatefulWidget {
  const UnitConverterPage({super.key});

  @override
  State<UnitConverterPage> createState() => _UnitConverterPageState();
}

class _UnitConverterPageState extends State<UnitConverterPage> {
  String selectedCategory = 'Length';
  String fromUnit = 'Meters';
  String toUnit = 'Feet';
  double inputValue = 0;
  double result = 0;

  @override
  void initState() {
    super.initState();
    _updateUnitsForCategory();
  }

  void _updateUnitsForCategory() {
    final units = ConversionLogic.getUnitsForCategory(selectedCategory);
    setState(() {
      fromUnit = units.isNotEmpty ? units[0] : 'Unit';
      toUnit = units.length > 1 ? units[1] : units.isNotEmpty ? units[0] : 'Unit';
    });
    convert();
  }

  void convert() {
    setState(() {
      result = ConversionLogic.convert(fromUnit, toUnit, inputValue, selectedCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Unit Converter'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView( /
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            CategorySelector(
              selectedCategory: selectedCategory,
              onChanged: (String? newCategory) {
                setState(() {
                  selectedCategory = newCategory!;
                  _updateUnitsForCategory();
                });
              },
            ),

            const SizedBox(height: 20),


            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter value to convert',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.input),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      inputValue = 0;
                      convert();
                    });
                  },
                ),
              ),
              onChanged: (value) {
                inputValue = double.tryParse(value) ?? 0;
                convert();
              },
            ),

            const SizedBox(height: 20),


            UnitDropdown(
              value: fromUnit,
              label: 'From',
              category: selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  fromUnit = newValue!;
                  convert();
                });
              },
            ),

            const SizedBox(height: 12),

            UnitDropdown(
              value: toUnit,
              label: 'To',
              category: selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  toUnit = newValue!;
                  convert();
                });
              },
            ),

            const SizedBox(height: 30),


            ResultDisplay(
              inputValue: inputValue,
              fromUnit: fromUnit,
              result: result,
              toUnit: toUnit,
            ),

            const SizedBox(height: 20),


            ConversionInfo(currentCategory: selectedCategory),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}