pragma solidity ^0.5.16;

/**
 * The contractName contract does this and that...
 */
contract Election {
  
  // candiate model
  struct Candidate {
  	uint id;
  	string name;
  	uint voteCount;
  }

  // hash or dictionary structure to hold candidates
  mapping(uint => Candidate) public candidates;

  // accounts that voted
  mapping(address => bool) public voters;

  // store number of candidates
  uint public candidatesCount;


  constructor() public {
  	addCandidate("Candidate 1");
  	addCandidate("Candidate 2");
  }

  function addCandidate (string memory _name) private {
  	candidatesCount ++;
  	candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }

  function vote (uint _candidateId) public {
    require(!voters[msg.sender]);

    require(_candidateId > 0 && _candidateId <= candidatesCount);

    voters[msg.sender] = true;

    candidates[_candidateId].voteCount ++; 
  }
}

