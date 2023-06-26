class Model {
  final String id;
  final String taskName;
  final String taskDate;
  final String type;
  bool status;

  //to get input from the user, we will create constructor now

  Model(
      {required this.id,
      required this.taskName,
      required this.taskDate,
      required this.type,
      required this.status});
}
