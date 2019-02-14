<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <search-component @parsed="requestReturned"/>
                <e-t-f-component v-if="ETF" :symbol="ETF.symbol" :name="ETF.name" :description="ETF.description"/>
                <chart-component title="Holdings" componentId="holdings" v-if="ETF && ETF.holdings.length" :data="ETF.holdings"
                                 chartType="horizontalBar"/>
                <chart-component title="Country Weights" componentId="country-charts" v-if="ETF && ETF.country_weights.length"
                                 :data="ETF.country_weights"
                                 nameField="name"/>
                <error-component v-if="ETF && !ETF.country_weights.length" ></error-component>
                <chart-component title="Sector Weights" componentId="sector-charts" v-if="ETF && ETF.sector_weights.length"
                                 :data="ETF.sector_weights"
                                 nameField="label"/>
                <log-component :logs="logs"/>
            </div>
        </div>
    </div>
</template>
<script>
    import ETFComponent from "./ETFComponent";
    export default {
        components: {ETFComponent},
        data: function () {
            return {
                ETF: null,
                logs: JSON.parse(window.userLogs)
            }
        },
        methods: {
            requestReturned: function (data) {
                if (data) {
                    this.ETF = data;
                    var now = new Date();
                    this.logs.unshift({
                        description: this.ETF.symbol + ' : ' + this.ETF.name,
                        created_at: now.getFullYear() + '-' + now.getMonth() + '-' + now.getDate() + ' ' + now.getHours() + ':' + now.getMinutes() + ':' + now.getSeconds()
                    })
                } else {
                    this.ETF = null
                }
            }
        }
    }
</script>