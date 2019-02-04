<template>
    <div class="loader">
        <cube-spin></cube-spin>
    </div>
</template>
<script>
    import CubeSpin from 'vue-loading-spinner/src/components/Circle'

    export default {
        components: {
            CubeSpin
        }
    }
</script>
<style lang="scss" scoped>
    .loader {
        position: absolute;
        z-index: 999;
        width: 100%;
        height: 100%;
        background: #fff;
        text-align: center;
        padding-top: 40px;
    }
</style>