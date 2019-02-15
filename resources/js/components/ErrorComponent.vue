<template>
    <div class="flash-message">
        <div class="alert alert-info">
           {{ message }}
        </div>
    </div>
</template>


<script>
    export default {
        props:{
          sector: {
              type: String,
              default: ''
          }
        },
        computed: {
            message: function () {
                return 'Information for country weights is not available.';
            }
        }
    }
</script>
