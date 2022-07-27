// SPDX-License-Identifier: MIT

pragma solidity >0.8.0;

contract SimpleWallet {
    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        balance += msg.value;
    }

    function pay() public payable {
        require(msg.sender.balance > 0);
        balance += msg.value;
    }

    function transfer(address payable to, uint256 amount) public {
        require(msg.sender == owner);
        to.transfer(amount);
        balance -= amount;
    }
}
