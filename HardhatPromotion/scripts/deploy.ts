import hre from "hardhat";
import { ethers } from "hardhat";

async function Main() {

    const [wallet] = await hre.ethers.getSigners();
    console.log("Адрес кошелька: ", wallet.address);


    const lockSol = await hre.ethers.getContractFactory("Lock");

    const Lock = await lockSol.deploy();
}
