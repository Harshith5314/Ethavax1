// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SchoolGradingSystem {
    uint public studentScore;

    // Function to register a student's score (out of 100)
    function registerScore(uint _score) public {
        // Ensure score is within valid range (0-100) using require
        require(_score <= 100 && _score >= 0, "Score must be between 0 and 100.");
        studentScore = _score;
    }

    // Function to check for passing grades using assert (assumes passing is 40 or above)
    function checkPassingGrade() public view {
        // Assert that the score is above the passing mark (40)
        assert(studentScore >= 40);
    }

    // Function to check for grade boundaries (0-100) using require
    function validateScore() public view {
        // Ensure the score is within the valid range
        require(studentScore >= 0 && studentScore <= 100, "Score must be between 0 and 100.");
    }

    // Function to revert the transaction if the student fails (less than 40)
    function checkFailure() public view {
        if (studentScore < 40) {
            revert("Student has failed. Score is below 40.");
        }
    }
}
