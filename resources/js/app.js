
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */


// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

import Meta from 'vue-meta';

Vue.use(Meta);

Vue.component('app-component', require('./components/AppComponent.vue').default);
Vue.component('loader-component', require('./components/LoaderComponent.vue').default);
Vue.component('example-component', require('./components/ExampleComponent.vue').default);
Vue.component('chart-component', require('./components/ChartComponent.vue').default);
Vue.component('log-component', require('./components/LogComponent.vue').default);
Vue.component('search-component', require('./components/SearchComponent.vue').default);
Vue.component('error-component', require('./components/ErrorComponent.vue').default);


/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app'
});


$.fn.hideMessages = function(){
    let _this = $(this);
    setTimeout(function(){
        _this.fadeOut();
    },3000);
}

$('.hide-alert').hideMessages();
