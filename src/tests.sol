pragma solidity ^0.4.0;

import "dapple/test.sol";
import "./EipVotesController.sol";

contract UnitTest is Test {

  EipVotesController dao;

  function setUp () {
    dao = new EipVotesController();
  }

}

