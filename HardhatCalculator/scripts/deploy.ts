import {ethers} from "hardhat";

async function main() {

    const _calc = await ethers.getContractFactory("Calculator")
    const calc = await _calc.deploy()
    await calc.waitForDeployment()

    console.log("contract address: ", await calc.getAddress())

    console.log("initial result: ", await calc.currentResult())

    await calc.add(100)
    console.log("after ADD(", await calc.currentResult(),"): ", await calc.currentResult())

    await calc.multiply(5)
    console.log("after MULTIPLY(", await calc.currentResult(),"): ", await calc.currentResult())

    await calc.subtract(250)
    console.log("after SUBTRACT(", await calc.currentResult(),"): ", await calc.currentResult())

    await calc.divide(10)
    console.log("final result(", await calc.currentResult(),"): ", await calc.currentResult())

    await calc.reset()
    console.log(await calc.currentResult())
}

main()