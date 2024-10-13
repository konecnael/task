
#!/bin/bash

<luscinia_vars.vcf.gz zcat |grep -v '^##' | tail -c+2 > vars.tsv
<vars.tsv grep -e '^chr1\s' -e 'chr2\s' > vars-1Z.tsv
<vars-1Z.tsv egrep -o 'DP=[^;]*' | sed 's/DP=//' > DP.tsv
<vars-1Z.tsv cut -f1-6 >join.tsv
<vars-1Z.tsv awk '{if($0 ~ /INDEL/) print "INDEL"; else print "SNP"}' > SNP.tsv
 paste join.tsv DP.tsv SNP.tsv > task.tsv
