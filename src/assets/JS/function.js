/* 更改數字格式 1000 -> 1,000 */
export function numFormat(num) {
    if(typeof num.price !== 'string'){
        num.price = new Intl.NumberFormat('en').format(num.price);
        num.sale_price = new Intl.NumberFormat('en').format(num.sale_price);
        num.sales = new Intl.NumberFormat('en').format(num.sales);
    }
}

const dataAPI = "http://localhost/Game_Store";

export function getAccountAPI(api){
    return `${dataAPI}/account/${api}.php`;
}

export function adminAPI(path, api){
    return `${dataAPI}/admin/${path}/${api}.php`;
}

export const setting = {
    headers:{
        'Content-Type': 'application/x-www-form-urlencoded',
    }
}