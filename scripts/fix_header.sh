#!/usr/bin/bash
## Correct vcf header conficts between integration v3.3 and v3.3.2
gunzip -c $1 | \
     sed 's/ID=ADALL,Number=1,Type=Integer,/ID=ADALL,Number=R,Type=Integer,/' | \
     sed 's/ID=AD,Number=1,Type=Integer,/ID=AD,Number=R,Type=Integer,/' | \
     sed 's/ID=PS,Number=1,Type=Integer,/ID=PS,Number=1,Type=String,/'  |  \
  bgzip -c > $2
