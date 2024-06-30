export function numFormat(num) {
    if(typeof num.price !== 'string'){
        num.price = new Intl.NumberFormat('en').format(num.price);
        num.sale_price = new Intl.NumberFormat('en').format(num.sale_price);
        num.sales = new Intl.NumberFormat('en').format(num.sales);
    }
}
