// const hre = require("hardhat");
const { ethers } = require("hardhat");

main();

async function main() {

    const [signer] = await ethers.getSigners()
    // impersonate account; replace with an address that actually has your token
    const addressWithTokens = "0xBE0eB53F46cd790Cd13851d5EFf43D12404d33E8"
    const myAddress = "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"

    const impersonatedSigner = await ethers.getImpersonatedSigner(addressWithTokens);


    // Print the balances of two of our accounts to the console
    await ethers.provider.getBalance(addressWithTokens).then(console.log); // insert address of account 1 
    await ethers.provider.getBalance(myAddress).then(console.log); // insert address of account 2

    // connect it to the impersonated signer and send it to your signer

    await impersonatedSigner.sendTransaction({
        to: myAddress,
        value: ethers.utils.parseEther('1000'), // make sure you have enough ETH on this account.
    })
    // Print the new balances of two of our accounts to the console
    ethers.provider.getBalance(addressWithTokens).then(console.log); // insert address of account 1 
    ethers.provider.getBalance(myAddress).then(console.log); // insert address of account 2
}