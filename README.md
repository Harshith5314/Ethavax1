# Voting System Smart Contract

## Overview

This is a simple **Voting System** smart contract written in Solidity. It allows candidates to register, and voters to cast their votes. The contract ensures that:

- Only registered candidates can receive votes.
- Voters can only vote once.
- Voting must be open to accept votes.

## Features
1. **Candidate Registration**: Candidates can register themselves before the voting starts.
2. **Voting**: Users can cast their vote for a registered candidate while the voting is open.
3. **View Votes**: Check the number of votes a candidate has received.
4. **Close Voting**: Close the voting process to stop accepting new votes.
5. **Finalize Results**: Calculate and verify internal vote counts.

## Error Handling Mechanisms

This contract utilizes three main error handling methods in Solidity: **`require`**, **`revert`**, and **`assert`**.

### Usage of `require`
- `require` is used to validate input conditions and preconditions before executing the function logic.
- **Example**:
    ```solidity
    require(votingOpen, "Voting is currently closed.");
    ```
    This ensures that voting is open before allowing a vote to be cast.

### Usage of `revert`
- `revert` is used to undo the entire transaction if specific conditions are not met.
- **Example**:
    ```solidity
    if (votingOpen) {
        revert("Voting must be closed before resetting.");
    }
    ```
    This reverts the transaction if someone tries to reset the voting while it is still open, undoing all state changes.

### Usage of `assert`
- `assert` is used to check for conditions that should never fail. It indicates a critical bug if it fails.
- **Example**:
    ```solidity
    assert(totalVotes >= candidateList.length);
    ```
    This `assert` ensures that the total votes counted should be at least equal to the number of registered candidates. If this condition fails, it suggests a bug in the contract.

## Contract Functions

1. **registerCandidate(string memory _name)**:
    - Allows a candidate to register with their name.
    - Uses `require` to ensure the candidate is not already registered.
  
2. **vote(string memory _candidateName)**:
    - Allows users to cast a vote for a registered candidate.
    - Uses `require` to check:
        - The voter has not voted before.
        - The candidate is registered.
    - Emits a `VoteCasted` event upon successful voting.

3. **getVotes(string memory _candidateName)**:
    - Returns the number of votes a candidate has received.
    - Uses `require` to ensure the candidate is registered.

4. **closeVoting()**:
    - Closes the voting process to stop accepting new votes.

5. **finalizeResults()**:
    - Calculates the total votes and uses `assert` to ensure vote counting integrity.

6. **resetVoting()**:
    - Resets the vote counts and reopens voting.
    - Uses `revert` to invalidate the transaction if voting is not yet closed.

## Getting Started

### Prerequisites
- Solidity ^0.8.0
- Remix IDE or Truffle for contract deployment

### Deployment
1. Copy the Solidity code into your IDE (e.g., Remix IDE).
2. Compile the contract using Solidity ^0.8.0.
3. Deploy the contract on the desired Ethereum testnet.

### Interacting with the Contract
1. **Register Candidate**: Call `registerCandidate(string _name)` to register a new candidate.
2. **Vote**: Call `vote(string _candidateName)` to cast a vote for a registered candidate.
3. **View Votes**: Use `getVotes(string _candidateName)` to view the vote count of a candidate.
4. **Close Voting**: Call `closeVoting()` to close the voting process.
5. **Finalize Results**: Use `finalizeResults()` to verify the vote counts.
6. **Reset Voting**: Call `resetVoting()` to reset the voting system.

## License
This project is licensed under the MIT License.

---
## Author
Kaduluri Hasrhith (kaduluriharshith@gmail.com)
