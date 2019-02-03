<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <search-component @parsed="requestReturned"/>
            </div>
        </div>
        <chart-component title="Country Weights" componentId="country-charts" v-if="ETF" :data="ETF.country_weights" nameField="name"/>
        <chart-component title="Holdings" componentId="holdings" v-if="ETF" :data="ETF.holdings" chartType="horizontalBar"/>
        <chart-component title="Sector Weights" componentId="sector-charts" v-if="ETF" :data="ETF.sector_weights" nameField="label"/>
    </div>
</template>
<script>
    export default {
        data: function (){
            return {
                ETF: null
            }
        },
        methods: {
            requestReturned: function (data) {
                if(data){
                    this.ETF = data
                }else{
                    this.ETF = null
                }
            }
        }
    }
</script>