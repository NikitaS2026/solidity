import {ethers} from "hardhat";
import path from "node:path";
import fs from "node:fs";
import {Dyes} from "../typechain-types";
import { Dyes__factory } from "../typechain-types";

async function main() {

    const accounts = await ethers.getSigners();

    const flowerContract = await ethers.getContractFactory("Flowers");

    const flower = await flowerContract.deploy(15);

    await flower.waitForDeployment();
    const dyeAddr =  await flower.dye();

    const dyes = Dyes__factory.connect(dyeAddr, accounts[0]);

    await dyes.connect(accounts[1]).give(accounts[1],123)

    //смотрю сколько всего цветов есть
    console.log(`quantity of flowers: ${await flower.collect()}`)

    //собираю цветочки (5 штучко)
    let i:number = 0
    while(i < 5)
    {await flower.collect(); i++}

    //смотрю сколько у меня всего цветов
    //console.log(`balance of flowers: ${await flower.balanceOf(accounts[1])}`)
}
main()