pragma solidity ^0.4.19;

contract Savings {
    address owner;
    uint256 till; // till is sort of deadline

    function Savings(uint256 numberOfDays) public payable {
        owner = msg.sender;
        till = now + (numberOfDays * 1 days);
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function deposit(uint256 amount) public payable { // can deposit amount anytime.
        require(msg.value == amount);
    }


    function withdraw() public onlyOwner { // can only withdraw after a certin period of time.
        require(now >= till);
        msg.sender.transfer(address(this).balance);
    }
}