<template>
    <div class="jumbotron">
        <loader-component v-if="open" loaderClass="jumbutronLoader"></loader-component>
        <h1>{{etf.symbol}} : {{etf.name}}</h1>
        <p class="text-justify">{{etf.description}}</p>
        <button class="btn btn-primary" @click="createPDF"><i class="fa fa-file-pdf-o"></i> Export PDF file for {{this.etf.name}} </button>
    </div>
</template>

<script>
    import jsPDF from 'jspdf';
    import html2canvas from 'html2canvas';

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
                let pdf = new jsPDF('landscape');

                pdf.setFontSize(45);
                pdf.text(this.etf.symbol +' : ' + this.etf.name, 10, 30, null, null, 'left');
                pdf.setFontSize(14);
                pdf.text(pdf.splitTextToSize(this.etf.description, 110), 10, 55, null, null, 'left');

                let url = 'https://www.spdrs.com/product/fund.seam?ticker='+ this.etf.symbol +'';
                let rectX = 10, rectY = 165, rectW = 70, rectH = 15;

                pdf.setDrawColor(0);
                pdf.setFillColor(2, 126, 1);
                pdf.rect(rectX, rectY, rectW, rectH, 'F');
                pdf.link(rectX, rectY, rectW, rectH, {
                    url: url
                });

                pdf.setTextColor(255,255,255);
                pdf.textWithLink('Official '+ this.etf.symbol+' page', 25, 174, {
                    url: url,
                });

                html2canvas(document.querySelector('#topHoldings')).then(canvas => {
                    let imgWidth = (canvas.width * 17) / 240;
                    let imgHeight = (canvas.height * 17) / 240;
                    pdf.addImage(canvas.toDataURL('image/jpeg', 1.0), 'JPEG', 130, 50, imgWidth, imgHeight);
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
    }
</style>
