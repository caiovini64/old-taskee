abstract class IAddTaskDatasource {
  Future<String> addTask(String title, String subtitle, String state);
}
