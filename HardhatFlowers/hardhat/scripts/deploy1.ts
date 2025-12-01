import {ethers} from "hardhat";
import {Dyes__factory} from "../typechain-types";
import { HardhatEthersSigner } from "@nomicfoundation/hardhat-ethers/signers";

async function main() {
    const [user1, user2, user3, user4] = await ethers.getSigners();
    const flowerContract = await ethers.getContractFactory("Flowers");

    const flower = await flowerContract.deploy(100);
    await flower.waitForDeployment();

    const dye = await flower.dye();
    const dye1 =  Dyes__factory.connect(dye,user1)

    //функция для сбора цветов
    async function coll(user: HardhatEthersSigner) {
        await flower.connect(user).collect()
    }

    //функция для вывода баланса цветов
    async function consF(user: HardhatEthersSigner) {
    console.log(await flower.balanceFlowers(user))
    }

    //функция для вывода баланса красителей
    async function consD(user: HardhatEthersSigner) {
        console.log(await dye1.balanceDyes(user))
    }

    // четыре пользователя собирают цветочки

    for (let i = 0; i <= 4; i++) await coll(user1);
    for (let i = 0; i <= 2; i++) await coll(user2);
    for (let i = 0; i <= 6; i++) await coll(user3);
    for (let i = 0; i <= 1; i++) await coll(user4);

    // отображаем баланс

    await consF(user1)
    await consF(user2)
    await consF(user3)
    await consF(user4)

    // два из них обмениваются

    let fus2 = await flower.balanceFlowers(user2)
    await flower.connect(user1).give(user2, await flower.balanceFlowers(user1))
    await flower.connect(user2).give(user1, fus2)

    // отображаем баланс

    await consF(user1)
    await consF(user2)
    await consF(user3)
    await consF(user4)

    // показываем балансы красителей

    await consD(user1)
    await consD(user2)
    await consD(user3)
    await consD(user4)

    // двое из них передлывают цветы в красители

    await flower.connect(user3).mintFlower(4)
    await flower.connect(user4).mintFlower(2)

    // показываем балансы красителей

    await consD(user1)
    await consD(user2)
    await consD(user3)
    await consD(user4)

    // эти двое дарят другим красители

    await dye1.connect(user3).give(user1, 2n)
    await dye1.connect(user4).give(user2, 1n)

    // показываем балансы красителей

    await consD(user1)
    await consD(user2)
    await consD(user3)
    await consD(user4)

    // жизнь удалась
}
main()