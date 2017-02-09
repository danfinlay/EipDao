pragma solidity ^0.4.0;

import "ds-auth/DSAuth.sol";
import "boardroom-rules/Rules.sol";
import "./EipVotesController.sol";

contract EipVotesInterface is Rules {

  function setVote(bytes32 _proposalId, bool _position);
  function getVote(bytes32 _proposalId, address _voter) returns (bool);
  function result(bytes32 _proposalId) returns (uint for, uint against);
  function propose(bytes32 _proposalId);

}

