// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    struct Candidate {
        string name;
        uint256 voteCount;
        bool isRegistered;
    }

    mapping(address => bool) private hasVoted; // Track if an address has voted
    mapping(string => Candidate) private candidates; // Map candidate name to Candidate struct
    string[] private candidateList; // List of candidate names for iteration
    bool public votingOpen = true; // Status of voting

    // Event to log candidate registration
    event CandidateRegistered(string candidateName);
    // Event to log vote casting
    event VoteCasted(string candidateName, address voter);

    // Modifier to ensure voting is open
    modifier isVotingOpen() {
        require(votingOpen, "Voting is currently closed.");
        _;
    }

    // Register a candidate
    function registerCandidate(string memory _name) public {
        require(bytes(_name).length > 0, "Candidate name cannot be empty.");
        require(!candidates[_name].isRegistered, "Candidate is already registered.");

        candidates[_name] = Candidate(_name, 0, true);
        candidateList.push(_name);

        emit CandidateRegistered(_name);
    }

    // Cast a vote
    function vote(string memory _candidateName) public isVotingOpen {
        require(!hasVoted[msg.sender], "You have already voted.");
        require(candidates[_candidateName].isRegistered, "Candidate is not registered.");

        // Cast the vote
        candidates[_candidateName].voteCount += 1;
        hasVoted[msg.sender] = true;

        emit VoteCasted(_candidateName, msg.sender);
    }

    // Close the voting
    function closeVoting() public {
        votingOpen = false;
    }

    // Check the votes of a candidate
    function getVotes(string memory _candidateName) public view returns (uint256) {
        require(candidates[_candidateName].isRegistered, "Candidate is not registered.");
        return candidates[_candidateName].voteCount;
    }

    // Use assert to verify internal logic correctness after voting ends
    function finalizeResults() public view {
        require(!votingOpen, "Voting is still open. Cannot finalize results.");

        uint256 totalVotes = 0;
        for (uint256 i = 0; i < candidateList.length; i++) {
            totalVotes += candidates[candidateList[i]].voteCount;
        }

        // Use assert to confirm the integrity of internal logic
        assert(totalVotes >= candidateList.length); // Example check: Ensure votes are counted correctly
    }

    // Use revert to invalidate an entire transaction if conditions are not met
    function resetVoting() public {
        if (votingOpen) {
            revert("Voting must be closed before resetting.");
        }

        // Reset logic here
        for (uint256 i = 0; i < candidateList.length; i++) {
            candidates[candidateList[i]].voteCount = 0;
        }

        votingOpen = true; // Reopen voting
    }
}
