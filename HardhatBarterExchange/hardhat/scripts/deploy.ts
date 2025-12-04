import {ethers} from "hardhat";

async function main() {
    const accounts = await ethers.getSigners()

    const bricks = await ethers.getContractFactory("Bricks")
    const _bricks = await bricks.deploy()
    await _bricks.waitForDeployment()

    const soap = await ethers.getContractFactory("Soap")
    const _soap = await soap.deploy()
    await _soap.waitForDeployment()

    const barterExchange = await ethers.getContractFactory("BarterExchange")
    const _barterExchange = await barterExchange.deploy(await _soap.getAddress(), await _bricks.getAddress())
    await _barterExchange.waitForDeployment()

    await _bricks.mint(accounts[0], 10000000)
    await _bricks.allow(await _barterExchange.getAddress(), 10000000)
    await _soap.mint(await _barterExchange.getAddress(),10000000)

    await _barterExchange.connect(accounts[0]).exchangeBricksForSoap(1000000)

    console.log(await _soap.balanceOf(accounts[0]))
}
main()