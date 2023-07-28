// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract mintYourCoins {
    address public minter;
    mapping(address => uint) public balance;
   event send(address from, address to, uint amount);

    constructor() {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balance[receiver] += amount;
    }

    function sent(address receiver, uint amount) public {
        require(amount <= balance[msg.sender], "Insufficient Balance");
        balance[msg.sender] -= amount;
        balance[receiver] += amount;
        emit send(msg.sender, receiver, amount); // Corrected event name to "sent"
    }

    function getBalance(address account) external view returns (uint) {
        return balance[account];
    }


}
