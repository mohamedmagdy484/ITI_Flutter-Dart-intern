void main() {
  Map<String, int> runners = {
    'Ahmed': 341,
    'Mohamed': 273,
    'Ismail': 278,
    'Hend': 329,
    'Aly': 445,
    'Hossam': 402,
    'Ola': 388,
    'Alaa': 275,
    'Basma': 243,
    'Mina': 334,
    'Nada': 412,
    'Saad': 393,
  };

  var sortedRunners = runners.entries.toList();

  sortedRunners.sort((a, b) => a.value.compareTo(b.value));

  print("Fastest runner: ${sortedRunners[0].key} time: ${sortedRunners[0].value} minutes");

  print("Second fastest runner: ${sortedRunners[1].key} time: ${sortedRunners[1].value} minutes");
}