// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
contract Library {
    address public owner;
    event BookAdded (address indexed adder, string title,string author,address librarian, uint bookId);
    event UpdatedBook(uint indexed bookIndex, string _newTitle, uint _bookId, string _newAuthor,address indexed Librarian);

    constructor(){
        owner=msg.sender;
    }

    struct Book {
        string title;
        string author;
        address Librarian;
        uint bookId;
    }

    Book[] public books;

    function addBook(string memory _title, string memory _author, uint _id) public {
        //1st way to add Book
        books.push(Book(_title, _author,msg.sender,_id));

        //2ndway to add Book 
        // books.push(Book({title:_title,author:_author,Librarian:msg.sender,bookId:_id}));
        
        //3rd way to add Book
        // Book memory book;
        // book.author= _author;
        // book.bookId= _id;
        // book.title= _title;
        // book.Librarian=msg.sender;
        // books.push(book);
         
        emit BookAdded(msg.sender,_title,_author,msg.sender, _id);
    }
    function getBook(uint _index) public view returns (string memory,address,string memory,uint){
        Book memory book= books[_index];
        return (book.author,book.Librarian,book.title,book.bookId);
    }

    function updateBook(uint _index, string memory _newTitle,uint _bookId, string memory _newAuthor) public {
         Book memory book =books[_index];
        require(msg.sender== book.Librarian,"You can't modify data");
         book.author= _newAuthor;
         book.bookId= _bookId;
         book.Librarian= msg.sender;
         book.title= _newTitle;
        books.push(book);
        emit UpdatedBook( _index, _newTitle, _bookId, _newAuthor, msg.sender);
    }
}