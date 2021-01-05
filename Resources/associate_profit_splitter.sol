pragma solidity ^0.5.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    // @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    address payable owner = msg.sender;
    address payable employee_one; // = 0x51f6210AdBb74CC7FB3444d89CDB31D36cB4bC11;
    address payable employee_two; // = 0xCE377Dd9172588DDB3d8f9b7333415D29c8b5517;
    address payable employee_three; // = 0xBA0C67a600E68482555760EB28050bc40496deB5;
    
    constructor(address payable employee_1, address payable employee_2, address payable employee_3) public {
        employee_one = employee_1;
        employee_two = employee_2;
        employee_three = employee_3;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        // @TODO: Split `msg.value` into three
        require(owner == msg.sender);
        uint amount = msg.value / 3; 

        // @TODO: Transfer the amount to each employee
        
        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);

        // @TODO: take care of a potential remainder by sending back to HR (`msg.sender`)
        
        owner.transfer(msg.value - amount * 3);
    }

    function() external payable {
        // @TODO: Enforce that the `deposit` function is called in the fallback function!
        
        deposit();
    }
}
