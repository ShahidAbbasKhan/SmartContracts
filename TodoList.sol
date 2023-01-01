// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Todos {
    struct Todo {
        string doIs;
        bool status;
    }

    // An array of 'Todo' structs
    Todo[] public todos;

    function create(string calldata _TODO) public {
        // 3 ways to initialize a struct
        // - calling it like a function
        todos.push(Todo(_TODO, false));

        // key value mapping
        todos.push(Todo({doIs: _TODO, status: false}));

        // initialize an empty struct and then update it
        Todo memory todo;
        todo.doIs = _TODO;
        todo.status=false;
        // todo.status initialized to false

        todos.push(todo);
    }

    // Solidity automatically created a getter for 'todos' so
    // you don't actually need this function.
    function get(uint _index) public view returns (string memory doIs, bool status) {
        Todo memory todo = todos[_index];
        return (todo.doIs, todo.status);
    }

    // update doIs
    function updateTodo(uint _index, string memory _TODO) public {
        Todo storage todo = todos[_index];
        todo.doIs = _TODO;
    }

    // update status
    function getStatus(uint _index) public {
        Todo storage todo = todos[_index];
        todo.status = true;
    }
}