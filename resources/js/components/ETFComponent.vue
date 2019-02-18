<template>
    <div class="jumbotron">
        <loader-component v-if="open" loaderClass="jumbutronLoader"></loader-component>
        <h1>{{etf.symbol}} : {{etf.name}}</h1>
        <p class="text-justify">{{etf.description}}</p>
        <button class="btn btn-primary" @click="createPDF"><i class="fa fa-file-pdf-o"></i> Export PDF file for
            {{this.etf.name}}
        </button>
        <canvas :id="pdfChartId" class="pdfChart"></canvas>
    </div>
</template>
<script>
    import Chart from 'chart.js';
    import jsPDF from 'jspdf';
    import html2canvas from 'html2canvas';
    import 'jspdf-autotable';

    export default {
        props: {
            pdfChartId: {
                type: String,
                default: 'chartPdf'
            },
            chartType: {
                type: String,
                default: 'horizontalBar'
            },
            title: {
                type: String,
                default: ' Top 10 holdings'
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
        data: function () {
            return {
                open: false
            }
        },
        mounted: function () {
            let ctx = document.getElementById(this.pdfChartId);

            let options = {
                tooltips: {
                    mode: 'index',
                    callbacks: {
                        label: function (tooltipItem, data) {
                            return data.labels[tooltipItem.index] + ' : ' + data.datasets[0].data[tooltipItem.index] + '%';
                        }
                    }
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            min: 0,
                            stepSize: 1,
                            fontColor: "#000",
                            fontSize: 14
                        },
                        gridLines: {
                            color: "#000",
                            lineWidth: 1,
                            zeroLineColor: "#fff",
                            zeroLineWidth: 0
                        },
                        stacked: true
                    }],
                    xAxes: [{
                        ticks: {
                            fontColor: "#000",
                            fontSize: 14
                        },
                        gridLines: {
                            color: "#000",
                            lineWidth: 0
                        }
                    }]
                }
            };

            new Chart(ctx, {
                type: this.chartType,
                data: {
                    labels: this.chartLabels,
                    datasets: [{
                        backgroundColor: 'rgb(2,126,1)',
                        label: this.etf.name + ' :' + this.title,
                        data: this.chartValues,
                        borderWidth: 0,
                    }]
                },
                options: options,
            });
        },
        computed: {
            tableValues: function () {
                return this.etf.holdings.map(item => {
                    return [item.name, item.weight + ' %'];
                })
            },
            chartValues: function () {
                return this.etf.holdings.map(item => {
                    return item.weight;
                })
            },
            chartLabels: function () {
                return this.etf.holdings.map(item => {
                    return item['name'];
                })
            },
        },
        methods: {
            generateChartForPdf() {

            },
            createPDF() {
                this.open = true;
                const filename = this.etf.symbol + ' ' + this.etf.name;
                const pdf = new jsPDF('landscape');

                pdf.setFontSize(45);
                pdf.text(this.etf.symbol + ' : ' + this.etf.name, 10, 30, null, null, 'left');

                pdf.setFontSize(12);
                pdf.text(pdf.splitTextToSize(this.etf.description, 275), 10, 45, null, null, 'left');

                let url = 'https://www.spdrs.com/product/fund.seam?ticker=' + this.etf.symbol + '';
                let rectX = 10, rectY = 180, rectW = 70, rectH = 15;

                pdf.setDrawColor(0);
                pdf.setFillColor(2, 126, 1);
                pdf.rect(rectX, rectY, rectW, rectH, 'F');
                pdf.link(rectX, rectY, rectW, rectH, {
                    url: url
                });

                pdf.setTextColor(255, 255, 255);
                pdf.textWithLink('Official ' + this.etf.symbol + ' page', 25, 189, {
                    url: url,
                });

                const el = document.getElementById(this.pdfChartId);

                html2canvas(el).then(canvas => {
                    let imgWidth = (canvas.width * 18) / 240;
                    let imgHeight = (canvas.height * 18) / 240;
                    pdf.addImage(canvas.toDataURL('image/png', 1.0), 'PNG', 125, 80, imgWidth, imgHeight);

                    //jspdf Autotable
                    pdf.autoTable({
                        startY: 85,
                        startX: 0,
                        tableWidth: 110,
                        styles: {
                            fontSize: 9,
                            overflow: 'linebreak',
                            lineColor: [44, 62, 80],
                            lineWidth: 0.3
                        },
                        headStyles: {
                            fillColor: [2, 126, 1],
                            fontSize: 7,
                        },
                        columnStyles: {
                            0: {
                                cellWidth: 'auto',
                                halign: 'left',
                                fillColor: [255, 255, 255],
                                fontSize: 7
                            },
                            1: {
                                cellWidth: 'auto',
                                halign: 'right',
                                fillColor: [255, 255, 255],
                                fontSize: 7
                            }
                        },
                        margin: {
                            top: 10,
                            left: 10
                        },
                        head: [['HOLDING NAME', 'WEIGHT']],
                        body: this.tableValues
                    });

                    this.open = false;
                    pdf.save(filename);
                });
            }
        }
    }
</script>
<style lang="scss" scoped>
    .jumbotron {
        margin-top: 25px;
        overflow: hidden;
    }
    .pdfChart {
        position: absolute;
        top: 100%;
    }
</style>
