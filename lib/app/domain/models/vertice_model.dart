class VerticeModel {
  final String name;
  final double? utmX;
  final double? utmXSigma;
  final double? utmY;
  final double? utmYSigma;
  final double? utmZ;
  final double? utmZSigma;
  final String? positioningMethod;
  final String? limitType;
  final String? cns;
  final String? matricula;
  final String? descritivo;
  final String? duplicated;
  final List<String>? observations;
  VerticeModel({
    required this.name,
    this.utmX,
    this.utmXSigma,
    this.utmY,
    this.utmYSigma,
    this.utmZ,
    this.utmZSigma,
    this.positioningMethod,
    this.limitType,
    this.cns,
    this.matricula,
    this.descritivo,
    this.duplicated,
    this.observations,
  });

  VerticeModel copyWith({
    String? name,
    double? utmX,
    double? utmXSigma,
    double? utmY,
    double? utmYSigma,
    double? utmZ,
    double? utmZSigma,
    String? positioningMethod,
    String? limitType,
    String? cns,
    String? matricula,
    String? descritivo,
    String? duplicated,
    List<String>? observations,
  }) {
    return VerticeModel(
      name: name ?? this.name,
      utmX: utmX ?? this.utmX,
      utmXSigma: utmXSigma ?? this.utmXSigma,
      utmY: utmY ?? this.utmY,
      utmYSigma: utmYSigma ?? this.utmYSigma,
      utmZ: utmZ ?? this.utmZ,
      utmZSigma: utmZSigma ?? this.utmZSigma,
      positioningMethod: positioningMethod ?? this.positioningMethod,
      limitType: limitType ?? this.limitType,
      cns: cns ?? this.cns,
      matricula: matricula ?? this.matricula,
      descritivo: descritivo ?? this.descritivo,
      duplicated: duplicated ?? this.duplicated,
      observations: observations ?? this.observations,
    );
  }
}
