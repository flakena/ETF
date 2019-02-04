<template>
    <div class="jumbotron">
        <h1>{{symbol}} : {{name}}</h1>
        <p class="text-justify">{{description}}</p>
    </div>
</template>

<script>
    export default {
        props: {
            symbol: {
                type: String,
                default: ''
            },
            name: {
                type: String,
                default: ''
            },
            description : {
                type: String,
                default: ''
            }
        }
    }
</script>
<style lang="scss" scoped>
    .jumbotron{
        margin-top: 25px;
    }
</style>
