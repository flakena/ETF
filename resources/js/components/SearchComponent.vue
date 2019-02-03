<template>
    <div id="search-component">
        <div class="card">
            <div class="card-header">Dashboard</div>
            <div class="card-body">
                <div class="search-wrapper">
                    <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1">
                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                            </span>
                        <input type="text" class="form-control" name="sybmol" placeholder="Type ETF symbol"
                               v-model="searchText"
                               aria-describedby="basic-addon1">
                    </div>
                    <div class="form-group">
                        <button type="submit">Search</button>
                    </div>
                </div>
                <div class="suggestions" v-if="suggestionsOpen">
                    <ul>
                        <li v-for="(value, index) in suggestions" :key="index">
                            <a @click="getEtf(value)">
                                <span class="name">{{value.name}}</span>
                                <span class="symbol"> {{value.symbol}}</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        data: function () {
            return {
                searchText: '',
            }
        },
        computed: {
            suggestions: function () {
                var fullList = JSON.parse(window.etfs);
                return fullList.filter((item) => {
                    return item.name.toLowerCase().search(this.searchText.toLowerCase()) !== -1
                        || item.symbol.toLowerCase().search(this.searchText.toLowerCase()) !== -1
                });
            },
            suggestionsOpen: function () {
                return this.searchText && this.suggestions.length
            }
        },
        methods: {
            getEtf: function (item) {
                axios.get('/get/etf/' + item.id).then(res => {
                    this.$emit('parsed', res.data);
                    this.searchText = '';
                    return res;
                }).catch(error => console.error(error));
            }
        }
    }
</script>
<style lang="scss" scoped>
    .card-body {
        position: relative;
        .suggestions {
            position: absolute;
            background: #fff;
            border: 1px solid #ddd;
            width: calc(100% - 2.50rem);
            ul {
                list-style: none;
                padding-left: 0;
                max-height: 400px;
                overflow-y: auto;
                li {
                    color: #000;
                    a {
                        cursor: pointer;
                        display: block;
                        padding: 12px 20px;
                    }
                }
            }
        }
    }

    .search-wrapper {
        display: flex;
        .input-group {
            width: 100%;
            margin: 0;
            input {
                border-radius: 0;

            }
        }
        .form-group {
            flex: 1;
            margin: 0;
            button {
                height: 100%;
                border: none;
                background: #6EEB83;
                color: #ffffff;
            }
        }
    }
</style>