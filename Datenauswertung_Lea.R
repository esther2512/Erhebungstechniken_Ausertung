# Datenauswertung Lea:

# Korrigierte Version der Aussagen:

pdf("Vergleich_Aussagen.pdf")
par(mai = c(1,3.5,1,1))
statements <- matrix(c(table(sport$a_1), table(sport$a_2), table(sport$a_3), table(sport$a_4), table(sport$a_5)), nrow = 5,
                     byrow = FALSE)
barplot(statements, beside = TRUE, col = c("blue", "darkblue", "lightblue", "red", "green"),
        main = "Vergleich der Aussagen",
        xlab = "absolute Haeufigkeit",
        names.arg = c("Waehrend des Lockdowns hat sich \n mein Sportverhalten ver�ndert", "Die Pandemie hatte auch Auswirkungen \n auf mein momentanes Sportverhalten", "Vor dem 1. Lockdown war ich \n im Allgemeinen motiviert, Sport zu treiben", "Waehrend des 1. Lockdowns war ich \n im Allgemeinen motiviert, Sport zu treiben", "Momentan bin ich motiviert, \n Sport zu treiben"),
        horiz = TRUE, las =1)
legend(27, 30, fill = c("blue", "darkblue", "lightblue", "red", "green"), box.lty = 0,
       legend = c("stimme gar nicht zu", "Stimme eher nicht zu", "neutral", "Stimme eher zu", "Stimme voll zu"))
dev.off()





### 4. große Unterschiede beim 3. Semester

semester.3 <- subset(sport, sem == 3) # drittsemester
nicht.s.3 <- subset(sport, sem != 3) # nicht Drittsemester

# mean(sport$tage_vor)
# [1] 2.533784
# mean(sport$tage_lock)
# [1] 2.094595
# mean(sport$tage_mom)
# [1] 2.222973


mean(semester.3$tage_vor)
# [1] 3.016667
mean(semester.3$tage_lock)
# [1] 2.466667
mean(semester.3$tage_mom)
# [1] 2.133333


mean(nicht.s.3$tage_vor)
# [1] 2.131579
mean(nicht.s.3$tage_lock)
# [1] 1.776316
mean(nicht.s.3$tage_mom)
# [1] 2

# Drittsemester haben im Gegensatz zu nicht Drittsemestlern, im Durchschnitt 
# mehr Sport gemacht. Was aufällt ihr Sportverhlaten nach Lockdown noch geringer, 
# als im Lockdown. Bei den anderen wieder gestiegen.

mean(semester.3$stunden_vor)
# [1] 4.2
mean(semester.3$stunden_lock)
# [1] 2.933333
mean(semester.3$stunden_mom)
# [1] 3.5

mean(nicht.s.3$stunden_vor)
# [1] 3.026316
mean(nicht.s.3$stunden_lock)
# [1] 1.842105
mean(nicht.s.3$stunden_mom)
# [1] 2.578947

# bestätigt sich bei Stunden

var(semester.3$tage_vor)
# [1] 2.956609
var(semester.3$tage_lock)
# [1] 4.343678
var(semester.3$tage_mom)
# [1] 2.809195

var(nicht.s.3$tage_vor)
# [1] 3.02276
var(nicht.s.3$tage_lock)
# [1] 4.090505
var(nicht.s.3$tage_mom)
# [1] 3.054054

# im Lockdowm schwankte das Sportverhalten mehr




# andere Fragen

sum(sport$tage_vor > sport$tage_lock)
# [1] 36
sum(sport$tage_vor == sport$tage_lock)
# [1] 16
sum(sport$tage_vor < sport$tage_lock)
# [1] 22

sum(sport$stunden_vor > sport$stunden_lock)
# [1] 36
sum(sport$stunden_vor == sport$stunden_lock)
# [1] 21
sumsum(sport$tage_vor < sport$tage_lock)
# [1] 17


