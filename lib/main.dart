import 'dart:io';

class Book {

String title;

String author;

String isbn;

bool isAvailable;

Book(this.title, this.author, this.isbn, this.isAvailable);
}

class Library {

List<Book> bookCol = [];

Book? findBook(String isbn) {

for (var book in bookCol) {

if (book.isbn == isbn) {

return book;

}

}

return null;

}

void addBook(Book book) {

if (findBook(book.isbn) == null) {

bookCol.add(book);

print('Book added: ${book.title}');

} else {

print('Book with ISBN ${book.isbn} already exists.');

}

}

void removeBook(String isbn) {

Book? book = findBook(isbn);

if (book != null) {

bookCol.remove(book);

print('Book removed: ${book.title}');

} else {

print('Book with ISBN $isbn not found.');

}

}

void listBooks() {

if (bookCol.isEmpty) {

print('No books in the library.');

} else {

for (var book in bookCol) {

print('\({book.title} by \){book.author} - ${book.isAvailable ? 'Available' : 'Borrowed'}');

}

}

}

void checkoutBook(String isbn) {

Book? book = findBook(isbn);

if (book != null) {

if (book.isAvailable) {

book.isAvailable = false;

print('Book checked out: ${book.title}');

} else {

print('Book already borrowed: ${book.title}');

}

} else {

print('Book with ISBN $isbn not found.');

}

}

void returnBook(String isbn) {

Book? book = findBook(isbn);

if (book != null) {

if (!book.isAvailable) {

book.isAvailable = true;

print('Book returned: ${book.title}');

} else {

print('Book was not borrowed: ${book.title}');

}

} else {

print('Book with ISBN $isbn not found.');

}

}
}

void main() {

var library = Library();

while (true) {

print('Choose an option:');

print('1. Add Book');

print('2. Remove Book');

print('3. Find Book');

print('4. List Books');

print('5. Checkout Book');

print('6. Return Book');

print('7. Exit');

String? choice = stdin.readLineSync();

switch (choice) {

case '1':

print('Enter title:');

String? title = stdin.readLineSync();

print('Enter author:');

String? author = stdin.readLineSync();

print('Enter ISBN:');

String? isbn = stdin.readLineSync();

if (title != null && author != null && isbn != null) {

library.addBook(Book(title, author, isbn, true));

}

break;

case '2':

print('Enter ISBN of the book to remove:');

String? removeIsbn = stdin.readLineSync();

if (removeIsbn != null) {

library.removeBook(removeIsbn);

}

break;

case '3':

print('Enter ISBN of the book to find:');

String? findIsbn = stdin.readLineSync();

if (findIsbn != null) {

Book? book = library.findBook(findIsbn);

if (book != null) {

print('Book found: \({book.title} by \){book.author}');

} else {

print('Book with ISBN $findIsbn not found.');

}

}

break;

case '4':

library.listBooks();

break;

case '5':

print('Enter ISBN of the book to checkout:');

String? checkoutIsbn = stdin.readLineSync();

if (checkoutIsbn != null) {

library.checkoutBook(checkoutIsbn);

}

break;

case '6':

print('Enter ISBN of the book to return:');

String? returnIsbn = stdin.readLineSync();

if (returnIsbn != null) {

library.returnBook(returnIsbn);

}

break;

case '7':

print('Exiting...');

return;

default:

print('Invalid choice. Please try again.');

}

}
}