pragma solidity ^0.8.0;

contract VotingSystem {
    
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    
    struct Voter {
        bool voted;
        uint voteIndex;
        uint weight;
    }
    
    address public owner;
    mapping(address => Voter) public voters;
    Candidate[] public candidates;
    
    event NewCandidate(uint candidateId, string candidateName);
    event NewVote(uint candidateId, uint voteCount);
    
    constructor() {
        owner = msg.sender;
    }
    
    function addCandidate(string memory name) public {
        require(msg.sender == owner, "Only the owner can add candidates.");
        uint candidateId = candidates.length;
        candidates.push(Candidate(candidateId, name, 0));
        emit NewCandidate(candidateId, name);
    }
    
    function authorize(address voter) public {
        require(msg.sender == owner, "Only the owner can authorize voters.");
        require(!voters[voter].voted, "The voter already voted.");
        voters[voter].weight = 1;
    }
    
    function vote(uint voteIndex) public {
        Voter storage sender = voters[msg.sender];
        require(!sender.voted, "Already voted.");
        sender.voted = true;
        sender.voteIndex = voteIndex;
        candidates[voteIndex].voteCount += sender.weight;
        emit NewVote(voteIndex, candidates[voteIndex].voteCount);
    }
    
    function winningCandidate() public view returns (uint candidateId) {
        uint winningVoteCount = 0;
        for (uint i = 0; i < candidates.length; i++) {
            if (candidates[i].voteCount > winningVoteCount) {
                winningVoteCount = candidates[i].voteCount;
                candidateId = i;
            }
}
}
}