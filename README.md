---

# School Grading System Smart Contract

This smart contract represents a simple school grading system implemented in Solidity. It allows you to register a student's score, validate that the score is within acceptable boundaries, and check if the student passed or failed based on their score.

## Prerequisites

- Solidity 0.8.18 or higher
- A Solidity-compatible development environment (e.g., Remix, Hardhat)

## Contract Overview

The `SchoolGradingSystem` contract consists of the following features:
- **Score registration**: Allows users to register a student's score out of 100.
- **Passing grade check**: Validates if the score qualifies as a passing grade (≥ 40).
- **Score validation**: Ensures that the score is between 0 and 100.
- **Failure check**: Identifies if the student has failed by checking if the score is less than 40.

## Functions

### `registerScore(uint _score)`
This function registers a student's score and ensures that it is between 0 and 100 using the `require` statement. If the score is invalid, it throws an error.

- **Parameters**:
  - `_score`: The student's score (must be between 0 and 100).
- **Error Handling**:
  - Uses `require` to ensure that the score is within the valid range.
  
### `checkPassingGrade()`
This function checks if the student's score is 40 or more, indicating a passing grade. It uses the `assert` statement to ensure this condition.

- **Error Handling**:
  - Uses `assert` to validate that the score is greater than or equal to 40.

### `validateScore()`
This function checks if the registered score is between 0 and 100 using the `require` statement. If the score is invalid, it throws an error.

- **Error Handling**:
  - Uses `require` to enforce valid score boundaries (0 to 100).

### `checkFailure()`
This function checks if the student's score is less than 40, indicating failure. If the student has failed, the function reverts the transaction using `revert`.

- **Error Handling**:
  - Uses `revert` to handle failure cases (score < 40).

## Usage

1. **Register a score**:
   Call the `registerScore(uint _score)` function and pass the student's score as an argument (0 to 100).

2. **Check passing grade**:
   After registering a score, call the `checkPassingGrade()` function to ensure that the student has passed (score ≥ 40). If the score is below 40, the function will throw an assertion error.

3. **Validate score range**:
   Call `validateScore()` to verify that the registered score is between 0 and 100.

4. **Check failure**:
   Call `checkFailure()` to check if the student has failed (score < 40). If the student has failed, the function will revert the transaction with an error message.

## Example

```solidity
SchoolGradingSystem gradingSystem = new SchoolGradingSystem();

// Register a score
gradingSystem.registerScore(85);

// Check if the student passed
gradingSystem.checkPassingGrade(); // Passes, as the score is >= 40

// Validate score range
gradingSystem.validateScore(); // Passes, as the score is within 0-100

// Check if the student failed
gradingSystem.checkFailure(); // No error, as the score is >= 40
```

## Error Handling

- **`assert`**: Used to ensure that certain conditions (like passing grades) are always met. If the condition fails, it will throw an exception.
- **`require`**: Used to validate input or conditions before performing any logic (e.g., valid score range). If the condition fails, the function call is reverted.
- **`revert`**: Used in failure cases to manually revert a transaction when a specific condition is not met (e.g., student failing).

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
