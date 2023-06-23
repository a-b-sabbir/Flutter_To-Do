class Model {
  final String taskName;
  final String taskDate;
  final String type;
  final bool status;

  //to get input from the user, we will create constructor now

  Model(
      {required this.taskName,
      required this.taskDate,
      required this.type,
      required this.status});
}
