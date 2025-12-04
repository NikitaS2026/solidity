import "@nomicfoundation/hardhat-toolbox";
import "@typechain/hardhat";

module.exports = {
    solidity: "0.8.20",
    typechain: {
        outDir: "typechain-types",   // сюда будут генерироваться типы
        target: "ethers-v6"          // или ethers-v5
    }
};

