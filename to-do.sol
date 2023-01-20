// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ToDo{
    // todo's related data
    struct Todo{
        uint time;
        string text;
        bool complated;
    }

    Todo[] public todos;
    // This function can create, changed and get todo's
    function create(string calldata _text) external {
        todos.push(Todo({
            time: block.timestamp,
            text: _text,
            complated: false
        }));
    }

    // updated todo's text
    function update(uint _index, string calldata _text) external {
        todos[_index].text = _text;
        Todo storage todo = todos[_index];
        todo.text = _text;

    }
    //we can see todo's situation
    function get(uint _index) external view returns(string memory, bool) {
        Todo memory todo = todos[_index];
        return (todo.text, todo.complated);
    }
    // and we can complated todo
    function complatedTodo(uint _index) external {
        todos[_index].complated = !todos[_index].complated;
    }

}