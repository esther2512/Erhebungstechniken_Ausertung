
library(openxlsx)
#einlesen Greta
#setwd("~/UNI/Erhebungstechniken/Bericht")
# Daten Einlesen aus der Excel-Datei:
#sport <- read.xlsx("Datensatz roh.xlsx")

#einlesen Esther
setwd("C:/Users/esthe/Documents/Studium/Statistik/3. Semenster/Erhebnungstechniken/Projekt/Daten")
sport<- read.xlsx("Rohdaten.xlsx")



# Datensatz unbearbeitet als R-Datensatz speichern:
save(sport, file = "Sportdaten_unbearbeitet.RData")

### Datenbereinigung ###

# Konsquente Antworten:#

sport$stunden_lock[sport$tage_lock == 0] <- 0
sport$stunden_vor[sport$tage_vor == 0] <- 0
sport$stunden_mom[sport$tage_mom == 0] <- 0

sport$grund_lock[sport$tage_lock == 0] <- NA
sport$grund_vor[sport$tage_vor == 0] <- NA
sport$grund_mom[sport$tage_mom == 0] <- NA

sport$m_i_lock[sport$tage_lock == 0] <- NA
sport$m_i_vor[sport$tage_vor == 0] <- NA
sport$m_i_mom[sport$tage_mom == 0] <- NA

sport$art_lock[sport$tage_lock == 0] <- 1
sport$art_vor[sport$tage_vor == 0] <- 1
sport$art_mom[sport$tage_mom == 0] <- 1

sport$ort_lock[sport$tage_lock == 0] <- NA
sport$ort_vor[sport$tage_vor == 0] <- NA
sport$ort_mom[sport$tage_mom == 0] <- NA

str(sport)
# umcodieren der Gruende:

sport$grund_vor[sport$grund_vor == 1] <- "Aussehen"
sport$grund_vor[sport$grund_vor == 2] <- "Gesundheit"
sport$grund_vor[sport$grund_vor == 3] <- "Langeweile"
sport$grund_vor[sport$grund_vor == 4] <- "soziale Kontakte"
sport$grund_vor[sport$grund_vor == 5] <- "sportlicher Erfolg"
sport$grund_vor[sport$grund_vor == 6] <- "Spaß"

sport$grund_lock[sport$grund_lock == 1] <- "Aussehen"
sport$grund_lock[sport$grund_lock == 2] <- "Gesundheit"
sport$grund_lock[sport$grund_lock == 3] <- "Langeweile"
sport$grund_lock[sport$grund_lock == 4] <- "soziale Kontakte"
sport$grund_lock[sport$grund_lock == 5] <- "sportlicher Erfolg"
sport$grund_lock[sport$grund_lock == 6] <- "Spaß"

sport$grund_mom[sport$grund_mom == 1] <- "Aussehen"
sport$grund_mom[sport$grund_mom == 2] <- "Gesundheit"
sport$grund_mom[sport$grund_mom == 3] <- "Langeweile"
sport$grund_mom[sport$grund_mom == 4] <- "soziale Kontakte"
sport$grund_mom[sport$grund_mom == 5] <- "sportlicher Erfolg"
sport$grund_mom[sport$grund_mom == 6] <- "Spaß"

# Umcodieren der Sportarten:
sport$art_vor[sport$art_vor == 1] <- "kein Sport"
sport$art_vor[sport$art_vor == 2] <- "Ballsport"
sport$art_vor[sport$art_vor == 3] <- "Fitness/Kraftsport"
sport$art_vor[sport$art_vor == 4] <- "Leichtathletik/Laufsport"
sport$art_vor[sport$art_vor == 5] <- "Klettersport"
sport$art_vor[sport$art_vor == 6] <- "Kampfsport"
sport$art_vor[sport$art_vor == 7] <- "Radsport"
sport$art_vor[sport$art_vor == 8] <- "Reitsport"
sport$art_vor[sport$art_vor == 9] <- "Rückschlagsport"
sport$art_vor[sport$art_vor == 10] <- "Schießsport"
sport$art_vor[sport$art_vor == 11] <- "Tanzen"
sport$art_vor[sport$art_vor == 12] <- "Turnen/Gymnastik"
sport$art_vor[sport$art_vor == 13] <- "Wassersport"
sport$art_vor[sport$art_vor == 14] <- "Yoga/Pilates"

sport$art_lock[sport$art_lock == 1] <- "kein Sport"
sport$art_lock[sport$art_lock == 2] <- "Ballsport"
sport$art_lock[sport$art_lock == 3] <- "Fitness/Kraftsport"
sport$art_lock[sport$art_lock == 4] <- "Leichtathletik/Laufsport"
sport$art_lock[sport$art_lock == 5] <- "Klettersport"
sport$art_lock[sport$art_lock == 6] <- "Kampfsport"
sport$art_lock[sport$art_lock == 7] <- "Radsport"
sport$art_lock[sport$art_lock == 8] <- "Reitsport"
sport$art_lock[sport$art_lock == 9] <- "Rückschlagsport"
sport$art_lock[sport$art_lock == 10] <- "Schießsport"
sport$art_lock[sport$art_lock == 11] <- "Tanzen"
sport$art_lock[sport$art_lock == 12] <- "Turnen/Gymnastik"
sport$art_lock[sport$art_lock == 13] <- "Wassersport"
sport$art_lock[sport$art_lock == 14] <- "Yoga/Pilates"

sport$art_mom[sport$art_mom == 1] <- "kein Sport"
sport$art_mom[sport$art_mom == 2] <- "Ballsport"
sport$art_mom[sport$art_mom == 3] <- "Fitness/Kraftsport"
sport$art_mom[sport$art_mom == 4] <- "Leichtathletik/Laufsport"
sport$art_mom[sport$art_mom == 5] <- "Klettersport"
sport$art_mom[sport$art_mom == 6] <- "Kampfsport"
sport$art_mom[sport$art_mom == 7] <- "Radsport"
sport$art_mom[sport$art_mom == 8] <- "Reitsport"
sport$art_mom[sport$art_mom == 9] <- "Rückschlagsport"
sport$art_mom[sport$art_mom == 10] <- "Schießsport"
sport$art_mom[sport$art_mom == 11] <- "Tanzen"
sport$art_mom[sport$art_mom == 12] <- "Turnen/Gymnastik"
sport$art_mom[sport$art_mom == 13] <- "Wassersport"
sport$art_mom[sport$art_mom == 14] <- "Yoga/Pilates"

# Orte umcodieren:
sport$ort_vor[sport$ort_vor == 1] <- "im Freien"
sport$ort_vor[sport$ort_vor == 2] <- "Fitnessstudio"
sport$ort_vor[sport$ort_vor == 3] <- "Schwimmbad"
sport$ort_vor[sport$ort_vor == 4] <- "Sporthalle"
sport$ort_vor[sport$ort_vor == 5] <- "Zuhause"

sport$ort_lock[sport$ort_lock == 1] <- "im Freien"
sport$ort_lock[sport$ort_lock == 2] <- "Fitnessstudio"
sport$ort_lock[sport$ort_lock == 3] <- "Schwimmbad"
sport$ort_lock[sport$ort_lock == 4] <- "Sporthalle"
sport$ort_lock[sport$ort_lock == 5] <- "Zuhause"

sport$ort_mom[sport$ort_mom == 1] <- "im Freien"
sport$ort_mom[sport$ort_mom == 2] <- "Fitnessstudio"
sport$ort_mom[sport$ort_mom == 3] <- "Schwimmbad"
sport$ort_mom[sport$ort_mom == 4] <- "Sporthalle"
sport$ort_mom[sport$ort_mom == 5] <- "Zuhause"

# " "-Problem lösen:
sport$geschlecht[sport$geschlecht == "\"m\""] <- "m" 
sport$geschlecht[sport$geschlecht == "\"w\""] <- "w"
sport$abschluss[sport$abschluss == "\"b\""] <- "b"
sport$abschluss[sport$abschluss == "\"m\""] <- "m"
sport$art_vor[sport$art_vor == "\"Schulsport\""] <- "Schulsport"
sport$grund_vor[sport$grund_vor == "\"Schulsport\""] <- "Schulsport"

# Fakultät unerheblich für Datenauswertung

# Umwandeln in Faktoren:
sport$grund_lock <- factor(sport$grund_lock)
sport$grund_vor <- factor(sport$grund_vor)
sport$grund_mom <- factor(sport$grund_mom)

sport$art_lock <- factor(sport$art_lock)
sport$art_vor <- factor(sport$art_vor)
sport$art_mom <- factor(sport$art_mom)

sport$ort_lock <- factor(sport$ort_lock)
sport$ort_vor <- factor(sport$ort_vor)
sport$ort_mom <- factor(sport$ort_mom)

sport$geschlecht <- factor(sport$geschlecht)
sport$abschluss <- factor(sport$abschluss)

# bereinigten Datensatz abspeichern:

save(sport, file = "Sportdaten_bereinigt.RData")

### Datenauswertung ###

# Alter
barplot(table(sport$alter), main = "Alter der Befragten", xlab = "Alter [Jahre]", ylab = "Häufigkeit")

# Vergleich der Gruende
sport$grund_vor[sport$grund_vor == "Schulsport"] <- NA
grund <- matrix(c(table(sport$grund_vor), table(sport$grund_lock), table(sport$grund_mom)), nrow = 3,
                byrow = TRUE)

pdf("Vergleich_Gruende.pdf")
par(mai = c(1, 2, 1, 1))
barplot(grund, beside = TRUE, col = c("blue", "darkblue", "lightblue"),
        main = "Vergleich der Gruende in den verschiedenen Zeitraeumen",
        xlab = "absolute Haeufigkeit",
        names.arg = c("Aussehen", "Gesundheit", "Langeweile", "soziale Kontakte", "Spaß", "sportlicher Erfolg"),
        horiz = TRUE, las =1)
legend("right", fill = c("blue", "darkblue", "lightblue"), box.lty = 0,
       legend = c("vorher", "Lockdown","momentan"))
dev.off()


# Kreuztabellen zeitlicher Aufwand:
table("vorher" = sport$stunden_vor, "Lockdown" = sport$stunden_lock, 
      "jetzt" = sport$stunden_mom)

# Vergleich Mannschafts-Individual-Sport:
barplot(table(sport$a_1))
barplot(table(sport$a_1[sport$m_i_vor %in% c(1, 2)]))
barplot(table(sport$a_2[sport$m_i_vor %in% c(0,1)])) # Auswirkungen auf mom. Sportverhalten
barplot(table(sport$a_3))
barplot(table(sport$a_1))
barplot(table(sport$a_1))


#Vergleich Aussagen am Ende
pdf("Vergleich_Aussagen.pdf")
par(mai = c(1,6,1,1))
statements <- matrix(c(table(sport$a_1), table(sport$a_2), table(sport$a_3), table(sport$a_4), table(sport$a_5)), nrow = 5,
                byrow = TRUE)
barplot(statements, beside = TRUE, col = c("blue", "darkblue", "lightblue", "red", "green"),
        main = "Vergleich der Aussagen",
        xlab = "absolute Haeufigkeit",
        names.arg = c(paste("W�hrend des Lockdowns hat sich", "/n" , "mein Sportverhalten ver�ndert"), "Die Pandemie hatte auch Auswirkungen auf mein momentanes Sportverhalten", "Vor dem 1. Lockdown war ich im Allgemeinen motiviert, Sport zu treiben", "W�hrend des 1. Lockdowns war ich im Allgemeinen motiviert, Sport zu treiben", "Momentan bin ich motiviert, Sport zu treiben"),
        horiz = TRUE, las =1)
legend("left", fill = c("blue", "darkblue", "lightblue", "red", "green"), box.lty = 0,
       legend = c("stimme gar nicht zu", "Stimme eher nicht zu", "neutral", "Stimme eher zu", "Stimme voll zu"))
#problem ist das die Achsenbeschriftung nich tkomplett drauf ist, da weil wenn ganz drauf dann sind die Grafiken nicht sichtbar
#Idee achsenbeschriftung in 2 Zeilen
dev.off()