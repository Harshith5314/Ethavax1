# Solidity Code Submission & Review Contract

This Solidity smart contract simulates a code submission and review system, similar to the process used on the Metacrafters platform. Users can submit their code for review, and the owner of the contract (e.g., the reviewer) can approve or reject it based on predefined requirements. The contract utilizes error-handling mechanisms like `require`, `revert`, and `assert` to ensure a robust workflow.

## Table of Contents
- [Features](#features)
- [Smart Contract Overview](#smart-contract-overview)
- [Prerequisites](#prerequisites)
- [Deployment](#deployment)
- [Usage Instructions](#usage-instructions)
- [Error Handling](#error-handling)
- [Example Workflow](#example-workflow)
- [License](#license)

## Features

- **Code Submission**: Users can submit their code for review, ensuring that each submission is unique.
- **Review Process**: The contract owner can review and either approve or reject the submitted code based on whether it meets the requirements.
- **Approval Status**: Allows users to check whether their code submission has been approved.
- **Error Handling**: Includes usage of `require`, `revert`, and `assert` to handle common errors and maintain the integrity of the contract.

## Smart Contract Overview

### Functions:
1. **`submitCode(string memory _code)`**
   - Allows users to submit code for review.
   - Checks if the submitted code is unique using the `require` statement.
   - Resets approval status to `false` upon new submission.

2. **`reviewCode(bool _meetsRequirements)`**
   - Can only be called by the contract owner.
   - Approves or rejects the code based on whether it meets the requirements.
   - Uses `revert` to stop execution if the code does not meet the standards.

3. **`checkApproval()`**
   - Allows any user to check whether the last submitted code has been approved.
   - Uses `assert` to verify that a code has been submitted before checking approval status.

### Modifiers:
- **`onlyOwner`**: Restricts access to functions so that only the owner can call them (e.g., `reviewCode`).

### Error Handling:
- **`require`**: Ensures that the code being submitted is unique and only the owner can review.
- **`revert`**: Used in `reviewCode` to handle scenarios where the code doesn’t meet the required standards.
- **`assert`**: Verifies that code has been submitted before checking the approval status.

## Prerequisites

- **Solidity Compiler**: Ensure you have a compatible version (preferably `^0.8.0`).
- **Ethereum Development Environment**: Remix IDE, Hardhat, or Truffle for compiling and deploying the contract.
- **MetaMask** or any other Ethereum wallet to interact with the contract.
- **Test Network**: Use a test network like Rinkeby, Sepolia, or a local blockchain like Ganache for testing.

## Deployment

1. Open Remix or your preferred Ethereum development environment.
2. Paste the Solidity code into a new file.
3. Compile the code using Solidity compiler version `^0.8.0`.
4. Deploy the contract to the desired Ethereum network (e.g., Remix’s JavaScript VM or a test network like Sepolia).
5. Make a note of the deployed contract address.

## Usage Instructions

1. **Submit Code**: Any user can submit their code for review using the `submitCode()` function.
   ```solidity
   submitCode("Your code content here");
   ```

2. **Review Code**: The owner reviews the submitted code using the `reviewCode()` function.
   ```solidity
   reviewCode(true); // Pass 'true' if the code meets requirements, 'false' otherwise.
   ```

3. **Check Approval Status**: Users can check whether their code submission has been approved.
   ```solidity
   bool isApproved = checkApproval();
   ```

## Error Handling

- **`require`**: Used in `submitCode()` to ensure that the submitted code is unique.
- **`revert`**: Used in `reviewCode()` to reject the code if it does not meet the standards.
- **`assert`**: Used in `checkApproval()` to ensure that the code has been submitted before checking the approval status.

## Example Workflow

1. **User submits code**:
   ```solidity
   submitCode("Sample Code Version 1");
   ```

2. **Owner reviews code**:
   ```solidity
   reviewCode(true); // Approve the code.
   // OR
   reviewCode(false); // Reject the code and prompt the user to resubmit.
   ```

3. **User checks approval status**:
   ```solidity
   bool isApproved = checkApproval();
   ```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

# Harshith Kaduluri (kaduluriharshith@gmail.com)
