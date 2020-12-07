pragma solidity ^0.5.16;

/**
 * @notice - The AutoStakingForMultipleAssets contract that automate fetching and staking $FARM rewards (that are earned by normal assets)
 *         - Fetch $FARM rewards (by DAI, etc...) automatically.
 *         - Stake these $FARM rewards into the profit sharing auto-staking pool automatically.
 */
contract AutoStakingRewardPoolForMultipleAssets {

    constructor() public {}

    // Deposit LP tokens to MasterChef for SUSHI allocation.
    function deposit(uint256 _pid, uint256 _amount) public;

    // Withdraw LP tokens from MasterChef.
    function withdraw(uint256 _pid, uint256 _amount) public;

    // There are no definition in the IMasterChef.sol on SushiSwap
    function userInfo(uint256 _pid, address _user) public view returns (uint256 amount, uint256 rewardDebt);
    function poolInfo(uint256 _pid) public view returns (address lpToken, uint256, uint256, uint256);
    
    // Update reward variables for all pools. Be careful of gas spending!
    function massUpdatePools() public;
    
    // View function to see pending SUSHIs on frontend.
    function pendingSushi(uint256 _pid, address _user) public view returns (uint256 amount);

    // interface reused for pickle
    function pendingPickle(uint256 _pid, address _user) public view returns (uint256 amount);

}
