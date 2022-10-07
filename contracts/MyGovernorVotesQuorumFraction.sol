// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "./openZContracts/governance/Governor.sol";
import "./openZContracts/governance/compatibility/GovernorCompatibilityBravo.sol";
import "./openZContracts/governance/extensions/GovernorVotes.sol";
import "./openZContracts/governance/extensions/GovernorVotesQuorumFraction.sol";
import "./openZContracts/governance/extensions/GovernorTimelockControl.sol";
import "./openZContracts/openZcontractsUpgradeable/token/ERC1155/presets/ERC1155PresetMinterPauserUpgradeable.sol";
import "./openZContracts/openZcontractsUpgradeable//mocks/WithInit.sol";


contract MyGovernorVotesQuorumFraction is GovernorVotesQuorumFraction {
  constructor(IVotes _token)
      Governor("MyGovernor")
        GovernorVotes(_token)
        GovernorVotesQuorumFraction(4)  {

  }

  function COUNTING_MODE() public pure virtual override returns (string memory) {}

  function votingDelay() public view virtual override returns (uint256) {}

  function votingPeriod() public view virtual override returns (uint256) {}

  function hasVoted(uint256 proposalId, address account) public view virtual override returns (bool) {}

  function _quorumReached(uint256 proposalId) internal view virtual override returns (bool) {}

  function _voteSucceeded(uint256 proposalId) internal view virtual override returns (bool) {}

  function _countVote(
    uint256 proposalId,
    address account,
    uint8 support,
    uint256 weight,
    bytes memory params
  ) internal virtual override {}
}
