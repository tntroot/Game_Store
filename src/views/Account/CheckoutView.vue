<script setup>
import BuyGame from '../../components/BuyGame.vue'
import { ref, computed, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { Icon } from '@iconify/vue'

let shopping = ref('')
shopping.value = [
    {
        id: 1,
        name: '冰與火之舞',
        price: 123,
        sale_price: 0
    },
    {
        id: 2,
        name: '幻塔',
        price: 123,
        sale_price: 120
    },
    {
        id: 3,
        name: 'Minecraft',
        price: 123,
        sale_price: 100
    }
]

// 付款方式
let payment = ref('VISA')

// 表單驗證
let router = useRouter()
let form = ref()
function checkout(event) {
    if (!form.value.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
    } else {
        router.push('/account/checkoutComplete')
    }
    form.value.classList.add('was-validated')
}

// 有效期限 (年) + 10年
let thisYear = computed(() => {
    let year = new Date().getFullYear()
    return Array.from({ length: 10 }, (_, i) => year + i)
})
</script>

<template>
    <div class="container my-5">
        <div class="row">
            <div class="col-xl-9 col-lg-8 mx-auto">
                <div class="row">
                    <p class="h2 text-light fw-bolder">付款方式</p>
                    <div class="col-12 my-4">
                        <div class="tw-bg-[#16202d] p-4 rounded-5">
                            <form ref="form" action="" method="post" class="row g-3 needs-validation" novalidate
                                @submit.prevent="checkout">
                                <div class="col-md-5">
                                    <label for="inputState" class="form-label text-light fs-5">請選擇你的付款方式</label>
                                    <select id="inputState" v-model="payment" class="form-select"
                                        aria-label="Default select example">
                                        <option value="VISA" selected>VISA</option>
                                        <option value="Mastercard">Mastercard</option>
                                        <option value="JCB">JCB</option>
                                    </select>
                                </div>
                                <div class="col-md-7">
                                    <p class="text-light fs-5 mb-2">也可以點選下方圖標選擇</p>
                                    <div class=" d-inline-block me-3" :class="[payment === 'VISA'?'paymentBtn':'']">
                                        <button type="button" class="btn btn-lg btn-light"  @click="payment = 'VISA'">
                                            <Icon icon="logos:visaelectron" />
                                        </button>
                                    </div>

                                    <div class=" d-inline-block me-3" :class="[payment === 'Mastercard'?'paymentBtn':'']">
                                        <button type="button" class="btn btn-lg btn-light"  @click="payment = 'Mastercard'">
                                            <Icon icon="logos:mastercard" />
                                        </button>
                                    </div>

                                    <div class=" d-inline-block me-3" :class="[payment === 'JCB'?'paymentBtn':'']" >
                                        <button type="button" class="btn btn-lg btn-light" @click="payment = 'JCB'">
                                            <Icon icon="logos:jcb" />
                                        </button>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="creditCardNumber" class="form-label text-light fs-5">信用卡卡號</label>
                                    <div class="input-group has-validation">
                                        <span class="input-group-text bg-secondary" id="inputGroupPrepend">
                                            <Icon icon="streamline-emojis:credit-card" />
                                        </span>
                                        <input type="text" class="form-control" id="creditCardNumber"
                                            aria-describedby="inputGroupPrepend" required />
                                        <div class="invalid-feedback fs-5">信用卡卡號不得為空</div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="creditCardName" class="form-label text-light fs-5">持卡人姓名</label>
                                    <div class="input-group has-validation">
                                        <span class="input-group-text bg-secondary" id="inputGroupPrepend">
                                            <Icon icon="icon-park-outline:people" />
                                        </span>
                                        <input type="text" class="form-control" id="creditCardName"
                                            aria-describedby="inputGroupPrepend" required />
                                        <div class="invalid-feedback fs-5">持卡人姓名不得為空</div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <p class="form-label text-light fs-5">有效期限</p>
                                    <div class="input-group has-validation">
                                        <select name="" id="" class="form-select">
                                            <option v-for="i in thisYear" :key="i" :value="i">
                                                {{ i }}
                                            </option>
                                        </select>
                                        <span class="input-group-text bg-secondary text-light fw-bolder" id="inputGroupPrepend">
                                            年
                                        </span>
                                        <p>　　</p>
                                        <select name="" id="" class="form-select rounded-start-3 rounded-end-0">
                                            <option v-for="i in 12" :key="i" :value="i">
                                                {{ i }}
                                            </option>
                                        </select>
                                        <span class="input-group-text bg-secondary text-light fw-bolder" id="inputGroupPrepend">
                                            月
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="creditCardCVC" class="form-label text-light fs-5">安全碼</label>
                                    <div class="input-group has-validation">
                                        <span class="input-group-text bg-secondary" id="inputGroupPrepend">
                                            <Icon icon="logos:mastercard" />
                                        </span>
                                        <input type="text" class="form-control" id="creditCardCVC"
                                            aria-describedby="inputGroupPrepend" required />
                                        <div class="invalid-feedback">安全碼不得為空</div>
                                    </div>
                                    <div class="mt-3 d-flex align-items-center justify-content-end">
                                        <span class="text-light fs-5 me-2">
                                            (ex: 信用卡背面簽名欄位的3位數數字)
                                        </span>
                                        <img class="" src="../../assets/img/pic_card_back.png" width="100" alt=""
                                            srcset="" />
                                    </div>
                                </div>
                                <div class="col-12 text-center">
                                    <RouterLink to="/account/shoppingcar">
                                        <button type="button" class="btn btn-secondary btn-lg">
                                            取消付款
                                        </button>
                                    </RouterLink>
                                    <span>　　</span>
                                    <button class="btn btn-primary btn-lg" type="submit">
                                        確認付款
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <BuyGame :shopping="shopping" :activeView="0" />
                </div>
            </div>
        </div>
    </div>
</template>

<style lang="scss" scoped>
    .paymentBtn {
        border: 4px dotted red;
        border-radius: 0.2rem;
    }
</style>
