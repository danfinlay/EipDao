pragma solidity ^0.4.0;

import "ds-auth/DSAuth.sol";
import "devcon2tokenIdChecker/IndividualityTokenInterface.sol";
import "boardroom-rules/Rules.sol";
import "./Interface.sol";

contract EipVotesController is DSAuth, Rules, EipVotesInterface {
  address tokenAddress =	0xdd94De9cFE063577051A5eb7465D08317d8808B6;

  function vote(uint _proposalId, bool _position) {

  }

  function hasWon(uint _proposalID) public constant returns (bool) {
    return false;
  }

  function canVote(address _sender, uint _proposalID) public constant returns (bool) {
    return hasToken(_sender);
  }

  function canPropose(address _sender) public constant returns (bool) {
    return hasToken(_sender);
  }

  function votingWeightOf(address _sender, uint _proposalID) public constant returns (uint) {
    return 1;
  }

  function hasToken(address _sender) returns (bool) {
    IndividualityTokenInterface token = IndividualityTokenInterface(tokenAddress);
    bytes32 tokenId = token.tokenId(tx.origin);
    if (tokenId == 0x0) {
      return false;
    } else {
      return true;
    }
  }

}


