void main() {
  // print('The addition : ${Add(10, 20)}');
  //printBook('Dr. APJ Abdul Kalam', 'Wings Of Fire');
  printBook(
      title: 'India 2020',
      author: 'Dr. APJ Abdul Kalam'
     );
      
}

int Add(int x, int y) {
  return x + y;
}

// Function Expression => Fat arrow | Short hand
int Addition(int x, int y) => x + y;

// Parameters
// void printBook(String author, String title) {
//   print('The book ${title} is written by ${author}');
// }

// Optional Positional Parameters
// void printBook(String author, String title,
//     [String publisher = "Packt", int numOfPages = 100]) {
//   print('The book ${title} is written by ${author}');
// }

// optional Named Parameters
void printBook(
    {String author = "Unknown",
    String title = "Unknown",
    String publisher = "Packt",
    int numOfPages = 100}) {
  print('The book ${title} is written by ${author}');
}
