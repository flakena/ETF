<template>
    <div class="jumbotron">
        <h1>{{data.symbol}} : {{data.name}}</h1>
        <p class="text-justify">{{data.description}}</p>
    </div>
</template>

<script>
    export default {
        props: {
            data: {
                type: Array,
                default: () => []
            }
        }
    }
</script>
<style lang="scss" scoped>
    .jumbotron{
        margin-top: 25px;
    }
</style>
