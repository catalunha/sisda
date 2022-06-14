import 'package:sisda/app/domain/models/vertice_model.dart';
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

  List<VerticeModel> readVertices() {
    int rowStart = 11;
    bool readNext = true;
    List<VerticeModel> tempVertices = [];
    do {
      print(rowStart);
      var cols = _sheetActive!.rows[rowStart];
      if (cols[0] == null) {
        readNext = false;
      } else {
        tempVertices.add(
          VerticeModel(
            name: cols[0].toString(),
            utmX: double.tryParse(cols[1].toString().replaceAll(',', '.')),
            utmXSigma: double.tryParse(cols[2].toString().replaceAll(',', '.')),
            utmY: double.tryParse(cols[3].toString().replaceAll(',', '.')),
            utmYSigma: double.tryParse(cols[4].toString().replaceAll(',', '.')),
            utmZ: double.tryParse(cols[5].toString().replaceAll(',', '.')),
            utmZSigma: double.tryParse(cols[6].toString().replaceAll(',', '.')),
            positioningMethod: cols[7]?.toString(),
            limitType: cols[8]?.toString(),
            cns: cols[9]?.toString(),
            matricula: cols[10]?.toString(),
            descritivo: cols[11]?.toString(),
            observations: [],
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
