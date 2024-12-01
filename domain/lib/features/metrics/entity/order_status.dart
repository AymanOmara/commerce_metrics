enum OrderStatus {
  ordered("ORDERED"),
  delivered("DELIVERED"),
  unDefined("unDefined"),
  returned("RETURNED");

  final String statusName;

  const OrderStatus(this.statusName);

  static OrderStatus fromStatusName(String statusName) {
    for (OrderStatus status in OrderStatus.values) {
      if (status.statusName == statusName) {
        return status;
      }
    }
    return OrderStatus.unDefined;
  }
}
