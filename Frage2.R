##Auswertung Frage 2: 
##Gibt es zwei verschiedene Gruppen?
  #1) vorher wenig sport-> lockdown begonnen da Motivation bekommen
  #2) viele Leute im Lockdown kein Sport, da Motivationsprobleme


##Teil 1
# teildatensatz mit Menschen mit wenig Sport Korrelationsmatrix mit Lockdown
# vergleich Häufigkeit und Dauer

##VERGLEICH VORHER UND LOCKDOWN##
      #STUNDEN
table("voher"= sport$stunden_vor,"im Lockdown"= sport$stunden_lock)
#      im Lockdown
#voher 0 0.5 2 5 8 11

#0     6 1 3 4 3  0
#0.5   1 3 0 0 0  0
#2     5 4 6 3 1  0
#5     8 1 4 4 2  0
#8     3 1 4 2 0  0
#11    0 0 1 2 0  2

# auf der Hauptachse sind 21 Einträge     -> 0.2837838 sportdauer gleich geblieben
# oberhalb der Hauptachse sind 11+4+2 =17 -> 0.2297297 sportdauer länger
# unterhalb 1+9+13+ 10+3= 36              -> 0.4864865 sport weniger

    #--> 0.5135135 mehr oder gleich viel Sport
    #--> 0.4864865 weniger Sport

    #TAGE
table("vorher"= sport$tage_vor, "Lockdown"= sport$tage_lock)
#        Lockdown
#vorher  0  1.5 3.5 5.5  7

#0       6   6   4   1  0
#1.5     6   3   3   1  2
#3.5     11  12  5   4  1
#5.5     0   4   3   2  0

#hauptdiagonale 6+3+5+2= 16 -> 0.2162162 (gleich geblieben)
#oberhalb       11+6+5= 22  -> 0.2972973 (vorher mehr als im Lockdown)
#unterhalb      6+23+7 = 36 -> 0.4864865 (Lockdown mehr als vorher)

    #--> 0.7027027 mehr oder gleich viele tage

##--> mehr tage Sport aber gleiche Läneg-> kurzere Einheiten



##VERGLEICH VORHER UND MOMENTAN##

#STUNDEN
table("Vorher"=sport$stunden_vor, "Momentan"=sport$stunden_mom)

#          Momentan
#Vorher  0 0.5  2  5  8 11

#0       8   1  4  2  1  1
#0.5     2   0  2  0  0  0
#2       4   1 11  2  1  0
#5       2   1  4  9  3  0
#8       0   1  1  6  2  0
#11      0   1  2  0  0  2

#hauptachse-> 8+11+9+2+2 =32  -> 0.4324324 gleich geblieben
#unterhalb->  2+5+7+8+3  =25  -> 0.3378378 vorher mehr 
#oberhalb->   9+2+3+3    =17  -> 0.2297297 momentan mehr


#TAGE
table("Vorher"=sport$tage_vor, "Momentan"=sport$tage_mom)
#         Momentan
#Vorher  0 1.5 3.5 5.5  7

#0       8   5   3   0  1
#1.5     3   8   2   2  0
#3.5     4  11  14   4  0
#5.5     1   5   1   2  0

#hauptdiagonale 8+8+14+2= 32 -> 0.4324324
#unterhalb      3+15+7  = 25 -> 0.3513514
#oberhalb       9+ 4+4  = 17 -> 0.2297297


##VERGLEICH LOCKDOWN MOMENTAN

    #STUNDEN

 table("Lockdown"= sport$stunden_lock,"Momentan"= sport$stunden_mom)
#        Momentan
# Lockdown 0 0.5 2 5 8 11
# 0        8   0 6 7 2  0
# 0.5      5   1 4 0 0  0
# 2        2   2 8 6 0  0
# 5        1   2 5 3 4  0
# 8        0   0 1 3 1  1
# 11       0   0 0 0 0  2
 
#hauptdiagonale: 8+1+8+3+1+2 = 23 -> 0.3108108 (gleich geblieben)
#oberhalb:       15+4+6+4+1= 30   -> 0.4054054 (Momentan mehr als im Lockdown)
#unterhalb:      5+4+8+4 = 21     -> 0.2837838 (Lockdown mehr als Momentan)
 
  #TAGEN
            Momentan
Lockdown #    0 1.5 3.5 5.5 7
         #0   8   8   7   0 0
         #1.5 5   9   7   3 1
         #3.5 3   7   4   1 0
         #5.5 0   3   2   3 0
         #7   0   2   0   1 0
#hauptdiagonale 8+9+4+3= 24 -> 0.3243243
#oberhalb       15+11+1= 27 -> 0.3648649
#unterhalb      5+10+5+3= 23-> 0.3108108
 
##varianzen -> im Lockdown deutlich größer

wenig<- subset(sport, stunden_vor<1)

#Deskriptive Analyse Datensatz wenig vorher
mean(wenig$stunden_vor)
#0.0952381
var(wenig$stunden_vor)
#[1] 0.04047619
median(wenig$stunden_vor)
#[1] 0
sd(wenig$stunden_vor)
#[1] 0.201187

mean(wenig$stunden_lock)
#0.0952381
var(wenig$stunden_lock)
#[1] 8.811905
median(wenig$stunden_lock)
#[1] 0.5
sd(wenig$stunden_lock)
#[1] 2.968485


barplot(table(wenig$stunden_lock)/21, 
        ylim= c(0,0.4), 
        main= "Anzahl der Studenden der Leute die wenig Sport vor dem Lockdown gemacht haben",
        xlab= "Anzahl der Stunden", ylab= "relative Häufigkeit")
barplot(table(wenig$tage_lock)/21,
        main= "Anzahl der Tage derer die wenig Sport vor dem Lockdown gemacht haben",
        xlab= "Anzahl der Tage", ylab = "relative Häufigkeit")



##vergleich iwie falsch da prozentzahlen nicht richtig sind!!
daten_vor<- matrix(c(table(wenig$tage_vor), table(wenig$tage_lock), table(wenig$tage_mom)), nrow =  2, byrow= TRUE)
barplot(daten_vor/length(wenig$tage_vor), beside= TRUE, main= "Vergleich der Anzahl der Tage", col= c("lightblue", "blue", "darkblue"))
        #names.arg=c("0","1.5", "3.5", "5.5", "7"))

daten_nach<- matrix(c(table(wenig$stunden_vor), table(wenig$stunden_lock), table(wenig$stunden_mom)), nrow =  2, byrow= TRUE)
barplot(daten_nach/length(wenig$tage_vor), beside= TRUE, col=c("lightblue", "blue", "darkblue"))
#Menschen die vorher wenig Sport gemacht haben machen im Lockdown auch nicht viel mehr sport lediglich eineige


##vergelich Motivation der Gruppe
pdf("VergleichMotivationWenigSport.pdf")
motivationWenig<- matrix(c(table(wenig$a_3)/length(wenig$a_3),table(wenig$a_4)/length(wenig$a_4)),nrow=2)
barplot(motivationWenig, beside = TRUE, col= c("blue", "darkblue"), ylim= c(0,0.4), main= "Motivation", names.arg= c("gar nicht", "eher nicht", "neutral", "eher schon", "voll"))
legend("top", fill = c("blue", "darkblue", "lightblue"), 
       legend = c("vorher", "Lockdown", "Momentan"), box.lwd = 0)
dev.off()
#Legende muss an andere Stelle

###TEIL 2
#kennzahlen ausrechenen Zeit und Tageaufwand
mean(sport$tage_vor)
#[1] 2.533784
mean(sport$tage_lock)
#[1] 2.094595
mean(sport$tage_mom)
#[1] 2.222973
barplot(c(mean(sport$tage_vor),mean(sport$tage_lock),mean(sport$tage_mom)), main = "Mean", names.arg= c("vorher", "lockdown", "momentan"), col= c("blue", "darkblue", "lightblue"))


median(sport$tage_vor)
#[1] 3.5
median(sport$tage_lock)
#[1] 1.5
median(sport$tage_mom)
#[1] 1.5
barplot(c(median(sport$tage_vor),median(sport$tage_lock),median(sport$tage_mom)), main = "Median", names.arg= c("vorher", "lockdown", "momentan"), col= c("blue", "darkblue", "lightblue"))


var(sport$tage_vor)
#[1] 3.221446
var(sport$tage_lock)
#[1] 4.169011
var(sport$tage_mom)
#[1] 3.226999
barplot(c(var(sport$tage_vor),var(sport$tage_lock),var(sport$tage_mom)), main = "Varianz", names.arg= c("vorher", "lockdown", "momentan"), col= c("blue", "darkblue", "lightblue"))

sd(sport$tage_vor)
#[1] 1.794839
sd(sport$tage_lock)
#[1] 2.041816
sd(sport$tage_mom)
#[1] 1.796385
barplot(c(sd(sport$tage_vor),sd(sport$tage_lock),sd(sport$tage_mom)), main = "standartabweichung", names.arg= c("vorher", "lockdown", "momentan") , col= c("blue", "darkblue", "lightblue"))


pdf("KennzahlenübersichtTageUndStundenanzahl.pdf")
par(mfrow=c(4,2))
barplot(c(mean(sport$tage_vor),mean(sport$tage_lock),mean(sport$tage_mom)), main = "Mean", names.arg= c("vorher", "lockdown", "momentan"), col= c("blue", "darkblue", "lightblue"))
barplot(c(median(sport$tage_vor),median(sport$tage_lock),median(sport$tage_mom)), main = "Median", names.arg= c("vorher", "lockdown", "momentan"), col= c("blue", "darkblue", "lightblue"))
barplot(c(var(sport$tage_vor),var(sport$tage_lock),var(sport$tage_mom)), main = "Varianz", names.arg= c("vorher", "lockdown", "momentan"), col= c("blue", "darkblue", "lightblue"))
barplot(c(sd(sport$tage_vor),sd(sport$tage_lock),sd(sport$tage_mom)), main = "standartabweichung", names.arg= c("vorher", "lockdown", "momentan") , col= c("blue", "darkblue", "lightblue"))

barplot(c(mean(sport$stunden_vor),mean(sport$stunden_lock),mean(sport$stunden_mom)), main = "Mean", names.arg= c("vorher", "lockdown", "momentan"), col= c("blue", "darkblue", "lightblue"))
barplot(c(median(sport$stunden_vor), median(sport$stunden_lock),median(sport$stunden_mom)), main = "Median", names.arg= c("vorher", "lockdown", "momentan"), col= c("blue", "darkblue", "lightblue"))
barplot(c(var(sport$stunden_vor),var(sport$stunden_lock),var(sport$stunden_mom)), main = "Varianz", names.arg= c("vorher", "lockdown", "momentan"), col= c("blue", "darkblue", "lightblue"))
barplot(c(sd(sport$stunden_vor),sd(sport$stunden_lock),sd(sport$stunden_mom)), main = "standartabweichung", names.arg= c("vorher", "lockdown", "momentan") , col= c("blue", "darkblue", "lightblue"))
dev.off()


##verhältniss länge und dauer
langeEinheitVor<-  na.omit(sport$stunden_vor/sport$tage_vor)
langeEinheitLock<- na.omit(sport$stunden_lock/sport$tage_lock)
langeEineitMom<-   na.omit(sport$stunden_mom/sport$tage_mom)

mean(langeEinheitVor)
#[1] 1.426293
mean(langeEinheitLock)
#[1] 1.375775
mean(langeEineitMom)
#[1] 1.500858


var(langeEinheitVor)
#[1] 0.4940072
var(langeEinheitLock)
#[1] 1.290519
var(langeEineitMom)
#[1] 0.6351383


median(langeEinheitVor)
#[1] 1.428571
median(langeEinheitLock)
#[1] 1.333333
median(langeEineitMom)
#[1] 1.333333

sd(langeEinheitVor)
#[1] 0.7028565
sd(langeEinheitLock)
#[1] 1.13601
sd(langeEineitMom)
#[1] 0.7969556

##  --> große Veränderung bei Länge der Einheiten streut vorher und nun ungefähr gleich stark aber im Lockdown ist es stärker, in allem 4 Messungen


##Motivation insgesammt während des 3 Phasen
MotivationAllgemein<- matrix(c(table(sport$a_3), table(sport$a_4), table(sport$a_5)), nrow = 3)
barplot(MotivationAllgemein/length(sport$a_3),main= "Motivationszustand", beside=TRUE, col= c("blue", "darkblue", "lightblue"), names.arg= c("unmotiviert", "eher unmotiviert", "neutral", "etwas motiviert", "motiviert"), ylim= c(0,0.4))