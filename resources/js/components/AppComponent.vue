<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <search-component @parsed="requestReturned"/>
                <log-component :logs="logs"/>
                <chart-component title="Country Weights" componentId="country-charts" v-if="ETF"
                                 :data="ETF.country_weights"
                                 nameField="name"/>
                <chart-component title="Holdings" componentId="holdings" v-if="ETF" :data="ETF.holdings"
                                 chartType="horizontalBar"/>
                <chart-component title="Sector Weights" componentId="sector-charts" v-if="ETF"
                                 :data="ETF.sector_weights"
                                 nameField="label"/>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        data: function () {
            return {
                ETF: null,
                logs: JSON.parse(window.userLogs)
            }
        },
        methods: {
            requestReturned: function (data) {
                if (data) {
                    this.ETF = data
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