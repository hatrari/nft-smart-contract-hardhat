require('@nomiclabs/hardhat-ethers');

module.exports = {
  solidity: "0.7.3",
	networks: {
		localhost: {
			url: 'http://127.0.0.1:8545',
			accounts: {
				mnemonic: 'feel shallow pair enter creek business volume second script above net bag'
			}
		},
		rinkeby: {
			url: 'https://rinkeby.infura.io/v3/93c484632ab74f578b0ab61b1a0e146c',
			accounts: {
				mnemonic: 'record excuse try include danger agree much rapid globe drastic profit edit'
			}
		}
	}
}; 
