enum ListType { account, list_inverter, add_inverter, logout }

extension ListTypeTitle on ListType {
  String get title {
    switch (this) {
      case ListType.account:
        return "Meus dados";
      case ListType.list_inverter:
        return "Inversores";
      case ListType.add_inverter:
        return "Adicionar Inversor";
      case ListType.logout:
        return "Sair";
    }
  }
}
