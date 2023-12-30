class Result {
  final String inputNumber;
  final String outputNumber;

  Result({
    required this.inputNumber,
    required this.outputNumber 
  });

  factory Result.fromJson(Map<String, dynamic> json){
    return Result(
      inputNumber: json['inputNumber'],
      outputNumber: json['outputNumber']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'inputNumber': inputNumber,
      'outputNumber': outputNumber
    };
  }
}