class PositioningMethodModel {
  final String code;
  final String description;
  final List<String> verticeType;
  PositioningMethodModel({
    required this.code,
    required this.description,
    required this.verticeType,
  });
}

class PositioningMethod {
  static Map<String, PositioningMethodModel> positioningMethodMap = {
    'PG1': PositioningMethodModel(
        code: 'PG1', description: 'Relativo estático', verticeType: ['M', 'P']),
    'PG2': PositioningMethodModel(
        code: 'PG2',
        description: 'Relativo estático-rápido',
        verticeType: ['M', 'P']),
    'PG3': PositioningMethodModel(
        code: 'PG3',
        description: 'Relativo semicinemático',
        verticeType: ['M', 'P']),
    'PG4': PositioningMethodModel(
        code: 'PG4', description: 'Relativo cinemático', verticeType: ['P']),
    'PG5': PositioningMethodModel(
        code: 'PG5',
        description: 'Relativo a partir do código C/A',
        verticeType: ['P']),
    'PG6': PositioningMethodModel(
        code: 'PG6', description: 'RTK convencional', verticeType: ['M', 'P']),
    'PG7': PositioningMethodModel(
        code: 'PG7', description: 'RTK em rede', verticeType: ['M', 'P']),
    'PG8': PositioningMethodModel(
        code: 'PG8',
        description: 'Differential GPS (DGPS)',
        verticeType: ['P']),
    'PG9': PositioningMethodModel(
        code: 'PG9',
        description: 'Posicionamento por Ponto Preciso',
        verticeType: ['M', 'P']),
    'PT1': PositioningMethodModel(
        code: 'PT1', description: 'Poligonação', verticeType: ['M', 'P']),
    'PT2': PositioningMethodModel(
        code: 'PT2', description: 'Triangulação', verticeType: ['M', 'P']),
    'PT3': PositioningMethodModel(
        code: 'PT3', description: 'Trilateração', verticeType: ['M', 'P']),
    'PT4': PositioningMethodModel(
        code: 'PT4', description: 'Triangulateração', verticeType: ['M', 'P']),
    'PT5': PositioningMethodModel(
        code: 'PT5', description: 'Irradiação', verticeType: ['M', 'P']),
    'PT6': PositioningMethodModel(
        code: 'PT6',
        description: 'Interseção linear',
        verticeType: ['M', 'P', 'V']),
    'PT7': PositioningMethodModel(
        code: 'PT7',
        description: 'Interseção angular',
        verticeType: ['M', 'P', 'V']),
    'PT8': PositioningMethodModel(
        code: 'PT8', description: 'Alinhamento', verticeType: ['M', 'P']),
    'PA1': PositioningMethodModel(
        code: 'PA1', description: 'Paralela', verticeType: ['V']),
    'PA2': PositioningMethodModel(
        code: 'PA2', description: 'Interseção de Retas', verticeType: ['V']),
    'PS1': PositioningMethodModel(
        code: 'PS1', description: 'Aerofotogrametria', verticeType: ['V']),
    'PS2': PositioningMethodModel(
        code: 'PS2', description: 'Radar aerotransportado', verticeType: ['V']),
    'PS3': PositioningMethodModel(
        code: 'PS3',
        description: 'Laser scanner aerotransportado',
        verticeType: ['V']),
    'PS4': PositioningMethodModel(
        code: 'PS4', description: 'Sensores orbitais', verticeType: ['V']),
  };
}
