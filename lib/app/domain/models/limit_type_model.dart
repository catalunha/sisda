class LimitTypeModel {
  final String code;
  final String description;
  LimitTypeModel({
    required this.code,
    required this.description,
  });
}

void population() {
  LimitTypeModel(code: 'LA1', description: 'Cerca');
  LimitTypeModel(code: 'LA2', description: 'Muro');
  LimitTypeModel(code: 'LA3', description: 'Estrada');
  LimitTypeModel(code: 'LA4', description: 'Vala');
  LimitTypeModel(code: 'LA5', description: 'Canal');
  LimitTypeModel(code: 'LA6', description: 'Linha ideal');
  LimitTypeModel(code: 'LA7', description: 'Limite artificial não tipificado');
  LimitTypeModel(code: 'LN1', description: 'Corpo dagua ou curso dagua');
  LimitTypeModel(code: 'LN2', description: 'Linha de cumeada');
  LimitTypeModel(code: 'LN3', description: 'Grota');
  LimitTypeModel(code: 'LN4', description: 'Crista de encosta');
  LimitTypeModel(code: 'LN5', description: 'Pé de encosta');
  LimitTypeModel(code: 'LN6', description: 'Limite natural não tipificado');
}
