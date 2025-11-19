class ConversionLogic {
  static final List<String> categories = [
    'Length',
    'Weight',
    'Temperature',
    'Digital Storage',
    'Frequency',
    'Area',
    'Volume',
    'Time'
  ];

  static final Map<String, List<String>> categoryUnits = {
    'Length': ['Meters', 'Kilometers', 'Centimeters', 'Millimeters', 'Miles', 'Feet', 'Inches', 'Yards'],
    'Weight': ['Kilograms', 'Grams', 'Milligrams', 'Micrograms', 'Tons', 'Pounds', 'Ounces'],
    'Temperature': ['Celsius', 'Fahrenheit', 'Kelvin'],
    'Digital Storage': ['Bytes', 'Kilobytes', 'Megabytes', 'Gigabytes', 'Terabytes', 'Petabytes'],
    'Frequency': ['Hertz', 'Kilohertz', 'Megahertz', 'Gigahertz'],
    'Area': ['Square Meters', 'Square Kilometers', 'Square Feet', 'Square Miles', 'Acres', 'Hectares'],
    'Volume': ['Liters', 'Milliliters', 'Cubic Meters', 'Cubic Feet', 'Gallons', 'Quarts'],
    'Time': ['Seconds', 'Minutes', 'Hours', 'Days', 'Weeks', 'Months', 'Years'],
  };

  static final Map<String, double> baseConversionFactors = {
    // Length - base: meters
    'Meters': 1.0,
    'Kilometers': 1000.0,
    'Centimeters': 0.01,
    'Millimeters': 0.001,
    'Miles': 1609.34,
    'Feet': 0.3048,
    'Inches': 0.0254,
    'Yards': 0.9144,

    // Weight - base: kilograms
    'Kilograms': 1.0,
    'Grams': 0.001,
    'Milligrams': 0.000001,
    'Micrograms': 0.000000001,
    'Tons': 1000.0,
    'Pounds': 0.453592,
    'Ounces': 0.0283495,

    // Digital Storage - base: bytes
    'Bytes': 1.0,
    'Kilobytes': 1024.0,
    'Megabytes': 1048576.0,
    'Gigabytes': 1073741824.0,
    'Terabytes': 1099511627776.0,
    'Petabytes': 1125899906842624.0,

    // Frequency - base: hertz
    'Hertz': 1.0,
    'Kilohertz': 1000.0,
    'Megahertz': 1000000.0,
    'Gigahertz': 1000000000.0,

    // Area - base: square meters
    'Square Meters': 1.0,
    'Square Kilometers': 1000000.0,
    'Square Feet': 0.092903,
    'Square Miles': 2589988.11,
    'Acres': 4046.86,
    'Hectares': 10000.0,

    // Volume - base: liters
    'Liters': 1.0,
    'Milliliters': 0.001,
    'Cubic Meters': 1000.0,
    'Cubic Feet': 28.3168,
    'Gallons': 3.78541,
    'Quarts': 0.946353,

    // Time - base: seconds
    'Seconds': 1.0,
    'Minutes': 60.0,
    'Hours': 3600.0,
    'Days': 86400.0,
    'Weeks': 604800.0,
    'Months': 2592000.0, // 30 days
    'Years': 31536000.0, // 365 days
  };

  static final Map<String, double> conversionFactors = {
    'Meters to Feet': 3.28084,
    'Feet to Meters': 0.3048,
    'Kilometers to Miles': 0.621371,
    'Miles to Kilometers': 1.60934,
    'Kilograms to Pounds': 2.20462,
    'Pounds to Kilograms': 0.453592,
    'Grams to Ounces': 0.035274,
    'Ounces to Grams': 28.3495,
  };

  static double convert(String fromUnit, String toUnit, double inputValue, String category) {
    if (category == 'Temperature') {
      return _convertTemperature(fromUnit, toUnit, inputValue);
    }

    double fromFactor = baseConversionFactors[fromUnit]!;
    double toFactor = baseConversionFactors[toUnit]!;

    double valueInBase = inputValue * fromFactor;
    return valueInBase / toFactor;
  }

  static double _convertTemperature(String fromUnit, String toUnit, double inputValue) {
    double celsius;

    switch (fromUnit) {
      case 'Celsius':
        celsius = inputValue;
        break;
      case 'Fahrenheit':
        celsius = (inputValue - 32) * 5/9;
        break;
      case 'Kelvin':
        celsius = inputValue - 273.15;
        break;
      default:
        celsius = inputValue;
    }

    switch (toUnit) {
      case 'Celsius':
        return celsius;
      case 'Fahrenheit':
        return (celsius * 9/5) + 32;
      case 'Kelvin':
        return celsius + 273.15;
      default:
        return celsius;
    }
  }

  static List<String> getUnitsForCategory(String category) {
    return categoryUnits[category] ?? ['Unit 1', 'Unit 2'];
  }

  static Map<String, String> getConversionFormula(String fromUnit, String toUnit, String category) {
    if (category == 'Temperature') {
      return _getTemperatureFormula(fromUnit, toUnit);
    }

    String conversionKey = '$fromUnit to $toUnit';
    if (conversionFactors.containsKey(conversionKey)) {
      double factor = conversionFactors[conversionKey]!;
      return {
        'formula': '$toUnit = $fromUnit × ${factor.toStringAsFixed(6)}',
        'explanation': 'Multiply by ${factor.toStringAsFixed(6)} to convert from $fromUnit to $toUnit'
      };
    } else if (fromUnit == toUnit) {
      return {
        'formula': '$toUnit = $fromUnit',
        'explanation': 'Same unit - no conversion needed'
      };
    } else {
      double fromFactor = baseConversionFactors[fromUnit]!;
      double toFactor = baseConversionFactors[toUnit]!;
      double directFactor = fromFactor / toFactor;

      return {
        'formula': '$toUnit = $fromUnit × ${directFactor.toStringAsFixed(6)}',
        'explanation': 'Conversion factor: ${directFactor.toStringAsFixed(6)}'
      };
    }
  }

  static Map<String, String> _getTemperatureFormula(String fromUnit, String toUnit) {
    switch ('$fromUnit to $toUnit') {
      case 'Celsius to Fahrenheit':
        return {
          'formula': '°F = (°C × 9/5) + 32',
          'explanation': 'Multiply Celsius by 9/5, then add 32'
        };
      case 'Fahrenheit to Celsius':
        return {
          'formula': '°C = (°F - 32) × 5/9',
          'explanation': 'Subtract 32 from Fahrenheit, then multiply by 5/9'
        };
      case 'Celsius to Kelvin':
        return {
          'formula': 'K = °C + 273.15',
          'explanation': 'Add 273.15 to Celsius'
        };
      case 'Kelvin to Celsius':
        return {
          'formula': '°C = K - 273.15',
          'explanation': 'Subtract 273.15 from Kelvin'
        };
      case 'Fahrenheit to Kelvin':
        return {
          'formula': 'K = (°F - 32) × 5/9 + 273.15',
          'explanation': 'Convert to Celsius first, then add 273.15'
        };
      case 'Kelvin to Fahrenheit':
        return {
          'formula': '°F = (K - 273.15) × 9/5 + 32',
          'explanation': 'Convert to Celsius first, then to Fahrenheit'
        };
      default:
        return {
          'formula': 'Same unit',
          'explanation': 'No conversion needed'
        };
    }
  }

  static String formatNumber(double value) {
    if (value == 0) return '0';

    if (value.abs() < 0.001) {
      return value.toStringAsFixed(8);
    }
    else if (value.abs() < 1) {
      return value.toStringAsFixed(6);
    }
    else if (value.abs() < 1000) {
      return value.toStringAsFixed(4);
    }
    else {
      return value.toStringAsFixed(2);
    }
  }
}