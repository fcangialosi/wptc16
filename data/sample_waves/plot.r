library(gdata)
library(ggplot2)
library(R.matlab)
library(data.table)

# Color Scheme
light_grey <- "#6D6D6D"
dark_grey <- "#363636"
light_blue <- "#00BAD5"
dark_blue <- "#0054A6"
light_orange <- "#FFAA00"
dark_orange <- "#FF7400"
soft_green <- "#2DE69E"

# Plain Sona
overlap_1 <- readMat("~/Downloads/Overlap_1.mat")
sona <- data.table(overlap_1$sonaV)
sona$V1 <- sona$V1 * 1000
sona$V0 <- t(overlap_1$sonaT)
sona$V0 <- sona$V0 * 1000000
ggplot(data=sona, aes(x=V0,y=V1,colour=V0)) + geom_line() +
  scale_colour_gradient(low=light_blue, high=dark_blue) + 
  theme(text = element_text(colour="white", size=46, family="Book Antiqua", face="bold"), 
        panel.background = element_rect(fill=dark_grey, colour=light_blue, size=2), 
        legend.position="none", 
        plot.background = element_rect(fill=dark_grey, colour=dark_orange, size=2), 
        axis.text=element_text(colour="white", size=46, family="Book Antiqua"), 
        axis.ticks=element_line(colour="white")) +
  xlab("Time (us)") + 
  ylab("Voltage (mV)") + 
  ggtitle("Sona\n")

# Plain Reconstruction
recon <- data.table(overlap_1$overReconV)
recon$V1 <- recon$V1 * 1000
recon$V0 <- t(overlap_1$overReconT)
recon$V0 <- recon$V0 * 1000000
ggplot(data=recon, aes(x=V0,y=V1,colour=V0)) + geom_line() +
  scale_colour_gradient(low=dark_orange, high=light_orange) + 
  theme(text = element_text(colour="white", size=46, family="Book Antiqua", face="bold"), 
        panel.background = element_rect(fill=dark_grey, colour=light_blue, size=2), 
        legend.position="none", 
        plot.background = element_rect(fill=dark_grey, colour=dark_orange, size=2), 
        axis.text=element_text(colour="white", size=46, family="Book Antiqua"), 
        axis.ticks=element_line(colour="white")) +
  xlab("Time (us)") + 
  ylab("Voltage (mV)") + 
  ggtitle("Reconstruction\n")

# Multiple Sonas
overlap_5 <- readMat("~/Downloads/Overlap_5.mat")
mult_sona <- data.table(overlap_5$overSonaV)
mult_sona$V1 <- mult_sona$V1*1000
mult_sona$V0 <- t(overlap_5$overSonaT)
mult_sona$V0 <- mult_sona$V0*1000000
ggplot(data=mult_sona, aes(x=V0,y=V1,colour=V0)) + geom_line() +
  scale_colour_gradient(low=light_blue, high=light_blue) + 
  theme(text = element_text(colour="white", size=46, family="Book Antiqua", face="bold"), 
        panel.background = element_rect(fill=dark_grey, colour=light_blue, size=2), 
        legend.position="none", 
        plot.background = element_rect(fill=dark_grey, colour=dark_orange, size=2), 
        axis.text=element_text(colour="white", size=46, family="Book Antiqua"), 
        axis.ticks=element_line(colour="white")) +
  xlab("Time (us)") + 
  ylab("Voltage (mV)") + 
  ggtitle("Overlapped Sonas\n")

# Multiple Reconstructions
mult_recon <- data.table(overlap_5$overReconV)
mult_recon$V1 <- mult_recon$V1 * 1000
mult_recon$V0 <- t(overlap_5$overReconT)
mult_recon$V0 <- mult_recon$V0 * 1000000
ggplot(data=mult_recon, aes(x=V0,y=V1,colour=V0)) + geom_line() +
  scale_colour_gradient(low=light_orange, high=light_orange) + 
  theme(text = element_text(colour="white", size=46, family="Book Antiqua", face="bold"),
        panel.background = element_rect(fill=dark_grey, colour=light_blue, size=2), 
        legend.position="none", 
        plot.background = element_rect(fill=dark_grey, colour=dark_orange, size=2), 
        axis.text=element_text(colour="white", size=46, family="Book Antiqua"), 
        axis.ticks=element_line(colour="white")) +
  xlab("Time (us)") + 
  ylab("Voltage (mV)") + 
  ggtitle("Overlapped Reconstructions\n")

# Reconstructions at Multiple Locations
mult <- read.xls("~/Downloads/Data for CST.xlsx")
m <- data.table(mult)
colnames(m) <- c("time","d1", "d2")
m$d1 <- m$d1*1000
m$d2 <- m$d2*1000
ggplot(data=m, aes(x=time)) + 
  geom_density(aes(y=d1, colour="Diode 1"), stat="identity") + 
  geom_density(aes(y=d2, colour="Diode2"), stat="identity") + 
  scale_color_manual("Legend", labels = c("Diode 1", "Diode 2"), 
                     values = c(light_blue, dark_orange)) +
  xlab("Time (us)") + 
  ylab("Voltage (mV)\n") + 
  theme(text = element_text(colour="white", size=46, family="Book Antiqua", face="bold"), 
        panel.background = element_rect(fill=dark_grey, colour=light_blue, size=2), 
        legend.position="none",
        axis.title.y=element_text(vjust=-0.5),
        plot.background = element_rect(fill=dark_grey, colour=dark_orange, size=2), 
        axis.text=element_text(colour="white", size=46, family="Book Antiqua"), 
        axis.ticks=element_line(colour="white")) +
  ggtitle("Reconstructions at Separate Locations\n")

# Pulse Inversion
pi <- readMat("~/Downloads/PI No Linear Amplified-1.mat")
pi.table <- data.table(pi$normalV)
colnames(pi.table) <- c("normal")
pi.table$normal <- pi.table$normal * 1000

pi.table$time <- t(pi$normalT)
pi.table$time <- pi.table$time * 1000000

pi.table$inverse <- pi$shiftedInverse
pi.table$inverse <- pi.table$inverse * 1000

# Needed for overview plot
pi.table$higherInverse <- pi.table$inverse + 50

# Setup mini
center <- which.max(pi.table$normal)
tuning <- 25
left <- center - tuning
right <- center + tuning
mini <- pi.table[left:right]

# Normal mini plot
ggplot(data=mini, aes(x=time)) + 
  geom_density(aes(y=normal, colour="Diode 1"), stat="identity") + 
  geom_density(aes(y=inverse, colour="Diode 2"), stat="identity") + 
  scale_color_manual("Legend", labels = c("Normal", "Inverse"), 
                     values = c(dark_orange, soft_green)) +
  xlab("Time (us)") + 
  ylab("Voltage (mV)") + 
  theme(text = element_text(colour="white", size=16, family="Book Antiqua", face="bold"), 
        panel.background = element_rect(fill=dark_grey, colour=light_blue, size=2), 
        legend.position="none", 
        plot.background = element_rect(fill=dark_grey, colour=dark_orange, size=2), 
        legend.background = element_rect(fill=dark_grey, colour=light_blue, size=1.5), 
        axis.text=element_text(colour="white", size=16), 
        axis.ticks=element_line(colour="white")) +
  ggtitle("Pulse Inversion\n")

# Plain mini plot, no labels 
ggplot(data=mini, aes(x=time)) + 
  geom_density(aes(y=normal, colour="Diode 1"), stat="identity") + 
  geom_density(aes(y=inverse, colour="Diode 2"), stat="identity") + 
  scale_color_manual("Legend", labels = c("Normal", "Inverse"), 
                     values = c(dark_orange, soft_green)) +
  xlab("Time (us)") + 
  ylab("Voltage (mV)") + 
  theme(panel.background = element_rect(fill=dark_grey, colour=light_blue, size=2), 
        axis.line=element_blank(),axis.text.x=element_blank(),
        axis.text.y=element_blank(),axis.ticks=element_blank(),
        axis.title.x=element_blank(),
        axis.title.y=element_blank(),legend.position="none",
        plot.background = element_rect(fill=dark_grey, colour=dark_orange, size=2))

# Overview plot
ggp <- ggplot(data=pi.table, aes(x=time)) +
geom_density(aes(y=normal, colour="Diode 1"), stat="identity") +
geom_density(aes(y=higherInverse, colour="Diode 2"), stat="identity") +
scale_color_manual("Legend", labels = c("Normal", "Inverse"),
values = c(dark_orange, soft_green)) +
xlab("Time (us)") +
ylab("Voltage (mV)") +
theme(text = element_text(colour="white", size=46, family="Book Antiqua", face="bold"),
panel.background = element_rect(fill=dark_grey, colour=light_blue, size=2),
legend.position="none",
plot.background = element_rect(fill=dark_grey, colour=dark_orange, size=2),
legend.background = element_rect(fill=dark_grey, colour=light_blue, size=1.5),
axis.text=element_text(colour="white", size=46),
axis.ticks=element_line(colour="white")) +
ggtitle("Pulse Inversion\n") + scale_y_continuous(labels=c("-25","0","25","0"), breaks=c(-25,0,25,50))

# Doesn't work??? (filt sum v)
ggplot(data=pi.table, aes(x=time,y=filtSum,colour=time)) + geom_line() +
  scale_colour_gradient(low=light_blue, high=dark_blue) + 
  theme(text = element_text(colour="white", size=32, family="Book Antiqua", face="bold"), 
        panel.background = element_rect(fill=dark_grey, colour=light_blue, size=2), 
        legend.position="none", 
        plot.background = element_rect(fill=dark_grey, colour=dark_orange, size=2), 
        axis.text=element_text(colour="white", size=32, family="Book Antiqua"), 
        axis.ticks=element_line(colour="white")) +
  xlab("Time (us)") + 
  ylab("Voltage (mV)") + 
  ggtitle("Filtered Summation\n")