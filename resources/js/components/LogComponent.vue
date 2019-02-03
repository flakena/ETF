<template>
    <div class="card">
        <div class="card-header">Search History</div>
        <div class="card-body table-outer">
            <div class="table-container">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>Searched Item</th>
                        <th>Date</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="(item, index) in logs" :key="index">
                        <td>{{item.description}}</td>
                        <td>{{item.created_at}}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        props: {
            logs: {
                type: Array,
                default: () => []
            }
        },
        mounted: function () {
        }
    }
</script>
<style lang="scss" scoped>
    .card {
        margin-top: 20px;
        .table-outer {
            display: flex;
            .table-container {
                width: 100%;
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
        }
    }
</style>