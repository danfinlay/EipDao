pragma solidity ^0.4.0;

import "dapple/test.sol";
import "./EipDaoFrontend.sol";

contract UnitTest is Test {

  EipVotesFrontend dao;

  function setUp () {
    dao = new EipVotesFrontend();
  }

  function testSetController() {
    address first = 0x01;
    address second = 0x02;

    dao.setController(first);
    address firstResult = dao.getController();
    assertEq(firstResult, first);

    dao.setController(second);
    address secondResult = dao.getController();
    assertEq(secondResult, second);
  }
}
