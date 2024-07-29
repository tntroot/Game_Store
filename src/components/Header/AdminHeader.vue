<template>
    <nav class="navbar navbar-expand-lg navbar-light tw-bg-[#c1b0ffda] p-0 sticky-top">
        <div class="container px-4 px-lg-5 position-relative">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                    class="navbar-toggler-icon"></span></button>
            <RouterLink to="/" style="background-color: transparent;">
                <div class="navbar-brand fs-3">夢幻宇宙網 -返回前台</div>
            </RouterLink>
            <div class="collapse navbar-collapse order-5 order-lg-1" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 fs-4">
                    <RouterLink to="/admin/addGame">
                        <li class="nav-item nav-link">商品管理</li>
                    </RouterLink>
                    <RouterLink to="/admin/addGame">
                        <li class="nav-item nav-link">訂單管理</li>
                    </RouterLink>
                    <RouterLink to="/admin/addGame">
                        <li class="nav-item nav-link">留言回復</li>
                    </RouterLink>
                    <RouterLink to="/admin/addGame">
                        <li class="nav-item nav-link">帳號管理</li>
                    </RouterLink>
                </ul>
            </div>
        </div>
    </nav>
</template>

<script setup>

</script>

<style lang="scss" scoped>
.router-link-active {
    background-color: rgb(218, 218, 218);
}
</style>