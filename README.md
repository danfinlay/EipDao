# EIP DAO

Uses [DappHub DS-Auth](https://github.com/dapphub/ds-auth) for security.
Voting rights are derived from [The Devcon 2 Token](https://github.com/pipermerriam/devcon2-token).

For a given EIP, any number of `Proposals` can be submitted.
A proposal has a link to an IPFS hash of a set of unit tests for the EIP proposal.
These unit tests should thoroughly describe and enforce the proposed RPC method.
These unit tests can then be used to derive democratic, real-time, automated compatability tables.

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

## The Current Hangup

A portion of the tests I haven't gotten working yet (I may not understand dapple properly).

I've used Dapple so far to develop, because I began developing in the presence of some friends who helped make it, so I got great coaching during that time.

I've now hit a wall, and I'm writing this to post on Dapple.chat.

I tried forking the ETH chain, and then running `dapple test`, and what I find is that it fails to correctly assert that two known devcon 2 token holders hold tokens!

I've even written up a quick `tokenTest.html` page to verify I do have a token, at the same address, using the same method as I'm trying in my solidity tests.

My question, I guess, is why is my forked chain not representing the devcon2 token contract correctly?

