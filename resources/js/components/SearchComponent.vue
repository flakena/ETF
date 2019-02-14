<template>
    <div id="search-component">
        <div class="card">
            <loader-component v-if="open"></loader-component>
            <div class="card-header">Search ETF</div>
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
                <div class="flash-message" v-if="!suggestions.length">
                    <div class="alert alert-danger" >
                        For keyword :  <strong>{{searchText}}</strong>  information is not available.
                    </div>
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
                open: false,
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
                this.open = true;
                this.searchText = '';
                this.filterError = false;
                axios.get('/get/etf/' + item.id).then(res => {
                    this.$emit('parsed', res.data);
                    this.open = false;
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
            z-index: 99999;
            border: 1px solid #ddd;
            width: calc(100% - 2.50rem);
            ul {
                list-style: none;
                padding-left: 0;
                max-height: 400px;
                overflow-y: auto;
                margin-bottom: 0px;
                li {
                    color: #000;
                    a {
                        cursor: pointer;
                        display: block;
                        padding: 12px 20px;
                    }
                    &:hover{
                        font-weight: bold;
                        background: #ccc;
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