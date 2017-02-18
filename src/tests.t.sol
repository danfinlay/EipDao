pragma solidity ^0.4.0;

import "dapple/test.sol";
import "./EipVotesController.sol";

contract UnitTest is Test {

  EipVotesController dao;

  function setUp () {
    dao = new EipVotesController();
  }

  function testNonTokenHolder () {
    bool result = dao.canVote(0x0);
    assertFalse(result);
  }

  function testTokenHolder() {
    address piper = 0xd3CdA913deB6f67967B99D67aCDFa1712C293601;

    bool result = dao.canVote(piper);
    assertTrue(result);

    address dan = 0x55e2780588aa5000F464f700D2676fD0a22Ee160;
    bool danResult = dao.canVote(dan);
    assertTrue(danResult);
  }

}

