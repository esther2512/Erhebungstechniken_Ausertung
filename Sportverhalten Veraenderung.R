
# Sportverhalten Veraenderung:

#einlesen Marina

library(openxlsx)

setwd("C:/Users/marin/OneDrive - Technische Universität Dortmund/Github/Erhebungstechniken_Auswertung")
load("C:/Users/marin/OneDrive - Technische Universität Dortmund/Github/Erhebungstechniken_Auswertung/Sportdaten_bereinigt.RData")
sport


## Veraenderung Selbseinschaetzung:

#pdf("Sportverhalten Veraenderung Selbtseinschaetzung Boxplot.pdf")
boxplot(sport$a_1,
        main = "Waehrend des Lockdowns hat sich mein Sportverhalten veraendert.",
        names.arg = c("stimme gar nicht zu", "stimme eher nicht zu", "neutral", "stimme eher zu", "stimme voll zu"),
        col = c("lightblue"))
#dev.off()

mean(sport$a_1)
#[1] 1.202703


#pdf("Sportverhalten Veraenderung Selbsteinschaetzung absolut.pdf")
par(mai = c(1, 2, 1, 2))
barplot(table(sport$a_1), col = c("lightblue"),
        main = "Waehrend des Lockdowns hat sich mein Sportverhalten veraendert.",
        xlab = "absolute Haeufigkeit",
        names.arg = c("stimme gar nicht zu", "stimme eher nicht zu", "neutral", "stimme eher zu", "stimme voll zu"),
        horiz = TRUE, las =1)
#dev.off()              


# relativ:

#pdf("Sportverhalten Veraenderung Selbsteinschaetzung relativ.pdf")
par(mai = c(1, 2, 1, 2))
barplot(table(sport$a_1)/sum(table(sport$a_1))*100, col = c("lightblue"),
        main = "Waehrend des Lockdowns hat sich mein Sportverhalten veraendert.",
        xlab = "relative Haeufigkeit",
        names.arg = c("stimme gar nicht zu", "stimme eher nicht zu", "neutral", "stimme eher zu", "stimme voll zu"),
        horiz = TRUE, las =1)
#dev.off()              # Bei den allermeisten Sportverhalten veraendert (fast 50% volle Zustimmung)


## Auswirkungs auf momentanes Sportverhalten Selbsteinschaetzung:

#pdf("Auswirkungen auf momentanes Sportverhalten Boxplot.pdf")
boxplot(sport$a_2,
        main = "Die Pandemie hatte auch Auswirkungen auf mein momentanes Sportverhalten.",
        col = "lightblue")
#dev.off()

mean(sport$a_2)
#[1] 0.5675676



#pdf("Auswirkungen auf momentanes Sportverhalten Selbseinschaetzung absolut.pdf")
par(mai = c(1, 2, 1, 2))
barplot(table(sport$a_2), col = c("lightblue"),
        main = "Die Pandemie hatte auch Auswirkungen auf mein momentanes Sportverhalten.",
        xlab = "absolute Haeufigkeit",
        names.arg = c("stimme gar nicht zu", "stimme eher nicht zu", "neutral", "stimme eher zu", "stimme voll zu"),
        horiz = TRUE, las =1)
#dev.off()


# relativ:

#pdf("Auswirkungen auf momentanes Sportverhalten relativ.pdf")
par(mai = c(1, 2, 1, 2))
barplot(table(sport$a_2)/sum(table(sport$a_2))*100, col = c("lightblue"),
        main = "Die Pandemie hatte auch Auswirkungen auf mein momentanes Sportverhalten.",
        xlab = "relative Haeufigkeit",
        names.arg = c("stimme gar nicht zu", "stimme eher nicht zu", "neutral", "stimme eher zu", "stimme voll zu"),
        horiz = TRUE, las =1)
#dev.off()              # Bei den meisten auch Auswirkungen auf momentanes Sportverhalten


## Sportverhalten Veraenderung Tage

#pdf("Sportverhalten Tage vorher Boxplot.pdf")
boxplot(sport$tage_vor,
        main = "Sportverhalten Tage vorher",
        col = "lightblue")
#dev.off()

mean(sport$tage_vor)
#[1] 2.533784                   # Vor Lockdown am meisten Tagen Sport gemacht

#pdf("Sportverhalten Tage vorher Boxplot.pdf")
boxplot(sport$tage_lock,
        main = "Sportverhalten Tage im Lockdown",
        col = "lightblue")
#dev.off()

mean(sport$tage_lock)
#[1] 2.094595                   # Waehrend Lockdown am wenigsten Tagen Sport gemacht. Unterschied von ca. 0,5 Tagen.


#pdf("Sportverhalten Tage vorher Boxplot.pdf")
boxplot(sport$tage_mom,
        main = "Sportverhalten Tage momentan",
        col = "lightblue")
#dev.off()

mean(sport$tage_mom)
#[1] 2.222973                  



tage <- matrix(c(table(sport$tage_vor),0, table(sport$tage_lock), table(sport$tage_mom)), nrow = 3, byrow = TRUE)
tage

#pdf("Sportverhalten Veraenderung Tage absolut.pdf")
par(mai = c(1, 2, 1, 1))
barplot(tage, beside = TRUE, col = c("blue", "darkblue", "lightblue"),
        main = "Sportverhalten Veraenderung Tage",
        xlab = "absolute Haeufigkeit",
        names.arg = c("gar nicht", "an 1-2 Tagen", "an 1-2 Tagen", "an 3-4 Tagen", "an 7 Tagen"),
        horiz = TRUE, las =1)
legend("top", fill = c("lightblue", "darkblue", "blue"), box.lty = 0,
       legend = c("momentan", "Lockdown","vorher"))
#dev.off()


# relativ:

sum(tage[1,])
sum(tage[2,])
sum(tage[3,])

#pdf("Sportverhalten Veraenderung Tage relativ.pdf")
par(mai = c(1, 2, 1, 1))
barplot(tage/sum(tage[1,])*100, beside = TRUE, col = c("blue", "darkblue", "lightblue"),
        main = "Sportverhalten Veraenderung Tage",
        xlab = "relative Haeufigkeit",
        names.arg = c("gar nicht", "an 1-2 Tagen", "an 3-4 Tagen", "an 5-6 Tagen", "an 7 Tagen"),
        horiz = TRUE, las =1)
legend("top", fill = c("lightblue", "darkblue", "blue"), box.lty = 0,
       legend = c("momentan", "Lockdown","vorher"))
#dev.off()              # Gar kein Sport am ehesten waehrend des Lockdowns. Vorher am meisten "an 3-4 Tagen", 
                        # im Lockdown und momentan am meisten "an 1-2 Tagen". 


## Sportverhalten Veraenderung Stunden


#pdf("Sportverhalten Stunden vorher Boxplot.pdf")
boxplot(sport$stunden_vor,
        main = "Sportverhalten Stunden vorher",
        col = "lightblue")
#dev.off()

mean(sport$stunden_vor)
#[1] 3.648649

#pdf("Sportverhalten Stunden im Lockdown Boxplot.pdf")
boxplot(sport$stunden_lock,
        main = "Sportverhalten Stunden im Lockdown",
        col = "lightblue"
        )
#dev.off()

mean(sport$stunden_lock)
#[1] 2.513514                   # Genau, wie bei Tagen, am meisten vor und am wenigsten vor dem Lockdown. Unterschied von ca. 1 Stunde.


#pdf("Sportverhalten Stunden momentan Boxplot.pdf")
boxplot(sport$stunden_mom,
        main = "Sportverhalten Stunden momentan",
        col = "lightblue"
        )                      
#dev.off()                      # Glecher Boxplot, wie vor dem Lockdown

mean(sport$stunden_mom)
#[1] 3.168919


table(sport$stunden_vor)
table(sport$stunden_lock)
table(sport$stunden_mom)

stunden <- matrix(c(table(sport$stunden_vor), table(sport$stunden_lock), table(sport$stunden_mom)), nrow = 3,
               byrow = TRUE)
stunden

#pdf("Sportverhalten Veraenderung Stunden.pdf")
par(mai = c(1, 2, 1, 1))
barplot(stunden, beside = TRUE, col = c("blue", "darkblue", "lightblue"),
        main = "Sportverhalten Veraenderung Stunden",
        xlab = "absolute Haeufigkeit",
        names.arg = c("0 Stunden", "bis zu einer Stunde", "1-3 Stunden", "an 4-6 Stunden", "an 7-9 Stunden", "mehr als 9 Stunden"),
        horiz = TRUE, las =1)
legend("top", fill = c("lightblue", "darkblue", "blue"), box.lty = 0,
       legend = c("momentan", "Lockdown","vorher"))
#dev.off()


# relativ:

sum(stunden[1,])
sum(stunden[2,])
sum(stunden[3,])

#pdf("Sportverhalten Veraenderung Stunden.pdf")
par(mai = c(1, 2, 1, 1))
barplot(stunden/sum(stunden[1,])*100, beside = TRUE, col = c("blue", "darkblue", "lightblue"),
        main = "Sportverhalten Veraenderung Stunden",
        xlab = "relative Haeufigkeit",
        names.arg = c("0 Stunden", "bis zu einer Stunde", "1-3 Stunden", "an 4-6 Stunden", "an 7-9 Stunden", "mehr als 9 Stunden"),
        horiz = TRUE, las =1)
legend("top", fill = c("lightblue", "darkblue", "blue"), box.lty = 0,
       legend = c("momentan", "Lockdown","vorher"))
#dev.off()


## Kreuzmatrix Stunden x Tage   

v <- xtabs(~ sport$stunden_vor + sport$tage_vor)
v

#pdf("Stunden x Tage  vorher absolut")
par(mai = c(1, 2, 1, 1))
barplot(v, horiz = TRUE, beside = TRUE, col = c("blue", "darkblue", "lightblue", "green", "darkgreen", "lightgreen"),
        main = "Stunden x Tage  vorher",
        xlab = "absolute Haeufigkeit",
        names.arg = c("gar nicht", "an 1-2 Tagen", "an 3-4 Tagen", "an 5-6 Tagen"), las =  2)
legend("topright", fill = c( "lightgreen", "darkgreen", "green", "lightblue", "darkblue", "blue"), box.lty = 0,
       legend = c("mehr als 9 Stunden","an 7-9 Stunden", "an 4-6 Stunden", "1-3 Stunden", "bis zu einer Stunde", "0 Stunden"))
#dev.off()              # Passt ungefaehr ueberein: an desto mehr Tagen, umso mehr Stunden insgesamt


# relativ:

#pdf("Stunden x Tage vorher relativ")
par(mai = c(1, 2, 1, 1))
barplot(v/sum(v)*100, horiz = TRUE, beside = TRUE, col = c("blue", "darkblue", "lightblue", "green", "darkgreen", "lightgreen"),
        main = "Stunden x Tage  vorher",
        xlab = "relative Haeufigkeit",
        names.arg = c("gar nicht", "an 1-2 Tagen", "an 3-4 Tagen", "an 5-6 Tagen"), las =  2)
legend("topright", fill = c( "lightgreen", "darkgreen", "green", "lightblue", "darkblue", "blue"), box.lty = 0,
       legend = c("mehr als 9 Stunden","an 7-9 Stunden", "an 4-6 Stunden", "1-3 Stunden", "bis zu einer Stunde", "0 Stunden"))
#dev.off()



l<- xtabs(~ sport$stunden_lock + sport$tage_lock)
l

#pdf("Stunden x Tage  im Lockdown absolut")
par(mai = c(1, 2, 1, 1))
barplot(l, horiz = TRUE, beside = TRUE, col = c("blue", "darkblue", "lightblue", "green", "darkgreen"),
        main = "Stunden x Tage  im Lockdown",
        xlab = "absolute Haeufigkeit",
        names.arg = c("gar nicht", "an 1-2 Tagen", "an 3-4 Tagen", "an 5-6 Tagen", "an 7 Tagen"), las =  2)
legend("topright", fill = c( "lightgreen", "darkgreen", "green", "lightblue", "darkblue", "blue"), box.lty = 0,
       legend = c("mehr als 9 Stunden","an 7-9 Stunden", "an 4-6 Stunden", "1-3 Stunden", "bis zu einer Stunde", "0 Stunden"))
#dev.off()


# relativ:

#pdf("Stunden x Tage  im Lockdown relativ")
par(mai = c(1, 2, 1, 1))
barplot(l/sum(l)*100, horiz = TRUE, beside = TRUE, col = c("blue", "darkblue", "lightblue", "green", "darkgreen", "lightgreen"),
        main = "Stunden x Tage  im Lockdown",
        xlab = "relative Haeufigkeit",
        names.arg = c("gar nicht", "an 1-2 Tagen", "an 3-4 Tagen", "an 5-6 Tagen", "an 7 Tagen"), las =  2)
legend("topright", fill = c( "lightgreen", "darkgreen", "green", "lightblue", "darkblue", "blue"), box.lty = 0,
       legend = c("mehr als 9 Stunden","an 7-9 Stunden", "an 4-6 Stunden", "1-3 Stunden", "bis zu einer Stunde", "0 Stunden"))
#dev.off()



m <- xtabs(~ sport$stunden_mom + sport$tage_mom)
m

#pdf("Stunden x Tage momentan absolut")
par(mai = c(1, 2, 1, 1))
barplot(m, horiz = TRUE, beside = TRUE, col = c("blue", "darkblue", "lightblue", "green", "darkgreen", "lightgreen"),
        main = "Stunden x Tage  momentan",
        xlab = "absolute Haeufigkeit",
        names.arg = c("gar nicht", "an 1-2 Tagen", "an 3-4 Tagen", "an 5-6 Tagen", "an 7 Tagen"), las =  2)
legend("topright", fill = c( "lightgreen", "darkgreen", "green", "lightblue", "darkblue", "blue"), box.lty = 0,
       legend = c("mehr als 9 Stunden","an 7-9 Stunden", "an 4-6 Stunden", "1-3 Stunden", "bis zu einer Stunde", "0 Stunden"))
#dev.off()              # Eine Person an 7 Tagen Sport, aber insgesamt nur bis zu einer Stunde


# relativ:

#pdf("Stunden x Tage  momentan relativ")
par(mai = c(1, 2, 1, 1))
barplot(m/sum(m)*100, horiz = TRUE, beside = TRUE, col = c("blue", "darkblue", "lightblue", "green", "darkgreen", "lightgreen"),
        main = "Stunden x Tage  momentan",
        xlab = "relative Haeufigkeit",
        names.arg = c("gar nicht", "an 1-2 Tagen", "an 3-4 Tagen", "an 5-6 Tagen", "an 7 Tagen"), las =  2)
legend("topright", fill = c( "lightgreen", "darkgreen", "green", "lightblue", "darkblue", "blue"), box.lty = 0,
       legend = c("mehr als 9 Stunden","an 7-9 Stunden", "an 4-6 Stunden", "1-3 Stunden", "bis zu einer Stunde", "0 Stunden"))
#dev.off()



## Manschafts- / Individualsport:

#pdf("Manschafts- / Individualsport vorher Boxplot.pdf")
boxplot(na.omit(sport$m_i_vor),
        main = "Manschafts- / Individualsport vorher",
        col = "lightblue"
)
#dev.off()

mean(na.omit(sport$m_i_vor))
#[1] -0.4736842

#pdf("Manschafts- / Individualsport im Lockdown Boxplot.pdf")
boxplot(na.omit(sport$m_i_lock),
        main = "Manschafts- / Individualsport im Lockdown",
        col = "lightblue"
)
#dev.off()

mean(na.omit(sport$m_i_lock))
#[1] -1.38

#pdf("Manschafts- / Individualsport momentan Boxplot.pdf")
boxplot(na.omit(sport$m_i_mom),
        main = "Manschafts- / Individualsport momentan",
        col = "lightblue"
)
#dev.off()

mean(na.omit(sport$m_i_mom))
#[1] -0.7758621



mi <- matrix(c(table(sport$m_i_vor), table(sport$m_i_lock), table(sport$m_i_mom)), nrow = 3,
               byrow = TRUE)

#pdf("Manschafts- / Individualsport absolut.pdf")
par(mai = c(1, 2, 1, 1))
barplot(mi, beside = TRUE, col = c("blue", "darkblue", "lightblue"),
        main = "Manschafts- / Individualsport",
        xlab = "absolute Haeufigkeit",
        names.arg = c("nur Individualsport", "eher Individualsport", "ausgeglichen", "eher Mannschaftssport", "nur Mannschaftssport"),
        horiz = TRUE, las =1)
legend("top", fill = c("lightblue", "darkblue", "blue"), box.lty = 0,
       legend = c("momentan", "Lockdown","vorher"))
#dev.off()


# relativ:

sum(mi[1,])
sum(mi[2,])
sum(mi[3,])

#pdf("Manschafts- / Individualsport relativ.pdf")
par(mai = c(1, 2, 1, 1))
barplot( matrix(c(mi[1,]/sum(mi[1,]), mi[2,]/sum(mi[2,]), mi[3,]/sum(mi[3,])), nrow = 3, byrow = TRUE)*100, beside = TRUE, col = c("blue", "darkblue", "lightblue"),
        main = "Manschafts- / Individualsport",
        xlab = "relative Haeufigkeit",
        names.arg = c("nur Individualsport", "eher Individualsport", "ausgeglichen", "eher Mannschaftssport", "nur Mannschaftssport"),
        horiz = TRUE, las =1)
legend("top", fill = c("lightblue", "darkblue", "blue"), box.lty = 0,
       legend = c("momentan", "Lockdown","vorher"))
#dev.off()              # Immer eher Individualsport, aber besonders im Lockdown



## Sportart:

## vorher

#pdf("Sportart vorher absolut.pdf")
par(mai = c(1, 2, 1, 2))
barplot(table(sport$art_vor), col = c("lightblue"),
        main = "Sportart vorher",
        xlab = "absolute Haeufigkeit",
        names.arg = c("Ballsport", "Fitness/Kraftsport", "Kampfsport", "kein Sport", "Leichtathletik/Laufsport", "Radsport", "Reitsport", "Rueckschlagsport", "Schiesssport", "Schulsport", "Tanzen", "Turnen/Gymnastik", "Wassersport", "Yoga/Pilates"),
        horiz = TRUE, las =1)
#dev.off()


# relativ:

#pdf("Sportart vorher relativ.pdf")
par(mai = c(1, 2, 1, 2))
barplot(table(sport$art_vor)/sum(table(sport$art_vor))*100, col = c("lightblue"),
        main = "Sportart vorher",
        xlab = "relative Haeufigkeit",
        names.arg = c("Ballsport", "Fitness/Kraftsport", "Kampfsport", "kein Sport", "Leichtathletik/Laufsport", "Radsport", "Reitsport", "Rueckschlagsport", "Schiesssport", "Schulsport", "Tanzen", "Turnen/Gymnastik", "Wassersport", "Yoga/Pilates"),
        horiz = TRUE, las =1)
#dev.off()



## im Lockdown

#pdf("Sportart im Lockdown absolut.pdf")
par(mai = c(1, 2, 1, 2))
barplot(table(sport$art_lock), col = c("lightblue"),
        main = "Sportart im Lockdown",
        xlab = "absolute Haeufigkeit",
        names.arg = c("Ballsport", "Fitness/Kraftsport", "Kampfsport", "kein Sport", "Leichtathletik/Laufsport", "Radsport", "Reitsport", "Schiesssport", "Tanzen", "Yoga/Pilates"),
        horiz = TRUE, las =1)
#dev.off()

# relativ:

#pdf("Sportart im Lockdown relativ.pdf")
par(mai = c(1, 2, 1, 2))
barplot(table(sport$art_lock)/sum(table(sport$art_lock))*100, col = c("lightblue"),
        main = "Sportart im Lockdown",
        xlab = "relative Haeufigkeit",
        names.arg = c("Ballsport", "Fitness/Kraftsport", "Kampfsport", "kein Sport", "Leichtathletik/Laufsport", "Radsport", "Reitsport", "Schiesssport", "Tanzen", "Yoga/Pilates"),
        horiz = TRUE, las =1)
#dev.off()              # Am wenigsten Sportarten insgesamt.



## momentan

#pdf("Sportart momentan absolut.pdf")
par(mai = c(1, 2, 1, 2))
barplot(table(sport$art_mom), col = c("lightblue"),
        main = "Sportart momentan",
        xlab = "absolute Haeufigkeit",
        names.arg = c("Ballsport", "Fitness/Kraftsport", "Kampfsport", "kein Sport", "Klettersport", "Leichtathletik/Laufsport", "Radsport", "Reitsport", "Rueckschlagsport", "Schiesssport", "Tanzen", "Turnen/Gymnastik", "Wassersport", "Yoga/Pilates"),
        horiz = TRUE, las =1)
#dev.off()


# relativ:

#pdf("Sportart momentan relativ.pdf")
par(mai = c(1, 2, 1, 2))
barplot(table(sport$art_mom)/sum(table(sport$art_mom))*100, col = c("lightblue"),
        main = "Sportart momentan",
        xlab = "relative Haeufigkeit",
        names.arg = c("Ballsport", "Fitness/Kraftsport", "Kampfsport", "kein Sport", "Leichtathletik/Laufsport", "Radsport", "Reitsport", "Rueckschlagsport", "Schiesssport", "Schulsport", "Tanzen", "Wassersport", "Yoga/Pilates"),
        horiz = TRUE, las =1)
#dev.off()


table(sport$art_vor) 
table(sport$art_lock)   # Weggefallen:          Rueckschlagsport, Schulsport, Turnen/Gymnastik, Wassersport
table(sport$art_mom)    # wieder hinzugekommen: Rueckschlagsport, Wassersport
                        # neu hinzugekommen:    Klettersport


















