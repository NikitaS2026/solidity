//импортирую библиотеку хардхат
import hre from "hardhat";

//объявляю асинхронную функцию меин, дальше ее содержимое
async function main() {

    //сначала вывожу аккаунты
    const accounts = await hre.ethers.getSigners();

    //указываю какой контракт использовать и приравниваю ожидание константе майКонтант
    const myContract = await hre.ethers.getContractFactory("Kotiki");

    //потом ждем диплоя контракта
    const Kotiki = await myContract.deploy();

    //жду ответа от функций из контракта:
    await Kotiki.head(true);
    console.log(await Kotiki.cat())
    console.log(await Kotiki.fish())

    await Kotiki.back();
    console.log(await Kotiki.cat())
    console.log(await Kotiki.fish())

    //обрабатываю ошибку для продолжения кода
    try {
        await Kotiki.frozen();
    } catch (e) {
        console.log(e)
    }
    console.log(await Kotiki.fish())

    await Kotiki.send();
    console.log(await Kotiki.cat())
    console.log(await Kotiki.fish())
}

main()