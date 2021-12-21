### Datenauswertung ###
# Datensatz laden:
load("Datensatz_bereinigt.RData")

# Alter
barplot(table(sport$alter), main = "Alter der Befragten", xlab = "Alter [Jahre]", ylab = "Haeufigkeit")

# Vergleich der Gruende
#sport$grund_vor[sport$grund_vor == "Schulsport"] <- NA
grund <- matrix(c(table(sport$grund_vor), table(sport$grund_lock), table(sport$grund_mom)), nrow = 3,
                byrow = TRUE)

pdf("Vergleich_Gruende.pdf")
par(mai = c(1, 2, 1, 1))
barplot(grund, beside = TRUE, col = c("blue", "darkblue", "lightblue"),
        main = "Vergleich der Gruende in den verschiedenen Zeitraeumen",
        xlab = "absolute Haeufigkeit",
        names.arg = c("Aussehen", "Gesundheit", "Langeweile", "soziale Kontakte", "Spass", "sportlicher Erfolg"),
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
par(mai = c(1,3.5,1,1))
statements <- matrix(c(table(sport$a_1), table(sport$a_2), table(sport$a_3), table(sport$a_4), table(sport$a_5)), nrow = 5,
                     byrow = TRUE)
barplot(statements, beside = TRUE, col = c("blue", "darkblue", "lightblue", "red", "green"),
        main = "Vergleich der Aussagen",
        xlab = "absolute Haeufigkeit",
        names.arg = c("Waehrend des Lockdowns hat sich \n mein Sportverhalten verändert", "Die Pandemie hatte auch Auswirkungen \n auf mein momentanes Sportverhalten", "Vor dem 1. Lockdown war ich \n im Allgemeinen motiviert, Sport zu treiben", "Waehrend des 1. Lockdowns war ich \n im Allgemeinen motiviert, Sport zu treiben", "Momentan bin ich motiviert, \n Sport zu treiben"),
        horiz = TRUE, las =1)
legend("bottomright", fill = c("blue", "darkblue", "lightblue", "red", "green"), box.lty = 0,
       legend = c("stimme gar nicht zu", "Stimme eher nicht zu", "neutral", "Stimme eher zu", "Stimme voll zu"))
dev.off()