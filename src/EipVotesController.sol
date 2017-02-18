pragma solidity ^0.4.0;

import "ds-auth/DSAuth.sol";
import "devcon2tokenIdChecker/IndividualityTokenInterface.sol";
import "boardroom-rules/Rules.sol";
import "./Interface.sol";
import "sol-proposal-address-vote-db/proposal-vote-db.sol";

contract EipVotesController is DSAuth {
  address tokenAddress = 0xdd94de9cfe063577051a5eb7465d08317d8808b6;
  ProposalVoteDb db;

  function setDb(address _dbAddr) {
    db = ProposalVoteDb(_dbAddr);
  }

  modifier onlyHolders {
    if (!canVote(msg.sender)) {
      throw;
    }
    _;
  }

  function setVote(bytes32 _proposalId, bool _position) onlyHolders {
    IndividualityTokenInterface token = IndividualityTokenInterface(tokenAddress);
    bytes32 _voter = token.tokenId(tx.origin);
    db.setVote(_proposalId, _voter, _position);
  }

  function propose(bytes32 _proposalId) {

  }

  function getVote(bytes32 _proposalId, address _voter) returns (bool) {
    return false;
  }

  function result(bytes32 _proposalId) returns (uint, uint) {
    return (1, 2);
  }

  function hasWon(uint _proposalID) public constant returns (bool) {
    return false;
  }

  function canVote(address _sender) public constant returns (bool) {
    return hasToken(_sender);
  }

  function canPropose(address _sender) public constant returns (bool) {
    return hasToken(_sender);
  }

  function votingWeightOf(address _sender, uint _proposalID) public constant returns (uint) {
    return 1;
  }

  function hasToken(address _sender) returns (bool) {
    //@info checking if `address _sender` has token
    IndividualityTokenInterface token = IndividualityTokenInterface(tokenAddress);
    return token.isTokenOwner(msg.sender);
  }

}


