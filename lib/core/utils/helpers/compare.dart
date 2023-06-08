int compareString(String s1, String s2, bool isAscending) {
  return isAscending ? s1.compareTo(s2) : s2.compareTo(s1);
}

int compareDouble(double s1, double s2, bool isAscending) {
  return isAscending ? s1.compareTo(s2) : s2.compareTo(s1);
}
