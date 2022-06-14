import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';

class OsdSigef {
  final SpreadsheetDecoder _file;
  OsdSigef(this._file);
  SpreadsheetTable? _sheetActive;

  setSheet(String sheetName) {
    _sheetActive = _file.tables[sheetName];
  }

  String getValue(String column, int row) {
    List<String> col = [
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L'
    ];
    int indexCol = col.indexOf(column);
    return _sheetActive != null
        ? _sheetActive!.rows[row - 1][indexCol]
        : 'Sheet undefined !';
  }

  List<Vertices> readVertices() {
    int rowStart = 11;
    bool readNext = true;
    List<Vertices> tempVertices = [];
    do {
      print(rowStart);
      var cols = _sheetActive!.rows[rowStart];
      if (cols[0] == null) {
        readNext = false;
      } else {
        tempVertices.add(
          Vertices(
            name: cols[0].toString(),
            utmY: double.parse(cols[1].toString().replaceAll(',', '.')),
            utmYSigma: double.parse(cols[2].toString().replaceAll(',', '.')),
            utmX: double.parse(cols[3].toString().replaceAll(',', '.')),
            utmXSigma: double.parse(cols[4].toString().replaceAll(',', '.')),
            utmZ: double.parse(cols[5].toString().replaceAll(',', '.')),
            utmZSigma: double.parse(cols[6].toString().replaceAll(',', '.')),
            positioningMethod: cols[7]?.toString(),
            limitType: cols[8]?.toString(),
            cns: cols[9]?.toString(),
            matricula: cols[10]?.toString(),
            descritivo: cols[11]?.toString(),
          ),
        );
        if ((rowStart + 1) < _sheetActive!.maxRows) {
          rowStart++;
        } else {
          readNext = false;
        }
      }
    } while (readNext);
    return tempVertices;
  }
}

class Vertices {
  final String name;
  final num utmX;
  final num utmXSigma;
  final num utmY;
  final num utmYSigma;
  final num utmZ;
  final num utmZSigma;
  final String? positioningMethod;
  final String? limitType;
  final String? cns;
  final String? matricula;
  final String? descritivo;
  Vertices({
    required this.name,
    required this.utmX,
    required this.utmXSigma,
    required this.utmY,
    required this.utmYSigma,
    required this.utmZ,
    required this.utmZSigma,
    this.positioningMethod,
    this.limitType,
    this.cns,
    this.matricula,
    this.descritivo,
  });

  @override
  String toString() {
    return 'Vertices(name: $name, utmX: $utmX, utmXSigma: $utmXSigma, utmY: $utmY, utmYSigma: $utmYSigma, utmZ: $utmZ, utmZSigma: $utmZSigma, positioningMethod: $positioningMethod, limitType: $limitType, cns: $cns, matricula: $matricula, descritivo: $descritivo)';
  }
}
