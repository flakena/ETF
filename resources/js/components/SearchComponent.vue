<template>
    <div id="search-component">
        <div class="card">
            <loader-component v-if="open"></loader-component>
            <div class="card-header">Search ETF</div>
            <div class="card-body">
                <div class="search-wrapper">
                    <form @submit.prevent="submit">
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1">
                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                            </span>
                            <input type="text" class="form-control" name="sybmol" placeholder="Type ETF symbol"
                                   v-model="searchText"
                                   aria-describedby="basic-addon1">
                        </div>
                        <button type="submit" class="btn btn-primary" :class="{'display-none' : hideClass} ">
                            <i class="fa fa-search"></i>
                        </button>
                    </form>
                </div>
                <div class="suggestions" v-if="suggestionsOpen" :class="{'display-none' : hideClass}">
                    <ul>
                        <li v-for="(value, index) in suggestions" :key="index">
                            <a @click="submit(value)">
                                <span class="name">{{value.name}}</span>
                                <span class="symbol"> {{value.symbol}}</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="flash-message" v-if="hasError">
                    <div class="alert alert-danger">
                        For keyword : <strong>{{errorText}}</strong> information is not available.
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
                hasError: false,
                metaTitle: 'ETF | ETF parser',
                errorText: '',
                hideClass: false
            }
        },
        metaInfo() {
            return {
                title: this.getMetaTitle()
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
            getMetaTitle: function () {
                return this.metaTitle;
            },
            submit: function (value) {
                this.$emit('nullify');
                this.open = true;
                this.hideClass = true;
                this.hasError = false;
                const searchValue = value && value.hasOwnProperty('symbol') ? value.symbol : this.searchText;
                axios.get('/check/etf/' + searchValue).then(res => {
                    this.$emit('parsed', res.data);
                    this.open = false;
                    this.hasError = false;
                    this.metaTitle = (res) ? res.data.symbol.toUpperCase() + '| ' + res.data.name : this.searchText.toLocaleUpperCase();
                    this.hideClass = false;
                    this.searchText = '';
                    return res;
                }).catch(error => {
                    console.error(error);
                    this.open = false;
                    this.hideClass = false;
                    this.hasError = true;
                    this.errorText = this.searchText;
                    this.searchText = '';
                });
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
                    &:hover {
                        font-weight: bold;
                        background: #ccc;
                    }
                }
            }
        }
    }

    .search-wrapper {
        display: flex;
        form {
            width: 100%;
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
            button {
                position: absolute;
                top: 20px;
                height: 37px;
                width: 10%;
                right: 20px;
                border-radius: 0px;
                z-index: 999;
            }
        }
    }
</style>