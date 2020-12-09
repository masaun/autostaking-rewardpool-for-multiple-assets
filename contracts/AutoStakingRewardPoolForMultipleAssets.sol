pragma solidity ^0.5.16;

/// [Note]: @openzeppelin v2.5.1
import { SafeMath } from "@openzeppelin/contracts/math/SafeMath.sol";


/**
 * @notice - The AutoStakingForMultipleAssets contract that automate fetching and staking $FARM rewards (that are earned by normal assets)
 *         - Fetch $FARM rewards (by DAI, etc...) automatically.
 *         - Stake these $FARM rewards into the profit sharing auto-staking pool automatically.
 */
contract AutoStakingRewardPoolForMultipleAssets {
    using SafeMath for uint;

    /// minimal interval to update rewards earned
    uint constant INTERVAL = 1 minutes;
    uint lastUpdated;    /// time last updated

    constructor() public {}

    /***
     * @notice - Stake (Deposit) "FARM Reward token" into RewardPool every minutes.
     **/
    function updateRewardTokenStakeStatus() public {
        /// only update if at least one interval has passed
        if (lastUpdated.add(INTERVAL) <= block.timestamp) {
            
            /// calculate time passed
            uint passed = block.timestamp.sub(lastUpdated);
            
            /// calculate intervals passed since last update
            uint time = passed.div(INTERVAL);

            /// update to current timestamp
            lastUpdated = block.timestamp;
        }
    }


}
