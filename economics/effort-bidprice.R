#
# effort-bidprice.R,  9 Mar 16
#
# Data from:
# Variability and Reproducibility in Software Engineering: A Study of Four Companies that Developed the Same System
# Bente C. D. Anda and Dag I. K. Sj{\o}berg and Audris Mockus
#
# Example from:
# Empirical Software Engineering using R
# Derek M. Jones


source("ESEUR_config.r")


bid_info=read.csv(paste0(ESEUR_dir, "economics/SoftEngjan10.csv.xz"), as.is=TRUE)

# Consistency check
# (bid_info$A_D_bid+bid_info$A_D_planned/10) == bid_info$A_D_emphasis

plot(bid_info$bid_price, bid_info$est_time, col=point_col,
	xlab="Bid price", ylab="Estimated time")

bid_mod=glm(est_time ~ bid_price, data=bid_info)

sub_info=subset(bid_info, bid_price < 50000)

sub_mod=glm(est_time ~ bid_price+A_D_bid*A_D_planned, data=sub_info)


