// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;                             //код доступен для версии 0.8.7 и выше

contract ERC20 {                                    //создание нового контракта ERC20

                        //будет тратится меньше деняк       вроде на объявление это тоже распространяется 
    
    constructor(string memory _name, string memory _symbol, uint256 _decimals) {  //объявление конструктора
                                //с параметрами _name, _symbol типа string(временные) и _decimals типа uint256

        name = _name;           //внутри конструктора уже известная переменная "name" равная "_name"
        symbol = _symbol;       //такие же известрные переменные "symbol" = "_symbol"
        decimals = _decimals;   //и "decimals" = "_decimals"
        owner = msg.sender;     //и переменная msg.sender показывает, что owner - именно тот, кто взаимодействует с контрактом
    }event Transfer(address indexed from, address indexed to, uint256 amount);   //событие Transfer с параметрами 
                                                                                //from и to типа address, amount типа uint256
    event Approval(address indexed from, address indexed to, uint256 amount);   //событие Approval с такими же параметрами

    mapping (address => uint256) public balanceOf;  //создается маппинг balanceOf с ключом address и значением uint256

    
    mapping (address => mapping(address => uint256)) public allowance; //создается маппинг allowance с ключом address 
                                                                       //и значением - маппинг с ключом address и значением uint256 

    uint256 public totalSupply; //оъявление публичной переменной totalSupply типа uint256
    address public owner;       //оъявление публичной переменной owner типа address
    string public name;         //оъявление публичной переменной name типа string
    uint256 public decimals;    //оъявление публичной переменной decimals типа uint256
    string public symbol;       //оъявление публичной переменной symbol типа string

                                //из криптозомби я узнала, что если группировать переменныне 
                                //(типа адрес с адресом, строка со строкой), то
            

    function mint(address addressToMint, uint256 amount) public { //объявление публичной функции mint с параметрами
                                                                  //addressToMint типа address, amount типа uint256
        require(msg.sender == owner, "Only owner can do this");   //идет проверка на то, что видимо только owner
                                                                  //может вызвать функцию mint, и при ошибке пишется текст правее условия
        balanceOf[addressToMint] += amount;         //в маппинг balanceOf с ключом addressToMint добавляется значение amount
        totalSupply += amount;                      //к значению totalSupply прибавляется amount
    } //это наверное функция для пополнения баланса получателя

    function burn(address addressFrom, uint256 amount) public {   //объявление публичной функции burn с параметрами
                                                                  //addressFrom типа address, amount типа uint256
        require(msg.sender == owner, "Only owner can do this");   //тут все также как в фнкции addressToMint
        balanceOf[addressFrom] -= amount;           //но наоборот удаляется значение amount из маппинга balanceOf уже с ключом addressFrom
        totalSupply -= amount;                      //из значения totalSupply вычитается amount
    }//а это наоборот для "очищения" суммы отправителя

    function transfer(address to, uint256 amount) public {               //объявление публичной функции transfer с параметрами
                                                                         //to типа address и amount типа uint256
        require(balanceOf[msg.sender] >= amount, "Not enough amount");   //проверка на то, что баланс владельца больше или равно чем amount, т.е. сумма,
                                                                         //при невыполнении условия - ошибка
                                                                         //при выполнении условия
        emit Transfer(msg.sender, to, amount);                           //"вызывается" событие Transfer с уже известными параметрами
        balanceOf[msg.sender] -= amount;                                 //из баланса владельца вычитается вся сумма
        balanceOf[to] += amount;                                         //к балансу получателя прибавляется эта сумма
    }//эта функция отвечает за итоговую сумму отправителя и получателя

    function allow(address to, uint256 amount) public {                  //объявление публичной функции allow с параметрами
                                                                         //to типа address и amount типа uint256
        require(balanceOf[msg.sender] >= amount, "Not enough amount");   //проверка такого же условия как и в transfer
        emit Approval(msg.sender, to, amount);      //если условие выполняется, то вызывется событие Approval с уже известными параметрами
        allowance[msg.sender][to] += amount;        //и в маппинг разрешения добавляется баланс и получателю и отправителю
    }//эта функция определяет есть ли разрешение получателя у отправителч на перевод деняк от его лица и если да то перевод совершается

    function transferFrom(address from, address to, uint256 amount) public  {   //объявление публичной функции transferFrom с параметрами
                                                                                //from, to типа address и amount типа uint256
        require(balanceOf[from] >= amount, "Not enough balance");               //условие на проверку больше или равен баланс получателя с суммой
        require(allowance[from][msg.sender] >= amount, "Not enough allowance"); //после этого проверяеться если ли разрешение на переворд
        emit Transfer(from, to, amount);            //выполняется событие Transfer
        balanceOf[from] -= amount;                  //баланс отправителя уменьшается на amount
        balanceOf[to] += amount;                    //баланс получателя увеличивается на amount
        allowance[from][msg.sender] -= amount;      //разрешененные деньги(не знаю как сказать, но я поняла честно) уменьшаются на amount
    }//функция выполняет итоговый пееревод между всеми отправителями 
}