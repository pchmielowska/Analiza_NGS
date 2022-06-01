#!/bin/bash

java -jar snpEff.jar download -v R64-1-1.105

cd snpEff

java -Xmx8g -jar snpEff.jar -stats SRR064545_ann.html R64-1-1.105 /home/pat/projekt_NGS/vcf/SRR064545.vcf > SRR064545_ann.vcf

java -Xmx8g -jar snpEff.jar -stats SRR064546_ann.html R64-1-1.105 /home/pat/projekt_NGS/vcf/SRR064546.vcf > SRR064546_ann.vcf

ava -Xmx8g -jar snpEff.jar -stats SRR064547_ann.html R64-1-1.105 /home/pat/projekt_NGS/vcf/SRR064547.vcf > SRR064547_ann.vcf


