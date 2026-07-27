mixin Discountable {
  double discountPercentage = 20.0;

  double applyDiscount(double amount) {
    return amount - (amount * discountPercentage / 100.0);
  }
}
