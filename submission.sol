// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodeSubmission {
    address public owner;
    bool public isApproved;
    string public lastSubmittedCode;
    
    mapping(address => string) public submissions;

    constructor() {
        owner = msg.sender;
        isApproved = false;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can approve the project.");
        _;
    }

    function submitCode(string memory _code) public {
        // Require that the new code is unique
        require(keccak256(abi.encodePacked(_code)) != keccak256(abi.encodePacked(lastSubmittedCode)), "Code must be unique.");

        // Store the new code submission
        submissions[msg.sender] = _code;
        lastSubmittedCode = _code;
        isApproved = false;  // Reset approval status
    }

    function reviewCode(bool _meetsRequirements) public onlyOwner {
        // Check if the code meets the requirements
        if (!_meetsRequirements) {
            revert("Code does not meet the required standards, please resubmit.");
        }

        // Code meets requirements
        isApproved = true;
    }

    function checkApproval() public view returns (bool) {
        // Assert to ensure the code must be submitted before approval
        assert(bytes(lastSubmittedCode).length > 0);
        return isApproved;
    }
}
