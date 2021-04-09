pragma solidity ^0.5.16;
pragma experimental ABIEncoderV2;

import "../../contracts/Governance/GovernorBravoDelegate.sol";

// @notice Only use this contract for internal testing
contract GovernorBravoDelegateHarness is GovernorBravoDelegate {
	// @notice Harness initiate the GovenorBravo contract
	// @dev This function bypasses the need to initiate the GovernorBravo contract from an existing GovernorAlpha for testing.
	// Actual use will only use the _initiate(address) function
    function _initiate() public {
        proposalCount = 1;
        initialProposalId = 1;
    }
    
    function initialize(address timelock_, address comp_, uint votingPeriod_, uint votingDelay_, uint proposalThreshold_) public {
        require(msg.sender == admin, "GovernorBravo::initialize: admin only");
        require(address(timelock) == address(0), "GovernorBravo::initialize: can only initialize once");
        
        timelock = TimelockInterface(timelock_);
        comp = CompInterface(comp_);
        votingPeriod = votingPeriod_;
        votingDelay = votingDelay_;
        proposalThreshold = proposalThreshold_;
    }
}

// @notice Use this contract for testnet usage. It doesn't need to be initiated and it will allow any parameters on initialization
contract GovernorBravoDelegateTestnetHarness is GovernorBravoDelegate {
    /**
     * @notice Harness initiate the GovenorBravo contract
     * @dev This function bypasses the need to initiate the GovernorBravo contract from an existing GovernorAlpha for testnet usage.
     * @param acceptAdmin - should accept admin be called
     */
    function _initiate(bool acceptAdmin) external {
        require(msg.sender == admin, "GovernorBravo::_initiate: admin only");
        require(initialProposalId == 0, "GovernorBravo::_initiate: can only initiate once");
        proposalCount = 1;
        initialProposalId = 1;

        // Timelock admin may already be set to GovernorBravo
        if(acceptAdmin) {
            timelock.acceptAdmin();
        }
    }

    /**
     * @notice normal GovernorBravo initialize function without input validation
     */
    function initialize(address timelock_, address comp_, uint votingPeriod_, uint votingDelay_, uint proposalThreshold_) public {
        require(msg.sender == admin, "GovernorBravo::initialize: admin only");
        require(address(timelock) == address(0), "GovernorBravo::initialize: can only initialize once");
        
        timelock = TimelockInterface(timelock_);
        comp = CompInterface(comp_);
        votingPeriod = votingPeriod_;
        votingDelay = votingDelay_;
        proposalThreshold = proposalThreshold_;
    }
}