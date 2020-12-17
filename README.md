# Autostaking RewardPool for Multiple Assets (in the Harvest.finance)
## 【Introduction of Autostaking RewardPool for Multiple Assets】
- This is a smart contract for the pool to "automatically" stake the $FARM (that are earned by staking “normal” assets) into the Profit Sharing Pool while maintaining reasonable gas consumption for staking and unstaking assets.

&nbsp;

- Integrate Gelato into the Harvest.finance for automatic regular update that is rewards earned.
  ( https://docs.gelato.network/creating-an-automated-dapp )

&nbsp;


***

## 【Setup】
### ① Install modules
```
$ npm install
```

<br>

### ② Compile & migrate contracts (on Kovan testnet)
```
$ npm run migrate:kovan
```

<br>

### ③ Execute script (it's instead of testing)
※ In progress  


&nbsp;

***

## 【References】
- Harvest.finance  
  - Doc：https://farm.chainwiki.dev/en/contracts    
  - Smart Contract (Test is mainnet-fork approach)：https://github.com/harvest-finance/harvest  
  - FAQ：https://farm.chainwiki.dev/en/faq 
  - Addresses (Mainnet)：https://github.com/harvest-finance/harvest#addresses  
  - Existing dApp: https://harvest.finance/pool/profit-sharing-farm   
  - GR8 Bounty：https://gitcoin.co/issue/harvest-finance/harvest/15/100024325   

<br>

- Truffle test by using mainnet-fork approach:  
  https://medium.com/@samajammin/how-to-interact-with-ethereums-mainnet-in-a-development-environment-with-ganache-3d8649df0876

<br>

- Gelato
  - Doc
    - Condition: https://docs.gelato.network/creating-an-automated-dapp#conditions  
    - Action: https://docs.gelato.network/creating-an-automated-dapp#actions  
