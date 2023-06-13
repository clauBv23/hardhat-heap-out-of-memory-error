require('@nomicfoundation/hardhat-toolbox');
require('hardhat-contract-sizer');
require('@nomiclabs/hardhat-ganache');

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: '0.8.9',
  defaultNetwork: 'ganache',
  contractSizer: {
    // alphaSort: true,
    disambiguatePaths: false,
    // only: ['ReallyHugeContract'],
  },
};
