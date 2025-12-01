let x: string[] = ["сирень","жасмин","шиповник","роза","тюльпан"];
let i: number = 0;

while(i < x.length) {
    console.log("цветочко:", x[i]);
    console.log("результат для getBushPrice");
    getBushPrice()
    console.log("результат для getBushPriceSwitch");
    getBushPriceSwitch()
    i++;
}

function getBushPrice(){
    if (x[i] == "сирень") {console.log(100)}
    else if (x[i] == "жасмин") {console.log(120)}
    else if (x[i] == "шиповник") {console.log(150)}
    else console.log(80);
}

function getBushPriceSwitch() {
    switch (x[i]) {
        case "сирень":
            console.log(100)
            break;
        case "жасмин":
            console.log(120)
            break;
        case "шиповник":
            console.log(150)
            break;
        default:
            console.log(80)
    }
}