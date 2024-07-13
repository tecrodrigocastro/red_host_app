enum StateStatus {
  initial,
  loading,
  success,
  error,
  empty,
}

Map<String, dynamic> toMap(StateStatus status) {
  return {
    'status': status.index,
  };
}

StateStatus fromMap(Map<String, dynamic> map) {
  int index = map['status'];
  return StateStatus.values[index];
}
