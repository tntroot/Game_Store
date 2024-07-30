import { reactive, computed } from 'vue';
import { useRoutee } from 'vue-router';

export default function AdminHeaderMassage() {
    const route = useRoutee();
    const massageData = reactive({
        name: ''
    })

    const massage = computed(() => {
        return route.meta.title == ''
    })
}