pragma solidity ^0.4.0;

import "ds-auth/DSAuth.sol";
import "boardroom-rules/Rules.sol";
import "./EipVotesController.sol";
import "./Interface.sol";

contract EipVotesFrontend is Rules, DSAuth, EipVotesInterface {

  EipVotesInterface public controller;

  event Voted(address voter, bytes32 proposal, bool vote);
  event Proposed(address proposer, bytes32 proposal);

  function setController (address _newController) auth {
    controller = EipVotesInterface(_newController);
  }

  function getController() auth returns (address) {
    return controller;
  }

  function emitVoted(address _voter, bytes32 _proposal, bool _position) auth {
    Voted(_voter, _proposal, _position);
  }

  function emitProposed(address _proposer, bytes32 _proposal) auth {
    Proposed(_proposer, _proposal);
  }

  function propose(bytes32 _proposalId) {
    controller.propose(_proposalId);
  }

  function setVote(bytes32 _proposalId, bool _position) {
    controller.setVote(_proposalId, _position);
  }

  function getVote(bytes32 _proposalId, address _voter) returns (bool) {
    return controller.getVote(_proposalId, _voter);
  }

  function result(bytes32 _proposalId) returns (uint, uint) {
    return controller.result(_proposalId);
  }

  function hasWon(uint _proposalID) public constant returns (bool) {
    return false;
  }

  function canVote(address _sender, uint _proposalID) public constant returns (bool) {
    return controller.canVote(_sender, _proposalID);
  }

  function canPropose(address _sender) public constant returns (bool) {
    return controller.canPropose(_sender);
  }

  function votingWeightOf(address _sender, uint _proposalID) public constant returns (uint) {
    return 1;
  }

}


