// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract Create {
    using Counters for Counters.Counter; 
    Counters.Counter public _candidateId;
    Counters.Counter public _voterId;

    address public votingOrganizer;

    // Candidate 
    struct Candidate {
        uint256 candidateId;
        string name;
        string age;
        string image;
        uint256 voteCount;
        address _address;
        string ipfs;

    }

    event CandidateCreate (
        uint256 indexed candidateId,
        string name,
        string age,
        string image,
        uint256 voteCount,
        address _address,
        string ipfs
    );

address[] public candidatesAddress;
    mapping(address => Candidate) public candidates;

    

/// end of candidate data

//--------voter data

address[] public votedVoters;

address[] public votersAddress;
mapping(address => Voter) public voters;

struct Voter {
    uint256 voter_voterId;
    string voter_name;
    string voter_image;
    address voter_allowed;
    bool voter_voted;
    uint256 voter_vote;
    string voter_ipfs;
}




event VoterCreate (
    uint256 indexed voter_voterId,
    string voter_name,
    string voter_image,
    address voter_allowed,
    bool voter_voted,
    uint256 voter_vote,
    string voter_ipfs
);




// ------End of voter data

constructor() {
    votingOrganizer = msg.sender;
}


function setCandidate(address _address, string memory _age, string memory _name, string
memory _image, string memory _ipfs) 
public {

    require(votingOrganizer == msg.sender, "Only the voting organizer can set candidates.");
    _candidateId.increment();

    uint256 idNumber = _candidateId.current();

    Candidate storage candidate =candidates[_address];

    candidate.age=_age;
    candidate.name=_name;
    candidate.image=_image;
    candidate.candidateId=idNumber;
    candidate.voteCount=0;
    candidate._address=_address;
    candidate.ipfs=_ipfs;

    candidatesAddress.push(_address);

    emit CandidateCreate(idNumber, _name, _age, _image, 0, _address, _ipfs);




}

function getCandidate() public view returns (address[] memory) {
    return candidatesAddress;
}

function getCandidateLength() public view returns (uint256) {
    return candidatesAddress.length;
}

function getCandidatedata

}