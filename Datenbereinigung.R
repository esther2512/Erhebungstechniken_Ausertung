library(openxlsx)
#einlesen Greta
#setwd("~/UNI/Erhebungstechniken/Bericht")
# Daten Einlesen aus der Excel-Datei:
#sport <- read.xlsx("Datensatz roh.xlsx")

#einlesen Esther
#setwd("C:/Users/esthe/Documents/Studium/Statistik/3. Semenster/Erhebnungstechniken/Projekt/Daten")
#sport<- read.xlsx("Rohdaten.xlsx")


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

# umcodieren der Gruende:
sport$grund_vor[sport$grund_vor == "Schulsport"] <- NA
sport$grund_vor[sport$grund_vor == 1] <- "Aussehen"
sport$grund_vor[sport$grund_vor == 2] <- "Gesundheit"
sport$grund_vor[sport$grund_vor == 3] <- "Langeweile"
sport$grund_vor[sport$grund_vor == 4] <- "soziale Kontakte"
sport$grund_vor[sport$grund_vor == 5] <- "sportlicher Erfolg"
sport$grund_vor[sport$grund_vor == 6] <- "Spass"

sport$grund_lock[sport$grund_lock == 1] <- "Aussehen"
sport$grund_lock[sport$grund_lock == 2] <- "Gesundheit"
sport$grund_lock[sport$grund_lock == 3] <- "Langeweile"
sport$grund_lock[sport$grund_lock == 4] <- "soziale Kontakte"
sport$grund_lock[sport$grund_lock == 5] <- "sportlicher Erfolg"
sport$grund_lock[sport$grund_lock == 6] <- "Spass"

sport$grund_mom[sport$grund_mom == 1] <- "Aussehen"
sport$grund_mom[sport$grund_mom == 2] <- "Gesundheit"
sport$grund_mom[sport$grund_mom == 3] <- "Langeweile"
sport$grund_mom[sport$grund_mom == 4] <- "soziale Kontakte"
sport$grund_mom[sport$grund_mom == 5] <- "sportlicher Erfolg"
sport$grund_mom[sport$grund_mom == 6] <- "Spass"

# Umcodieren der Sportarten:
sport$art_vor[sport$art_vor == 1] <- "kein Sport"
sport$art_vor[sport$art_vor == 2] <- "Ballsport"
sport$art_vor[sport$art_vor == 3] <- "Fitness/Kraftsport"
sport$art_vor[sport$art_vor == 4] <- "Leichtathletik/Laufsport"
sport$art_vor[sport$art_vor == 5] <- "Klettersport"
sport$art_vor[sport$art_vor == 6] <- "Kampfsport"
sport$art_vor[sport$art_vor == 7] <- "Radsport"
sport$art_vor[sport$art_vor == 8] <- "Reitsport"
sport$art_vor[sport$art_vor == 9] <- "Rueckschlagsport"
sport$art_vor[sport$art_vor == 10] <- "Schiesssport"
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
sport$art_lock[sport$art_lock == 9] <- "Rueckschlagsport"
sport$art_lock[sport$art_lock == 10] <- "Schiesssport"
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
sport$art_mom[sport$art_mom == 9] <- "Rueckschlagsport"
sport$art_mom[sport$art_mom == 10] <- "Schiesssport"
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

# " "-Problem loesen:
sport$geschlecht[sport$geschlecht == "\"m\""] <- "m" 
sport$geschlecht[sport$geschlecht == "\"w\""] <- "w"
sport$abschluss[sport$abschluss == "\"b\""] <- "b"
sport$abschluss[sport$abschluss == "\"m\""] <- "m"
sport$art_vor[sport$art_vor == "\"Schulsport\""] <- "Schulsport"
sport$grund_vor[sport$grund_vor == "\"Schulsport\""] <- "Schulsport"

# Fakultaet unerheblich fuer Datenauswertung

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

