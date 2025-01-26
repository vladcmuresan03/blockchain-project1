require("@nomiclabs/hardhat-ethers");

        module.exports = {
          solidity: "0.8.28",
          networks: {
            anvil: {
              url: "http://34.154.156.240:8545",  // Anvil default RPC URL
              accounts: ["59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d"]
            },
          },
        };
