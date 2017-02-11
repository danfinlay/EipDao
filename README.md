# EIP Signal Voter

Uses [Boardroom smart contracts](https://github.com/boardroom-project/boardroom-contracts) for governance.
Uses [DappHub DS-Auth](https://github.com/dapphub/ds-auth) for security.

Made possible by [Ethereum](https://ethereum.org/) and [IPFS](https://ipfs.io).

## Local Installation

```
npm i -g dapple
dapple pkg install # Not sure this is it!
```

### Controller

These methods are required by [Boardroom](https://github.com/boardroom-project/boardroom-contracts/blob/master/contracts/Rules.sol)

```
function hasWon(uint _proposalID) public constant returns (bool);
function canVote(address _sender, uint _proposalID) public constant returns (bool);
function canPropose(address _sender) public constant returns (bool);
function votingWeightOf(address _sender, uint _proposalID) public constant returns (uint);
```

These methods exist on DS-Store, and need to be used by the controller:

```
function set(bytes32 key, bytes32 value)
function get(bytes32 key)
```

## Running Tests

Requires forking the main-net blockchain, to test integration with the Devcon2 token contracts.

```
➜  eip-dao git:(master) ✗ dapple chain new
? Chain name forketh
? Select chain type fork ETH

$ dapple test
```

