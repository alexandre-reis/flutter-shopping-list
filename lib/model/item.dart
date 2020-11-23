class Item {
  String _name;
  bool _completed = false;

  Item(this._name);

  getName() => this._name;
  setName(name) => this._name = name;

  isCompleted() => this._completed;
  setCompleted(completed) => this._completed = completed;
}
