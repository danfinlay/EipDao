# Gitmocracy

It's a git-mocracy.  A git repository managed by a democracy!
No relationship to Guantanamo Bay.

Built on [Mango (decentralized git)](https://github.com/axic/mango).
Uses [Boardroom smart contracts](https://github.com/boardroom-project/boardroom-contracts) for governance.
Uses [DappHub DS-Auth](https://github.com/dapphub/ds-auth) for security.

Made possible by [Ethereum](https://ethereum.org/), [IPFS](https://ipfs.io), and

## Smart Contract Requirements

### Controller

These methods are required by [Mango](https://github.com/axic/mango/blob/master/TECH.md#contract-interface)

```
function snapshotCount() constant returns (uint count)
function getSnapshot(uint index) constant returns (string hash)
function addSnapshot(string hash)
```

These methods are required by [Boardroom](https://github.com/boardroom-project/boardroom-contracts/blob/master/contracts/Rules.sol)

```
function hasWon(uint _proposalID) public constant returns (bool);
function canVote(address _sender, uint _proposalID) public constant returns (bool);
function canPropose(address _sender) public constant returns (bool);
function votingWeightOf(address _sender, uint _proposalID) public constant returns (uint);
```

