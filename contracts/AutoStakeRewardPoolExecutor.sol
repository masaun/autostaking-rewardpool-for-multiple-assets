pragma solidity ^0.5.16;

/// [Note]: @openzeppelin v2.5.1
import { SafeMath } from "@openzeppelin/contracts/math/SafeMath.sol";

/// Harvest.finance
//import "./harvest-finance/RewardPool.sol";
import { NoMintRewardPool } from "./harvest-finance/RewardPool.sol";


/// Gelato
import { GelatoConditionsStandard } from "./gelato/GelatoConditionsStandard.sol";


/**
 * @notice - The AutoStakingForMultipleAssets contract that automate fetching and staking $FARM rewards (that are earned by normal assets)
 *         - Fetch $FARM rewards (by DAI, etc...) automatically.
 *         - Stake these $FARM rewards into the profit sharing auto-staking pool automatically.
 */
contract AutoStakeRewardPoolExecutor is GelatoConditionsStandard {
    using SafeMath for uint256;

    NoMintRewardPool public rewardPool;

    /// minimal interval to update rewards earned
    uint constant INTERVAL = 1 minutes;
    uint lastUpdated;    /// time last updated

    constructor(address _rewardPool) public {
        rewardPool = NoMintRewardPool(_rewardPool);
    }


    /***
     * @notice - Stake (Deposit) "FARM Reward token" into RewardPool every minutes.
     * @param stakeAmount - Stake amount of reward tokens ($FARM)
     **/
    function updateStakeRewardToken(uint stakeAmount) public returns (string memory) {
        /// only update if at least one interval has passed
        if (lastUpdated.add(INTERVAL) <= block.timestamp) {
            
            /// calculate time passed
            uint passed = block.timestamp.sub(lastUpdated);
            
            /// calculate intervals passed since last update
            uint time = passed.div(INTERVAL);

            /// update to current timestamp
            lastUpdated = block.timestamp;

            /// Claim rewards
            rewardPool.getReward();

            /// Get the retrieved rewards amount ($FARM) 
            uint claimedRewardAmount = rewardPool.earned(msg.sender);

            /// Stake generated reward tokens ($FARM) into the Reward Pool
            rewardPool.stake(claimedRewardAmount);

            return "Successful to stake FARM Reward tokens";
        }
    }


    ///---------------------------------------------------
    /// Gelato-related methods
    ///---------------------------------------------------

    /***
     * @notice - Source from: https://docs.gelato.network/creating-an-automated-dapp#conditions
     * @notice - returned method must be "view" method.
     **/
    function ok(uint256, bytes memory _conditionData, uint256)
        public
        view
        returns (string memory)
    {
        /// Current Executed-method
        //return updateStakeRewardToken();

        /// Old executed-method
        uint256 timestamp = abi.decode(_conditionData, (uint256));
        return timeCheck(timestamp);
    }

    // Specific implementation（Old executed-method）
    function timeCheck(uint256 _timestamp) public view returns(string memory) {
        if (_timestamp <= block.timestamp) return OK;
        return "NotOkTimestampDidNotPass";
    }

}
