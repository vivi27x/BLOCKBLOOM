// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";

/**
 * College Election Contract
 * Implements a decentralized voting system for college elections
 * Author : Vivek
 */

contract Gymkhana_elections is Ownable, ReentrancyGuard, Pausable {
    enum ElectionState { SETUP, VOTING, ENDED }
    
    struct Candidate {
        uint256 id;
        string name;
        string description;
        uint256 voteCount;
        bool isActive;
    }
    
    struct ElectionInfo {
        string title;
        string description;
        uint256 startTime;
        uint256 endTime;
        ElectionState state;
        uint256 totalVotes;
    }
    
    // State variables
    ElectionInfo public electionInfo;
    mapping(uint256 => Candidate) public candidates;
    mapping(address => bool) public hasVoted;
    mapping(address => bool) public eligibleVoters;
    uint256 public candidateCount;
    
    // Events
    event ElectionCreated(string title, uint256 startTime, uint256 endTime);
    event CandidateAdded(uint256 indexed candidateId, string name);
    event VoteCast(address indexed voter, uint256 indexed candidateId);
    event ElectionStarted(uint256 timestamp);
    event ElectionEnded(uint256 timestamp);
    event VoterRegistered(address indexed voter);
    
    // Modifiers
    modifier onlyDuringSetup() {
        require(electionInfo.state == ElectionState.SETUP, "Election is not in setup phase");
        _;
    }
    
    modifier onlyDuringVoting() {
        require(electionInfo.state == ElectionState.VOTING, "Election is not active");
        require(block.timestamp >= electionInfo.startTime, "Election has not started yet");
        require(block.timestamp <= electionInfo.endTime, "Election has ended");
        _;
    }
    
    modifier onlyEligibleVoter() {
        require(eligibleVoters[msg.sender], "You are not eligible to vote");
        _;
    }
    
    modifier hasNotVoted() {
        require(!hasVoted[msg.sender], "You have already voted");
        _;
    }
    
    // Constructor with explicit parameter passing to parent contracts
    constructor(address initialOwner) 
        Ownable(initialOwner) 
        ReentrancyGuard() 
        Pausable() 
    {
        electionInfo.state = ElectionState.SETUP;
    }
    
    function createElection(
        string memory _title,
        string memory _description,
        uint256 _durationInHours
    ) external onlyOwner onlyDuringSetup {
        require(bytes(_title).length > 0, "Election title cannot be empty");
        require(_durationInHours > 0, "Duration must be greater than 0");
        
        electionInfo.title = _title;
        electionInfo.description = _description;
        electionInfo.startTime = 0; // Will be set when election starts
        electionInfo.endTime = 0;   // Will be calculated when election starts
        electionInfo.totalVotes = 0;
        
        emit ElectionCreated(_title, electionInfo.startTime, electionInfo.endTime);
    }
    
    function addCandidate(
        string memory _name,
        string memory _description
    ) external onlyOwner onlyDuringSetup {
        require(bytes(_name).length > 0, "Candidate name cannot be empty");
        
        candidates[candidateCount] = Candidate({
            id: candidateCount,
            name: _name,
            description: _description,
            voteCount: 0,
            isActive: true
        });
        
        emit CandidateAdded(candidateCount, _name);
        candidateCount++;
    }
    
    function registerVoters(address[] memory _voters) external onlyOwner onlyDuringSetup {
        for (uint256 i = 0; i < _voters.length; i++) {
            eligibleVoters[_voters[i]] = true;
            emit VoterRegistered(_voters[i]);
        }
    }
    
    function registerVoter(address _voter) external onlyOwner onlyDuringSetup {
        require(_voter != address(0), "Invalid voter address");
        eligibleVoters[_voter] = true;
        emit VoterRegistered(_voter);
    }
    
    function startElection(uint256 _durationInHours) external onlyOwner onlyDuringSetup {
        require(candidateCount >= 2, "At least 2 candidates required");
        require(_durationInHours > 0, "Duration must be greater than 0");
        
        electionInfo.state = ElectionState.VOTING;
        electionInfo.startTime = block.timestamp;
        electionInfo.endTime = block.timestamp + (_durationInHours * 1 hours);
        
        emit ElectionStarted(block.timestamp);
    }
    
    function vote(uint256 _candidateId) 
        external 
        onlyDuringVoting 
        onlyEligibleVoter 
        hasNotVoted 
        nonReentrant 
        whenNotPaused 
    {
        require(_candidateId < candidateCount, "Invalid candidate ID");
        require(candidates[_candidateId].isActive, "Candidate is not active");
        
        hasVoted[msg.sender] = true;
        candidates[_candidateId].voteCount++;
        electionInfo.totalVotes++;
        
        emit VoteCast(msg.sender, _candidateId);
    }
    
    function endElection() external onlyOwner {
        require(
            electionInfo.state == ElectionState.VOTING,
            "Election is not active"
        );
        
        electionInfo.state = ElectionState.ENDED;
        emit ElectionEnded(block.timestamp);
    }
    
    function getResults() external view returns (Candidate[] memory) {
        require(
            electionInfo.state == ElectionState.ENDED || 
            (electionInfo.state == ElectionState.VOTING && block.timestamp > electionInfo.endTime),
            "Results not available yet"
        );
        
        Candidate[] memory results = new Candidate[](candidateCount);
        for (uint256 i = 0; i < candidateCount; i++) {
            results[i] = candidates[i];
        }
        return results;
    }
    
    function getElectionInfo() external view returns (ElectionInfo memory) {
        return electionInfo;
    }
    
    function getCandidate(uint256 _candidateId) external view returns (Candidate memory) {
        require(_candidateId < candidateCount, "Invalid candidate ID");
        return candidates[_candidateId];
    }
    

    function getAllCandidates() external view returns (Candidate[] memory) {
        Candidate[] memory allCandidates = new Candidate[](candidateCount);
        
        for (uint256 i = 0; i < candidateCount; i++) {
            allCandidates[i] = candidates[i];
            
            // Hide vote counts during active election
            if (electionInfo.state == ElectionState.VOTING && block.timestamp <= electionInfo.endTime) {
                allCandidates[i].voteCount = 0;
            }
        }
        
        return allCandidates;
    }

    function isEligibleVoter(address _voter) external view returns (bool) {
        return eligibleVoters[_voter];
    }
    
    function hasVoterVoted(address _voter) external view returns (bool) {
        return hasVoted[_voter];
    }
    
    function pause() external onlyOwner {
        _pause();
    }

    function unpause() external onlyOwner {
        _unpause();
    }
}
