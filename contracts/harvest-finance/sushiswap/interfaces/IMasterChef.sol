pragma solidity 0.5.16;

interface IMasterChef {
    // Deposit LP tokens to MasterChef for SUSHI allocation.
    function deposit(uint256 _pid, uint256 _amount) external;
    
    // Withdraw LP tokens from MasterChef.
    function withdraw(uint256 _pid, uint256 _amount) external;

    // There are no definition in the IMasterChef.sol on SushiSwap
    function userInfo(uint256 _pid, address _user) external view returns (uint256 amount, uint256 rewardDebt);
    function poolInfo(uint256 _pid) external view returns (address lpToken, uint256, uint256, uint256);

    // Update reward variables for all pools. Be careful of gas spending!
    function massUpdatePools() external;

    // View function to see pending SUSHIs on frontend.
    function pendingSushi(uint256 _pid, address _user) external view returns (uint256 amount);

    // interface reused for pickle
    function pendingPickle(uint256 _pid, address _user) external view returns (uint256 amount);
}
