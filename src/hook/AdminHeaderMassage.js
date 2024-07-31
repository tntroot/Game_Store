export default function AdminHeadermessage() {
    function messageAdd(text){
        return {
            name: text,
            color: 'success',
        }
    }
    function messageModify(text){
        return {
            name: text,
            color: 'primary',
        }
    }
    function messageDelete(text){
        return {
            name: text,
            color: 'danger',
        }
    }

    return {messageAdd, messageModify, messageDelete};
}