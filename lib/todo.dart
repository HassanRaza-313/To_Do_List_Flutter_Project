
class ToDo{
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false

  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Morning Exercise',isDone: true),
      ToDo(id: '02', todoText: 'Buy Groceries',isDone: true),
      ToDo(id: '03', todoText: 'Check Facebook',),
      ToDo(id: '04', todoText: 'Team Meeting',),
      ToDo(id: '05', todoText: 'Work on Mobile Apps',),
      ToDo(id: '06', todoText: 'Dinner with Talha',),
      ToDo(id: '07', todoText: 'Coding',),
      ToDo(id: '08', todoText: 'Mobile Checking',),
      ToDo(id: '09', todoText: 'Meeting',),
      ToDo(id: '10', todoText: 'Dinner with Talha',),
      ToDo(id: '11', todoText: 'Morning Exercise',isDone: true),
      ToDo(id: '12', todoText: 'Buy Groceries',isDone: true),
      ToDo(id: '13', todoText: 'Check Facebook',),
      ToDo(id: '14', todoText: 'Team Meeting',),
      ToDo(id: '15', todoText: 'Work on Mobile Apps',),
      ToDo(id: '16', todoText: 'Dinner with Talha',),
    ];
  }
}