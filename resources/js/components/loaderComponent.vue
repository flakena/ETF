<template>
    <div class="loader" :class="loaderClass">
        <cube-spin></cube-spin>
    </div>
</template>
<script>
    import CubeSpin from 'vue-loading-spinner/src/components/Circle'

    export default {
        props:{
          loaderClass: {
              type: String,
              default: ''
          }
        },
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
    .jumbutronLoader{
        top: 0;
        left: 0;
        div{
            display: block;
            margin: 0 auto;
        }
    }
</style>