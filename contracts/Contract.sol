// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "./openZContracts/governance/Governor.sol";
import "./openZContracts/governance/compatibility/GovernorCompatibilityBravo.sol";
import "./openZContracts/governance/extensions/GovernorVotes.sol";
import "./openZContracts/governance/extensions/GovernorVotesQuorumFraction.sol";
import "./openZContracts/governance/extensions/GovernorTimelockControl.sol";
import "./openZContracts/openZcontractsUpgradeable/token/ERC1155/presets/ERC1155PresetMinterPauserUpgradeable.sol";
import "./openZContracts/openZcontractsUpgradeable//mocks/WithInit.sol";
import "./MyGovernorVotesQuorumFraction.sol";
import "./MyContract.sol";

contract Contract is
    Governor,
    GovernorTimelockControl,
    GovernorCompatibilityBravo,
    GovernorVotes,
    GovernorVotesQuorumFraction,
    ERC1155PresetMinterPauserUpgradeable
{
    constructor(IVotes _token, TimelockController _timelock)
        Governor("MyGovernor")
        GovernorVotes(_token)
        GovernorVotesQuorumFraction(4)
        GovernorTimelockControl(_timelock)
    {
        __ERC1155PresetMinterPauser_init('uri');

    }


    function bigSizeFunc() public   {
        ERC1155PresetMinterPauserUpgradeable cont1 = new ERC1155PresetMinterPauserUpgradeable();

        IVotes votes =  IVotes(address(0));
        MyGovernorVotesQuorumFraction cont2 = new MyGovernorVotesQuorumFraction(votes);

        address[] memory proposers;
        address[] memory executors;
        TimelockController time = new TimelockController(0, proposers,executors , address(0));
        MyContract cont3 = new MyContract(votes, time);
    }

    function _msgSender() internal view virtual override(Context, ContextUpgradeable)  returns (address sender) {
        return address(0);
    }
    
    function _msgData() internal view virtual override(Context, ContextUpgradeable)  returns (bytes calldata) {
        
            return super._msgData();
        
    }

    function votingDelay() public pure override returns (uint256) {
        return 1; // 1 block
    }

    function votingPeriod() public pure override returns (uint256) {
        return 45818; // 1 week
    }

    function proposalThreshold() public pure override returns (uint256) {
        return 1000e18;
    }

    // The following functions are overrides required by Solidity.

    function quorum(uint256 blockNumber)
        public
        view
        override(IGovernor, GovernorVotesQuorumFraction)
        returns (uint256)
    {
        return super.quorum(blockNumber);
    }

    function state(uint256 proposalId)
        public
        view
        override(Governor, IGovernor, GovernorTimelockControl)
        returns (ProposalState)
    {
        return super.state(proposalId);
    }

    function propose(
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        string memory description
    ) public override(Governor, GovernorCompatibilityBravo, IGovernor) returns (uint256) {
        return super.propose(targets, values, calldatas, description);
    }

    function _execute(
        uint256 proposalId,
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        bytes32 descriptionHash
    ) internal override(Governor, GovernorTimelockControl) {
        super._execute(proposalId, targets, values, calldatas, descriptionHash);
    }

    function _cancel(
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        bytes32 descriptionHash
    ) internal override(Governor, GovernorTimelockControl) returns (uint256) {
        return super._cancel(targets, values, calldatas, descriptionHash);
    }

    function _executor() internal view override(Governor, GovernorTimelockControl) returns (address) {
        return super._executor();
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC1155PresetMinterPauserUpgradeable, Governor, GovernorTimelockControl, IERC165)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }


    // more useless functions 

     function _msgSender1() internal view virtual   returns (address sender) {
        return address(0);
    }
    
    function _msgData1() internal view virtual   returns (bytes calldata) {
        
            return super._msgData();
        
    }

    function votingDelay1() public pure  returns (uint256) {
        return 1; // 1 block
    }

    function votingPeriod1() public pure  returns (uint256) {
        return 45818; // 1 week
    }

    function proposalThreshold1() public pure  returns (uint256) {
        return 1000e18;
    }


    function quorum1(uint256 blockNumber)
        public
        view
        returns (uint256)
    {
        return super.quorum(blockNumber);
    }

    function state1(uint256 proposalId)
        public
        view
        returns (ProposalState)
    {
        return super.state(proposalId);
    }

    function propose1(
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        string memory description
    ) public returns (uint256) {
        return super.propose(targets, values, calldatas, description);
    }

    function _execute1(
        uint256 proposalId,
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        bytes32 descriptionHash
    ) internal {
        super._execute(proposalId, targets, values, calldatas, descriptionHash);
    }

    function _cancel1(
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        bytes32 descriptionHash
    ) internal returns (uint256) {
        return super._cancel(targets, values, calldatas, descriptionHash);
    }

    function _executor1() internal view  returns (address) {
        return super._executor();
    }

    function supportsInterface1(bytes4 interfaceId)
        public
        view
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }


    
}
