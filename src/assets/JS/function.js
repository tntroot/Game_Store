/**  
 * 更改數字格式 1000 -> 1,000 
 * @param {object} num 傳入一個 JSON 物件
*/
export function numFormat(num) {
    if(typeof num.price !== 'string'){
        num.price = new Intl.NumberFormat('en').format(num.price);
        num.sale_price = new Intl.NumberFormat('en').format(num.sale_price);
        num.sales = new Intl.NumberFormat('en').format(num.sales);
    }
}

const dataAPI = "http://localhost/Game_Store";

/**
 * @param {string} api php 檔名 
 * @returns {string} 請求後端資料 --> 執行遊戲相關操作
 */
export function gameAPI(api){
    return `${dataAPI}/game/${api}.php`;
}

/**
 * 請求後端資料 --> 執行帳號相關操作
 * @param {string} api php 檔名
 */
export function getAccountAPI(api){
    return `${dataAPI}/account/${api}.php`;
}

export function shopingAPI(api){
    return `${dataAPI}/shopping/${api}.php`;
}

/**
 * 請求後端資料 --> 執行後台相關操作
 * @param {string} api php 檔名
 */
export function adminAPI(path, api){
    return `${dataAPI}/admin/${path}/${api}.php`;
}

/**
 * 設定 axios headers 標頭
 */
export const setting = {
    headers:{
        'Content-Type': 'application/x-www-form-urlencoded',
    }
}