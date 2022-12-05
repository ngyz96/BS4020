#!/bin/bash

module load sbs/fastp/0.20.0
BULKDIR="Soil-Microbiomes/Diptrocarp-Microbiome/X401SC21010434-Z01-F002/raw_data"
ROOTDIR="Soil-Microbiomes/Diptrocarp-Microbiome/X401SC21010435-Z01-F001/raw_data"
OUTDIR="Soil-Microbiomes/Diptrocarp-Microbiome/fastp_data"

for file in `ls -1 ${BULKDIR}/**/*_1.fq.gz | sed 's/_1.fq.gz//'`
do
    filename=`echo $file | cut -d '/' -f9`
    fastp --in1 ${file}_1.fq.gz --in2 ${file}_2.fq.gz \
    --out1 ${OUTDIR}/${filename}_cleaned_1.fq.gz --out2 ${OUTDIR}/${filename}_cleaned_2.fq.gz \
    -w 8 -j ${OUTDIR}/${filename}_fastp.json -h ${OUTDIR}/${filename}_fastp.html
done

for file in `ls -1 ${ROOTDIR}/**/*_1.fq.gz | sed 's/_1.fq.gz//'`
do
	filename=`echo $file | cut -d '/' -f9`
	fastp --in1 ${file}_1.fq.gz --in2 ${file}_2.fq.gz \
	--out1 ${OUTDIR}/${filename}_cleaned_1.fq.gz --out2 ${OUTDIR}/${filename}_cleaned_2.fq.gz \
	-w 8 -j ${OUTDIR}/${filename}_fastp.json -h ${OUTDIR}/${filename}_fastp.html
done
