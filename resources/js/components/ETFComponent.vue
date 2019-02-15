<template>
    <div class="jumbotron">
        <loader-component v-if="open" loaderClass="jumbutronLoader"></loader-component>
        <h1>{{etf.symbol}} : {{etf.name}}</h1>
        <p class="text-justify">{{etf.description}}</p>
        <button @click="createPDF">pdf</button>
    </div>
</template>

<script>
    import jsPDF from 'jspdf'
    import html2canvas from 'html2canvas'

    export default {
        props: {
            open: {
                type: Boolean,
                default: false
            },
            etf: {
                type: Object,
                default: () => {
                    return {
                        symbol: '',
                        name: '',
                        description: ''
                    }
                }
            }
        },
        methods: {
            createPDF() {
                this.open = true;
                const filename = this.etf.symbol + ' ' + this.etf.name;
                let pdf = new jsPDF('p', 'mm', 'a4');
                pdf.setFontSize(20);
                pdf.text(this.etf.name, 105, 20, null, null, 'center');
                pdf.setFontSize(13);
                pdf.text(pdf.splitTextToSize(this.etf.description, 180), 105, 35, null, null, 'center');
                html2canvas(document.querySelector('#holdings')).then(canvas => {
                    pdf.setFontSize(20);
                    pdf.addPage('1', 'a4');
                    pdf.text('Top 10 Holdings Table', 105, 20, null, null, 'center');
                    pdf.addImage(canvas.toDataURL('image/jpeg', 1.0), 'JPEG', 5, 35, 200, 200);
                    html2canvas(document.querySelector('#holdings-table')).then(canvas => {
                        pdf.addPage('2', 'a4');
                        pdf.text('Top 10 Holdings Chart', 105, 20, null, null, 'center');
                        pdf.addImage(canvas.toDataURL('image/jpeg', 1.0), 'JPEG', 5, 30, 200, 200);
                        html2canvas(document.querySelector('#sector-charts-table')).then(canvas => {
                            pdf.addPage('3', 'a4');
                            pdf.text('Sector Weights Table', 105, 20, null, null, 'center');
                            pdf.addImage(canvas.toDataURL('image/jpeg', 1.0), 'JPEG', 5, 30, 200, 200);
                            html2canvas(document.querySelector('#sector-charts')).then(canvas => {
                                pdf.addPage('4', 'a4');
                                pdf.text('Sector Weights Chart', 105, 20, null, null, 'center');
                                pdf.addImage(canvas.toDataURL('image/jpeg', 1.0), 'JPEG', 5, 30, 200, 200);
                                let countryWeightsTable = document.querySelector('#country-charts-table');
                                let countryWeightsCharts = document.querySelector('#country-charts');
                                if(countryWeightsTable) {
                                    html2canvas(countryWeightsCharts).then(canvas => {
                                        pdf.addPage('5', 'a4');
                                        pdf.text('Country Weights Chart', 105, 20, null, null, 'center');
                                        pdf.addImage(canvas.toDataURL('image/jpeg', 1.0), 'JPEG', 5, 30, 200, 200);
                                        html2canvas(countryWeightsTable).then(canvas => {
                                            pdf.addPage('6', 'a4');
                                            pdf.addImage(canvas.toDataURL('image/jpeg', 1.0), 'JPEG', 5, 5, 200, canvas.height / 8);
                                            this.open = false;
                                            pdf.save(filename);
                                        });
                                    });
                                }
                                if(!countryWeightsTable) {
                                    this.open = false;
                                    pdf.save(filename);
                                }
                            });
                        });
                    });
                });
            }
        }
    }
</script>
<style lang="scss" scoped>
    .jumbotron {
        margin-top: 25px;
    }
</style>
