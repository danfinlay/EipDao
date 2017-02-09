pragma solidity ^0.4.0;

import "ds-auth/DSAuth.sol";
import "boardroom-rules/Rules.sol";
import "./EipVotesController.sol";
import "./Interface.sol";

contract EipVotesFrontend is Rules, DSAuth, EipVotesInterface {

  EipVotesInterface private _controller;

  event Voted(address voter, bytes32 proposal, bool vote);
  event Proposed(address proposer, bytes32 proposal);

  function setController (address _newController) auth {
    _controller = _newController;
  }

  function getController () returns (EipVotesInterface) {
    return _controller;
  }

  function emitVoted(address _voter, bytes32 _proposal, bool _position) auth {
    Voted(_voter, _proposal, _position);
  }

  function emitProposed(address _proposer, bytes32 _proposal) auth {
    Proposed(_proposer, _proposal);
  }

  function propose(bytes32 _proposalId) {
    _controller.propose(_proposalId);
  }

  function setVote(bytes32 _proposalId, bool _position) {
    _controller.setVote(_proposalId, _position);
  }

  function getVote(bytes32 _proposalId, address _voter) returns (bool) {
    return _controller.getVote(_proposalId, _voter);
  }

  function result(bytes32 _proposalId) returns (uint for, uint against) {
    return _controller.result(_proposalId);
  }

}


