#estraziome e pulizia dei dati
dataset <- read.csv("C:/Users/anziv/Downloads/Dataset_gruppo4.csv")
str(dataset)
View(dataset)
summary(dataset)

# Analisi delle prime 5 righe del dataset
head(data)
# Analisi delle ultime 5 righe del dataset
tail(data) 

#Controlliamo che non ci siano colonne uguali e che i dati siano numerici 
str(data) 

#calcolo di upper e lower bound per gli outliers 
#RAM: 
Q <- quantile(dataset$x1_RAM, probs=c(.25, .75), na.rm = FALSE) 
iqr <- IQR(dataset$x1_RAM) 
up <-  Q[2]+1.5*iqr # Upper Range   
low<- Q[1]-1.5*iqr # Lower Range﻿ 
up 
low 
#CPU: 
Q <- quantile(dataset$x2_CPU, probs=c(.25, .75), na.rm = FALSE) 
iqr <- IQR(dataset$x2_CPU) 
up <-  Q[2]+1.5*iqr # Upper Range   
low<- Q[1]-1.5*iqr # Lower Range﻿ 
up 
low 
#HD: 
Q <- quantile(dataset$x3_HD, probs=c(.25, .75), na.rm = FALSE) 
iqr <- IQR(dataset$x3_HD) 
up <-  Q[2]+1.5*iqr # Upper Range   
low<- Q[1]-1.5*iqr # Lower Range﻿ 
up 
low 
#Cong: 
Q <- quantile(dataset$x4_Cong, probs=c(.25, .75), na.rm = FALSE) 
iqr <- IQR(dataset$x4_Congestione) 
up <-  Q[2]+1.5*iqr # Upper Range   
low<- Q[1]-1.5*iqr # Lower Range﻿ 
up 
low 
#Buff: 
Q <- quantile(dataset$x5_Buff, probs=c(.25, .75), na.rm = FALSE) 
iqr <- IQR(dataset$x5_Buff) 
up <-  Q[2]+1.5*iqr # Upper Range   
low<- Q[1]-1.5*iqr # Lower Range﻿ 
up 
low 

#Cerco gli outliers per ogni colonna 
outliersRAM <- boxplot(dataset$x1_RAM, plot=FALSE)$out 
outliersRAM 
outliersCPU <- boxplot(dataset$x2_CPU, plot=FALSE)$out 
outliersCPU 
outliersHD <- boxplot(dataset$x3_HD, plot=FALSE)$out 
outliersHD 
outliersCONG <- boxplot(dataset$x4_Congestione, plot=FALSE)$out 
outliersCONG 
outliersBUFF <- boxplot(dataset$x5_Buff, plot=FALSE)$out 
outliersBUFF 

#Creazione boxplot
performance <- dataset[, 1]
boxplot(performance, main="Boxplot Performance", ylab= "Valori", col="lightgreen")
ram <- dataset[, 2] 
boxplot(ram, main="Boxplot Ram", ylab= "Valori", col="lightgreen")
cpu <- dataset[, 3] 
boxplot(cpu, main="Boxplot CPU", ylab= "Valori", col="lightgreen")
hd <- dataset[, 4] 
boxplot(hd, main="Boxplot HD", ylab= "Valori", col="lightgreen")
cong <- dataset[, 5] 
boxplot(cong, main="Boxplot Congestione", ylab= "Valori", col="lightgreen")
buff <- dataset[, 6] 
boxplot(buff, main="Boxplot Buffer", ylab= "Valori", col="lightgreen")

#Calcolo escursione campionaria
rangePerformance <- max(performance) - min(performance)
rangeRam <- max(ram) - min(ram)
rangeCpu <- max(cpu) - min(cpu)
rangeHd <- max(hd) - min(hd)
rangeCong <- max(cong) - min(cong)
rangeBuff <- max(buff) - min(buff)

#Calcolo varianza
varPerformance <- var(performance)
varRam <- var(ram)
varCpu <- var(cpu)
varHd <- var(hd)
varCong <- var(cong)
varBuff <- var(buff)

#Calcolo deviazione standard
devPerformance <- sd(performance)
devRam <- sd(ram)
devCpu <- sd(cpu)
devHd <- sd(hd)
devCong <- sd(cong)
devBuff <- sd(buff)

#Intervalli di classi
ampiezzaRam <- (max(ram) - min(ram))/7
intervalliRam <- seq(min(ram), max(ram) + 0.1, by=ampiezzaRam)
frequenze_assoluteRam <- cut(ram, breaks=intervalliRam, right=FALSE, include.lowest=TRUE)
tabella_frequenzeRam <- table(frequenze_assoluteRam)
tabella_relativeRam <- tabella_frequenzeRam/length(ram)

ampiezzaCpu <- (max(cpu) - min(cpu))/7
intervalsCpu <- seq(min(cpu), max(cpu) + 0.1, by=ampiezzaCpu)
frequenze_assoluteCpu <- cut(cpu, breaks=intervalsCpu, right=FALSE, include.lowest=TRUE)
tabella_frequenzeCpu <- table(frequenze_assoluteCpu)
tabella_relativeCpu <- tabella_frequenzeCpu/length(cpu)

ampiezzaHd <- (max(hd) - min(hd))/7
intervalsHd <- seq(min(hd), max(hd) + 0.1, by=ampiezzaHd)
frequenze_assoluteHd <- cut(hd, breaks=intervalsHd, right=FALSE, include.lowest=TRUE)
tabella_frequenzeHd <- table(frequenze_assoluteHd)
tabella_relativeHd <- tabella_frequenzeHd/length(hd)

ampiezzaCong <- (max(cong) - min(cong))/7
intervalsCong <- seq(min(cong), max(cong) + 0.1, by=ampiezzaCong)
frequenze_assoluteCong <- cut(cong, breaks=intervalsCong, right=FALSE, include.lowest=TRUE)
tabella_frequenzeCong <- table(frequenze_assoluteCong)
tabella_relativeCong <- tabella_frequenzeCong/length(cong)

ampiezzaBuff <- (max(buff) - min(buff))/7
intervalsBuff <- seq(min(buff), max(buff) + 0.1, by=ampiezzaBuff)
frequenze_assoluteBuff <- cut(buff, breaks=intervalsBuff, right=FALSE, include.lowest=TRUE)
tabella_frequenzeBuff <- table(frequenze_assoluteBuff)
tabella_relativeBuff <- tabella_frequenzeBuff/length(buff)

ampiezzaPerformance <- (max(performance) - min(performance))/7
intervalsPerformance <- seq(min(performance), max(performance) + 0.1, by=ampiezzaPerformance)
frequenze_assolutePerformance <- cut(performance, breaks=intervalsPerformance, right=FALSE, include.lowest=TRUE)
tabella_frequenzePerformance <- table(frequenze_assolutePerformance)
tabella_relativePerformance <- tabella_frequenzePerformance/length(buff)

#Calcola centri di classe
centri_di_classePerformance <- (intervalsPerformance[-length(intervalsPerformance)] + intervalsPerformance[-1]) / 2
centri_di_classeRam <- (intervalliRam[-length(intervalliRam)] + intervalliRam[-1]) / 2
centri_di_classeCpu <- (intervalsCpu[-length(intervalsCpu)] + intervalsCpu[-1]) / 2
centri_di_classeHd <- (intervalsHd[-length(intervalsHd)] + intervalsHd[-1]) / 2
centri_di_classeCong <- (intervalsCong[-length(intervalsCong)] + intervalsCong[-1]) / 2
centri_di_classeBuff <- (intervalsBuff[-length(intervalsBuff)] + intervalsBuff[-1]) / 2

#Definizione istogramma
histPerformance<-hist(performance, breaks = intervalsPerformance, xlab="Performance", main="Istogramma Performance", col="lightgreen")
par(new=TRUE)
par(oma = c(0.1, 0.9, 0.1, 3))
plot(density(performance), xlab="", ylab="", main="", axes=FALSE, col="red", lwd=2)
axis(side = 4, at = pretty(range(density(performance)$y)), col = "black", col.axis = "black")
mtext("Density", side = 4, line = 3, col = "black")

histRam<-hist(ram, breaks = intervalliRam, xlab="Ram", main="Istogramma Ram", col="lightgreen")
par(new=TRUE)
par(oma = c(0.1, 0.9, 0.1, 3))
plot(density(ram), xlab="", ylab="", main="", axes=FALSE, col="red", lwd=2)
axis(side = 4, at = pretty(range(density(ram)$y)), col = "black", col.axis = "black")
mtext("Density", side = 4, line = 3, col = "black")

histCpu<-hist(cpu, breaks = intervalsCpu, xlab="Cpu", main="Istogramma Cpu", col="lightgreen")
par(new=TRUE)
par(oma = c(0.1, 0.9, 0.1, 3))
plot(density(cpu), xlab="", ylab="", main="", axes=FALSE, col="red", lwd=2)
axis(side = 4, at = pretty(range(density(cpu)$y)), col = "black", col.axis = "black")
mtext("Density", side = 4, line = 3, col = "black")

histHd<-hist(hd, breaks = intervalsHd, xlab="Hd", main="Istogramma Hd", col="lightgreen")
par(new=TRUE)
par(oma = c(0.1, 0.9, 0.1, 3))
plot(density(hd), xlab="", ylab="", main="", axes=FALSE, col="red", lwd=2)
axis(side = 4, at = pretty(range(density(hd)$y)), col = "black", col.axis = "black")
mtext("Density", side = 4, line = 3, col = "black")

histCong<-hist(cong, breaks = intervalsCong, xlab="Congestione", main="Istogramma Congestione", col="lightgreen")
par(new=TRUE)
par(oma = c(0.1, 0.9, 0.1, 3))
plot(density(cong), xlab="", ylab="", main="", axes=FALSE, col="red", lwd=2)
axis(side = 4, at = pretty(range(density(cong)$y)), col = "black", col.axis = "black")
mtext("Density", side = 4, line = 3, col = "black")

histBuff<-hist(buff, breaks = intervalsBuff, xlab="Buffer", main="Istogramma Buffer", col="lightgreen")
par(new=TRUE)
par(oma = c(0.1, 0.9, 0.1, 3))
plot(density(buff), xlab="", ylab="", main="", axes=FALSE, col="red", lwd=2)
axis(side = 4, at = pretty(range(density(buff)$y)), col = "black", col.axis = "black")
mtext("Density", side = 4, line = 3, col = "black")

#Creazione grafici a gradino
frequenze_cumulate_Performance=c(5, 11, 19, 35, 51, 59, 60)
step_fun_Performance<-stepfun(centri_di_classePerformance[1:6], frequenze_cumulate_Performance)
plot(step_fun_Performance, main="Grafico a Gradino Performance", xlab="Performance", ylab="Frequency", col="red")

frequenze_cumulate_Ram=c(12, 16, 26, 34, 45, 52, 60)
step_fun_Ram<-stepfun(centri_di_classeRam[1:6], frequenze_cumulate_Ram)
plot(step_fun_Ram, main="Grafico a Gradino Ram", xlab="Ram", ylab="Frequency", col="red")

frequenze_cumulate_Cpu=c(8, 15, 26, 34, 42, 51, 60)
step_fun_Cpu<-stepfun(centri_di_classeCpu[1:6], frequenze_cumulate_Cpu)
plot(step_fun_Cpu, main="Grafico a Gradino Cpu", xlab="Cpu", ylab="Frequency", col="red")

frequenze_cumulate_Hd=c(11, 18, 26, 38, 45, 51, 60)
step_fun_Hd<-stepfun(centri_di_classeHd[1:6], frequenze_cumulate_Hd)
plot(step_fun_Hd, main="Grafico a Gradino Hd", xlab="Hd", ylab="Frequency", col="red")

frequenze_cumulate_Cong=c(7, 15, 27, 33, 39, 50, 60)
step_fun_Cong<-stepfun(centri_di_classeCong[1:6], frequenze_cumulate_Cong)
plot(step_fun_Cong, main="Grafico a Gradino Congestione", xlab="Congestione", ylab="Frequency", col="red")

frequenze_cumulate_Buff=c(11, 18, 26, 38, 45, 51, 60)
step_fun_Buff<-stepfun(centri_di_classeBuff[1:6], frequenze_cumulate_Buff)
plot(step_fun_Buff, main="Grafico a Gradino Buffer", xlab="Buffer", ylab="Frequency", col="red")

#scatter plot
plot(performance,main="Scatter Plot",col="green",xlab="N_campioni")
plot(ram,main="Scatter Plot",col="green",xlab="N_campioni")
plot(cpu,main="Scatter Plot",col="green",xlab="N_campioni")
plot(hd,main="Scatter Plot",col="green",xlab="N_campioni")
plot(cong,main="Scatter Plot",col="green",xlab="N_campioni")
plot(buff,main="Scatter Plot",col="green",xlab="N_campioni")

# Installazione e caricamento del pacchetto ggplot2 se non è già installato
if (!require(ggplot2)) {
  install.packages("ggplot2")
  library(ggplot2)
}

#calcolo p-value e R^2
sm1 = lm(performance ~ ram, data=dataset)
summary(sm1) # 0.66% R^2 ma il p-value di x1 (e anche quello generale) è 0.53 > 0.05, quindi andrebbe scartata
sm2 = lm(performance ~ cpu, data=dataset)
summary(sm2) # 16% R^2 -> 2° 
sm3 = lm(performance ~ hd, data=dataset)
summary(sm3) # 10% R^2 -> 3°
sm4 = lm(performance ~ cong, data=dataset)
summary(sm4) # 53% R^2 -> 1°
sm5 = lm(performance ~ buff, data=dataset)
summary(sm5) # 2.42% R^2, ma il p-value di x2 (e anche quello generale) è 0.70 > 0.05, quindi andrebbe scartata

# Plotting modelli lineari con R^2 maggiore

par(mfrow=c(1,3))
plot(cong, performance, ylab = "Prestazioni software", xlab = "Indice di Congestione")
abline(lm(performance ~ cong) , col = "blue")
plot( cpu, performance, ylab = "Prestazioni software", xlab = "Indice CPU")
abline(lm(performance ~ cpu) , col = "blue")
plot( hd, performance, ylab = "Prestazioni software", xlab = "Indice HD")
abline(lm(performance ~ hd) , col = "blue")
plot(ram, performance, ylab = "Prestazioni software", xlab = "Indice RAM")
abline(lm(performance ~ ram) , col = "blue")
plot( buff, performance, ylab = "Prestazioni software", xlab = "Indice Buff")
abline(lm(performance ~ buff) , col = "blue")
par(mfrow=c(1,1))
if (!require(leaps)) {
  install.packages("leaps")
  library(leaps)
}

# normal Q-Q plot
qqnorm(performance, main = "Normal Q-Q Plot",ylab="Performance Server",col="green")
qqline(performance, col = "orange")

qqnorm(ram, main = "Normal Q-Q Plot",ylab="ram",col="green")
qqline(ram, col = "orange")

qqnorm(cpu, main = "Normal Q-Q Plot",ylab="cpu",col="green")
qqline(cpu, col = "orange")

qqnorm(hd, main = "Normal Q-Q Plot",ylab="hd",col="green")
qqline(hd, col = "orange")

qqnorm(cong, main = "Normal Q-Q Plot",ylab="cong",col="green")
qqline(cong, col = "orange")

qqnorm(buff, main = "Normal Q-Q Plot",ylab="buff",col="green")
qqline(buff, col = "orange")

#analisi di creazione del modello statistico
myreg=lm(formula = performance ~ cong+ cpu+hd , data=dataset)
myreg$coef
summary(myreg)
fit1=lm(formula = performance ~ cpu+ cong + hd+ (cong*hd), data=dataset)
fit1$coef
anova(myreg,fit1)

#intervallo di confidenza dei parametri
confint(myreg,level = 0.95)

#intervallo di confidenza della variabile Y
sample_mean=mean(performance)
n_sample=(length(performance))
z_value=qnorm(0.975, lower.tail = T)
lower_conf_int_95=sample_mean-z_value*sd(performance)/sqrt(60)
upper_conf_int_95=sample_mean+z_value*sd(performance)/sqrt(60)
plot(performance+rnorm(length(performance),0,.1), rnorm(length(performance),0,.1), xlab="Performance Server", ylab="",yaxt='n', pch=20, ylim=c(-2,2))
points(sample_mean,0,pch=3,col="blue", cex=1.2)
abline(v=lower_conf_int_95,col='red',  lwd=2)
abline(v=upper_conf_int_95,col='red',  lwd=2)
legend("bottomright", legend=c("sample points","est. mean","","IC 95%"), col=c("black","blue","black","red"), lwd=c(NA,NA,NA,2), lty=c(NA,NA,NA,1), pch=c(20,3,NA,NA), cex=0.7)
print(lower_conf_int_95)
print(upper_conf_int_95)

#calcolo coefficiente di determinazione
SQTOT <- sum((performance - mean(performance))^2)
print(SQTOT)
SQR <- sum(residuals(myreg)^2)
print(SQR)
SQE<- SQTOT-SQR
print(SQE)
R_squared <- SQE / SQTOT
print(R_squared)

# Assunzione di  linearità dei residui 
plot(myreg, 1)

#Test di ipotesi per la linearità
residui <- residuals(myreg)
t_test <- t.test(residui, mu=0)
print(t_test)

#valutazione della normalità del modello
residui <- residuals(myreg)
qqnorm(residui)
qqline(residui, col = "red") # Aggiungere una linea di riferimento

#Adattamento del modello di regressione
modelloiniziale <- lm(formula = performance ~ cpu, data= dataset)
modellofinale <- lm(formula = performance ~ cong + cpu + hd , data=dataset)
modellototale <- lm(formula = performance ~ ram + ram^2 + ram^3 + cpu + cpu^2 + cpu^3 + hd + hd^2 + hd^3 + cong + cong^2 + cong^3 + buff + buff^2 + buff^3)
step(modelloiniziale, 
     scope= list(lower= modelloiniziale, upper = modellototale), 
     direction= "forward")
step(modellototale, direction= "backward")
step(modelloiniziale, 
     scope = list(lower= modelloiniziale, upper=modellototale), 
     direction= "both")

#Modello risultante dallo regressione stepwise
modellostep <- lm(formula = performance ~ cpu + hd+ cong + buff, data=dataset)

#calcolo indici di adattamento
extractAIC(modellofinale, scale = 0, k = 3)
extractAIC(modellostep, scale = 0, k = 4)
extractAIC(modellofinale, scale = 0, k = log(60))
extractAIC(modellostep, scale = 0, k = log(60))