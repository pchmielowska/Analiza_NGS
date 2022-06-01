#!/bin/bash

tri="trimmed_"
type=".fastq"

one="_1"
two="_2"

p="_paired"

out="SRR06454"

for n in 5 6 7

do
	echo '................................................'
	echo 'Hisat2 for:' $tri$n$one$p$type $tri$n$two$p$type
	echo '................................................'


	hisat2 -x ~/indeksy2/index -1 $tri$n$one$p$type -2 $tri$n$two$p$type -S /media/pat/169B-5D66/$out$n'.sam' 

done