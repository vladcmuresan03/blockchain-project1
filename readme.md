This file contains my progress in working on the Final Project for the Blockchain Subject

- created google cloud VM instance
  
- installed foundry for Ethereum using
  `$ curl -L https://foundry.paradigm.xyz | bash
  *then opening new instance*
  `$ foundryup`
  
- installed Homebrew for Sui Client:
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  - Run these commands in your terminal to add Homebrew to your PATH:
    $ echo >> /home/agnarsus/.bashrc
    $ echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/agnarsus/.bashrc
    $ eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	- Install Homebrew's dependencies if you have sudo access:
    $ sudo apt-get install build-essential
	  For more information, see: https://docs.brew.sh/Homebrew-on-Linux
	- We recommend that you install GCC:
    brew install gcc
	- *Run brew help to get started*

- installing Sui using Homebrew:
  `$ brew install sui`
  
- starting Anvil for the first time and binding it to interfaces
  `$ anvil --host 0.0.0.0`
  Result:  `Listening on 0.0.0.0:8545`
  *after this i had to open the 8545 port in the VM firewall settings*
  `$ sui start` results in 
	`2025-01-22T19:05:29.984793Z ERROR mysten_metrics::thread_stall_monitor: Thread stalled for 509ms`
	`2025-01-22T19:05:31.744825Z ERROR mysten_metrics::thread_stall_monitor: Thread stall cleared after 2219ms`
	A colleague said that it would work in spite of this error appearing, so we are going forward

-  `$ ps aux | grep sui` - command used for checking if a Sui related process is running
	- for stopping a running process, do this command, find the Process ID (PID) and then `kill <PID>`
  
-  `$ sui start > sui.log 2>&1 &` - start the node in the background with logging enabled
  
-  `$ tail -f sui.log` - command used to monitor the nods
  
-  `$ ss -tuln | grep 9000` command used to ensure port 9000 is available (apparently port 9000 is default)
  
-  `$ top` - command for checking system resources
	  	- for stopping a running process, do this command, find the Process ID (PID) and then `kill <PID>`
  
-  `$ sui client gas` - command for checking that the wallet has gas coins
    ```
    ╭────────────────────────────────────────────────────────────────────┬────────────────────┬──────────────────╮
	│ gasCoinId                                                          │ mistBalance (MIST) │ suiBalance (SUI) │
	├────────────────────────────────────────────────────────────────────┼────────────────────┼──────────────────┤
	│ 0x73dcc3e0e161f152134907ff7f02d9d5a074ba0b94d06edf3aa4336309446307 │ 30000000000000000  │ 30.00M           │
	│ 0x856e90c4c992d27ea6b453de87423101d80a6a85429256a3ba094d1bf9168f65 │ 30000000000000000  │ 30.00M           │
	│ 0xb0e5045584a5ce3f06c1160370313237cd6969ca3df73f2349717d2576eb1f5c │ 30000000000000000  │ 30.00M           │
	│ 0xcebbe4a2c3334df0f86bf1a4d4765b0bfd4a04417a01ebc28370dac67f98e1ec │ 30000000000000000  │ 30.00M           │
	│ 0xfa767d02dfbfc2ce667f172eb05dcf42fdaabb862a5de3d1401da0818ae3ba41 │ 30000000000000000  │ 30.00M           │
	╰────────────────────────────────────────────────────────────────────┴────────────────────┴──────────────────╯
	```

- `$ sui client objects` - command used for checking if blockchain objects (coins in our case) are initialized and accessible
  ```
	╭───────────────────────────────────────────────────────────────────────────────────────╮
	│ ╭────────────┬──────────────────────────────────────────────────────────────────────╮ │
	│ │ objectId   │  0x73dcc3e0e161f152134907ff7f02d9d5a074ba0b94d06edf3aa4336309446307  │ │
	│ │ version    │  1                                                                   │ │
	│ │ digest     │  ZYVWSnAsgxYBCU57bdG2j8bC/Cq6B4Rs2RHcin1M00A=                        │ │
	│ │ objectType │  0x0000..0002::coin::Coin                                            │ │
	│ ╰────────────┴──────────────────────────────────────────────────────────────────────╯ │
	│ ╭────────────┬──────────────────────────────────────────────────────────────────────╮ │
	│ │ objectId   │  0x856e90c4c992d27ea6b453de87423101d80a6a85429256a3ba094d1bf9168f65  │ │
	│ │ version    │  1                                                                   │ │
	│ │ digest     │  4NHT4VLPBTWVIvNWSTdos4VuiFh2eEKKACvkB7vESWM=                        │ │
	│ │ objectType │  0x0000..0002::coin::Coin                                            │ │
	│ ╰────────────┴──────────────────────────────────────────────────────────────────────╯ │
	│ ╭────────────┬──────────────────────────────────────────────────────────────────────╮ │
	│ │ objectId   │  0xb0e5045584a5ce3f06c1160370313237cd6969ca3df73f2349717d2576eb1f5c  │ │
	│ │ version    │  1                                                                   │ │
	│ │ digest     │  NtbLI5IY1PDR0BsmL5bE9ZLIyV2/WehbyGbERWY2FC8=                        │ │
	│ │ objectType │  0x0000..0002::coin::Coin                                            │ │
	│ ╰────────────┴──────────────────────────────────────────────────────────────────────╯ │
	│ ╭────────────┬──────────────────────────────────────────────────────────────────────╮ │
	│ │ objectId   │  0xcebbe4a2c3334df0f86bf1a4d4765b0bfd4a04417a01ebc28370dac67f98e1ec  │ │
	│ │ version    │  1                                                                   │ │
	│ │ digest     │  iiNy456JeivMci7bcH/0crrcgAMjRrGJIErtGQmjVfk=                        │ │
	│ │ objectType │  0x0000..0002::coin::Coin                                            │ │
	│ ╰────────────┴──────────────────────────────────────────────────────────────────────╯ │
	│ ╭────────────┬──────────────────────────────────────────────────────────────────────╮ │
	│ │ objectId   │  0xfa767d02dfbfc2ce667f172eb05dcf42fdaabb862a5de3d1401da0818ae3ba41  │ │
	│ │ version    │  1                                                                   │ │
	│ │ digest     │  zR27M7+U9IKgJ/7cBqFvzY6QzFiMmebm1kpS5N71SsY=                        │ │
	│ │ objectType │  0x0000..0002::coin::Coin                                            │ │
	│ ╰────────────┴──────────────────────────────────────────────────────────────────────╯ │
	╰───────────────────────────────────────────────────────────────────────────────────────╯
	```

- `$ anvil --host 0.0.0.0 --port 8545 > anvil.log 2>&1 &` - command used for starting anvil in the background

- `$ ss -tuln | grep 8545` command used to ensure port 8545 is available

- connect to the RPC URLs of the VMs running Anvil and Sui respectively using MetaMask for Ethereum and Nightly for Sui (As Sui Wallet doesn't have the option of choosing a custom RPC URL) (both are browser extensions)

- installing Node.js
  `$ sudo apt update`
  `$ sudo apt install nodejs npm -y`

- installing Hardhat and other dependencies for the Ethereum contract
  `mkdir IBTToken`
  `cd IBTToken`
  `npm init -y`
  `npm install --save-dev hardhat @openzeppelin/contracts ethers`


- creating Ethereum contract
  ```
  mkdir -p contracts
  touch contracts/IBTToken.sol
  nano contracts/IBTToken.sol
	```
	then paste this and save it:
	```
	// SPDX-License-Identifier: MIT
	pragma solidity ^0.8.0;
	
	import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
	import "@openzeppelin/contracts/access/Ownable.sol";
	
	contract IBTToken is ERC20, Ownable {
	
	    constructor() ERC20("IBT", "IBT") {
	        // Initial supply of tokens (optional, can be set to 0 or any value)
	        _mint(msg.sender, 1000 * 10 ** decimals()); // Mint 1000 IBT tokens to the deployer
	    }
	
	    // Mint function: Only the contract owner (deployer) can mint tokens
	    function mint(address to, uint256 amount) public onlyOwner {
	        _mint(to, amount);
	    }
	
	    // Burn function: Only the contract owner (deployer) can burn tokens
	    function burn(uint256 amount) public onlyOwner {
	        _burn(msg.sender, amount);
	    }
	}
	```
	
	error fixing:
	`sudo apt update`
	`curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -`
	`sudo apt install -y nodejs`
	
	then `nano hardhat.config.js` and paste this:
	
	```
	require("@nomiclabs/hardhat-ethers"); // Ensure you have this plugin installed!!!!!
	
	module.exports = {
	  solidity: "0.8.28",  // Set your Solidity version (you can adjust this)
	  networks: {
	    anvil: {
	      url: "http://34.154.156.240:8545",  // Anvil default RPC URL
	      accounts: ["6e6aef59e5640617910cd92382e3a8cd24a19563bb495e6a7e86d88caa3636d3"] // add your deployer's private key
	    },
	  },
	};
	```



	 private key of the wallet which receives the ETHEREUM: 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
	 command to activate the script which sens 10k ETH:
	 `npx hardhat run scripts/deploy.js --network anvil`


- creating Sui contract
  `mkdir ~/IBTToken`
  `cd ~/IBTToken`
  `sui move new ibt`
  `nano ibt/sources/module.move`
  ```
  module {{ADDR}}::ibt {
    use sui::coin;
    use sui::transfer;
    use sui::tx_context;

    // Resource representing the deployer's authority
    struct IBT<phantom T> has key, store {}

    public fun mint(
        admin: &IBT<phantom T>,
        amount: u64,
        ctx: &mut tx_context::TxContext
    ): coin::Coin<T> {
        coin::mint(amount, ctx)
    }

    public fun burn(
        admin: &IBT<phantom T>,
        coin: coin::Coin<T>) {
        coin::burn(coin)
    }

    // Entry function for deploying the contract
    public entry fun deploy(ctx: &mut tx_context::TxContext): IBT<phantom T> {
        transfer::freeze_object(IBT {})
    }```

	
