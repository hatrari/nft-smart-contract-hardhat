const { expect } = require("chai");

describe("Token contract", function() {
	it("Test #1", async function() {
		const [owner] = await ethers.getSigners();

		const Token = await ethers.getContractFactory("Token");
		
		const hardhatToken = await Token.deploy();
	
		await hardhatToken.mint(owner.address, 'test uri', 'hash1');
		const own = await hardhatToken.ownerOf(1);

		expect(own).to.equal(owner.address);
	});
});
