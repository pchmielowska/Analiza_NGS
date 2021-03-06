#!/bin/bash



for n in 5 6 7

do
	echo '.......................................................'
	echo 'Variant calling with bcftools:' '/home/pat/projekt_NGS/mapping/SRR06454'$n'_sort.bam
	echo '.......................................................'
		
	bcftools mpileup -Ou -f gen_refer.fna '/home/pat/projekt_NGS/mapping/SRR06454'$n'_sort.bam' | bcftools call --ploidy 1 -mv -Ob | bcftools view -i '%QUAL>=20' > '/home/pat/projekt_NGS/vcf/SRR06454'$n'.vcf'

done