<template>
    <div class="pie-chart">
        <div class="card" :id="cardId">
            <div class="card-header">{{title}}</div>
            <div class="card-body table-outer" :id="`${componentId}-component`">
                <div class="table-container">
                    <table class="table table-bordered" :id="`${componentId}-table`">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Weight</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-for="(item, index) in data" :key="index">
                            <td>{{item[nameField]}}</td>
                            <td class="text-right">{{item.weight}}%</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="canvas-container">
                    <canvas :id="componentId"  width="400" height="400"></canvas>
                </div>
            </div>
        </div>
    </div>
</template>


<script>
    import Chart from 'chart.js'

    export default {
        props: {
            data: {
                type: Array,
                default: () => []
            },
            cardId: {
                type: String,
                default: ''
            },
            componentId: {
                type: String,
                default: 'SingleChart'
            },
            nameField: {
                type: String,
                default: 'name'
            },
            title: {
                type: String,
                default: 'Data information'
            },
            chartType: {
                type: String,
                default: 'pie'
            }
        },
        mounted: function () {
            let ctx = document.getElementById(this.componentId);
            let options = {
                tooltips: {
                    mode: 'index',
                    callbacks: {
                        label: function(tooltipItem, data) {
                            return   data.labels[tooltipItem.index] + ' : ' + data.datasets[0].data[tooltipItem.index] + '%';
                        }
                    }
                }
            };

           new Chart(ctx, {
                type: this.chartType,
                data: {
                    labels: this.labels,
                    datasets: [{
                        label: this.title,
                        data: this.values,
                        borderWidth: 1,
                        backgroundColor: this.colors
                    }]
                },
                options: options
            });
        },
        computed: {
            labels: function () {
                return this.data.map(item => {
                    return item[this.nameField];
                })
            },
            values: function () {
                return this.data.map(item => {
                    return item.weight;
                })
            },
            colors: function () {
                return this.data.map(function () {
                    var r = Math.floor(Math.random() * 255);
                    var g = Math.floor(Math.random() * 255);
                    var b = Math.floor(Math.random() * 255);
                    return "rgb(" + r + "," + g + "," + b + ")";
                })
            }
        }
    }
</script>

<style lang="scss" scoped>
    .pie-chart {
        margin-top: 25px;
    }
    .table-outer {
        display: flex;
        .table-container {
            width: 50%;
            table {
                width: 100%;
                thead {
                    th {
                        &:first-of-type {
                            width: 80%;
                        }
                        &:last-of-type {
                            width: 20%;
                        }
                    }
                }
            }
        }
        .canvas-container {
            width: 50%;
            canvas {
                flex: 1;
            }
        }
    }
</style>