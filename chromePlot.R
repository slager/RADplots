################## chromePlot: plot SNP locations on chromosomes with ggplot2 ######################

#need two files - one to list chromosome # and length, one to list SNP chromosome and position
#the "chrome" file is tab-delimited with headers "ID" (name for each chromosome) and "Size" (in base pairs). The "snp" file
#is also tab-delimited with columns "ID" (chromosome name - must match chrome file) and 
#"POS" (position in base pairs on chromosome - typically the beginnig, end, or middle of a BLAST/BLAT hit);
#Example "chrome" file: 
#ID	Size
#1	118548696
#1A	73657157
#1B	1083483
#snps is tab-delimited with headers "CHR" and "POS"
#Example "snp" file: 
#ID	POS
#1	2454162
#1	5953614
#1A	322701


chromePlot <- function(snp,chrome){
  require(ggplot2);require(plyr)
  a <- read.table(snp,header=TRUE)
  b <- read.table(chrome,header=TRUE)
  b$Size <- as.numeric(as.character(b$Size))
  b$ID <- factor(b$ID,as.character(b$ID))
  ggplot(data=b,aes(x=ID,y=Size))+theme_bw()+xlab("Chromosome")+ylab("SNP Position")+
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
          axis.text.y = element_blank(),axis.ticks.y = element_blank())+
    geom_bar(stat="identity",fill='grey')+geom_point(data=a,aes(x=ID,y=POS),col="red",size=11,shape="-")
}
