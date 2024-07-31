import { defineStore } from "pinia";
import { ref } from "vue";
import { useRouter, useRoute } from "vue-router";

export const useHeaderStore = defineStore("header", () => {
    const search = ref("");

    const router = useRouter();
    const route = useRoute();
    const thisRoute = ref("");
    thisRoute.value = useRoute().query.type || "";

    function searchFu() {
        let routeQuery = { ...route.query };
        routeQuery['search'] = search.value;
        router.push({ path: '/search', query: Object.assign({}, routeQuery) });
    }
    function shopping() {
        router.push("/account/shopping/shoppingCar");
    }

    return { search, searchFu, shopping, thisRoute };
});