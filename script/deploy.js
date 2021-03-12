const { ethers } = require('hardhat');

async function main() {
  const Token = await ethers.getContractFactory('Token');
	const token = await Token.deploy();
	console.log('Token deployed at: ', token.address);
}

main();
