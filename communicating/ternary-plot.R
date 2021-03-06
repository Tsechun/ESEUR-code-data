#
# ternary-plot.R, 25 Apr 20
#
# Data from:
# Example
#
# Example from:
# Evidence-based Software Engineering: based on the publicly available data
# Derek M. Jones
#
# TAG example_ternary-plot


source("ESEUR_config.r")


library("compositions")


plot_layout(2, 1, max_height=15)
# Attempt to reduce the space between triangles.  Does not seem to work.
par(mar=MAR_default-c(2.5, 3.6, 0.7, 0.6))
par(oma=OMA_default-c(1.5, 0, 0.5, 0))


pal_col=rainbow(4)
hcl_col=rainbow_hcl(4)

xyz=c(10, 35, 55)
plot(rcomp(xyz), labels="", col="red", mp=NULL)
# aspanel set so the entire plot is not redrawn
ternaryAxis(side=-1:-3, labels=paste(seq(20,80,by=20),"%"),
                pos=c(0.5,0.5,0.5), col.axis=hcl_col, col.lab=pal_col,
                small=TRUE, aspanel=TRUE,
                Xlab="X", Ylab="Y", Zlab="Z")

# Guessed values in two iterations!
# Using acomp produces curves lines, in two cases???
lines(rcomp(rbind(xyz, c(10, 45, 45))), col=hcl_col[4])
lines(rcomp(rbind(xyz, c(32, 35, 33))), col=hcl_col[4])
lines(rcomp(rbind(xyz, c(22, 23, 55))), col=hcl_col[4])


plot(acomp(xyz), labels="", col="red", mp=NULL)

isoPortionLines(col=hcl_col[4])
# isoProportionLines(col=hcl_col[4])

ternaryAxis(side=0,
                col.axis=hcl_col, col.lab=pal_col,
                small=TRUE, aspanel=TRUE,
                Xlab="X", Ylab="Y", Zlab="Z")

