// SPDX-License-Identifier: MIT
/** @type import('hardhat/config').HardhatUserConfig */

require("@nomicfoundation/hardhat-toolbox");

const FORK_LOCAL = true;
const FORK_TESTNET = false;
let forkingSettings = undefined;

if (FORK_TESTNET) {
  forkingSettings = {
    url: 'https://api.avax.network/ext/bc/C/rpcc',
  };
}
if (FORK_LOCAL) {
  forkingSettings = {
    url: 'https://api.avax-test.network/ext/bc/C/rpc',
  };
}

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  networks: {
    hardhat: {
      gasPrice: 225000000000,
      chainId: !forkingSettings ? 43112 : undefined, // Only specify a chainId if we are not forking
      forking: forkingSettings
    },
    testnet: {
      url: 'https://api.avax-test.network/ext/bc/C/rpc',
      gasPrice: 225000000000,
      chainId: 43113,
      accounts: [
        '00ffa9244c2403faae4135e8865d035100fe3a24f17e76b868a3a2a9d2c048f5' // private key
      ]
    },
    mainnet: {
      url: 'https://api.avax.network/ext/bc/C/rpc',
      gasPrice: 225000000000,
      chainId: 43114,
      accounts: [
        '00ffa9244c2403faae4135e8865d035100fe3a24f17e76b868a3a2a9d2c048f5' // private key
      ]
    }
  },
  etherscan: {
    apiKey: "NYF1IC1VJUMMPJCJMFJ5I2BNW6W22FJCK2", // API Key
  }
};
