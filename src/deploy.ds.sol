pragma solidity ^0.4.0;

import { WhitelistAuthority } from "whitelist-authority/contracts/WhitelistAuthority.sol";
import "dapple/script.sol";

contract Deployer is Script {

  function Deployer () {
    var authority = new WhitelistAuthority();
    exportObject("authority", authority);
  }

}
