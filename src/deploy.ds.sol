pragma solidity ^0.4.0;

import "ds-whitelist/whitelist.sol";
import "dapple/script.sol";

contract Deployer is Script {

  function Deployer () {
    var authority = new DSWhitelist();
    exportObject("authority", authority);
  }

}
