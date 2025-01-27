### Gretas Teil ###

load("Sportdaten_bereinigt.RData")

## Wurde im Lockdown mehr Sport von zuhause bzw. draussen gemacht?

# Vergleich der Orte:
orte <- matrix(rev(c(table(sport$ort_vor), table(sport$ort_lock)[1:2], 0, 
                 table(sport$ort_lock)[3:4], table(sport$ort_mom))), nrow = 3, byrow = TRUE)
# fuer alle 3 Zeitraeume:
pdf("Vergleich_Orte_3Zeiten.pdf")
par(mai = c(1, 1.5, 1, 1))
barplot(orte, beside = TRUE, col = rev(c("blue", "darkblue", "lightblue")),
        main = "Vergleich der Orte in den verschiedenen Zeiträumen",
        xlab = "absolute Häufigkeit", xlim = c(0, 30),
        names.arg = rev(levels(sport$ort_vor)),
        horiz = TRUE, las =1)
legend("topright", fill = c("blue", "darkblue", "lightblue"), box.lty = 0,
       legend = c("vor Pandemie", "im Lockdown","momentan"))
dev.off()

# nur fuer vor und waehrend Lockdown:
pdf("Vergleich_Orte_ohnemom.pdf")
par(mai = c(1, 1.5, 1, 1))
barplot(orte[2:3,], beside = TRUE, col = rev(c("blue", "darkblue")),
        main = "Orte vor der Pandemie und im Lockdown",
        xlab = "absolute Häufigkeit", xlim = c(0,30),
        names.arg = rev(levels(sport$ort_mom)),
        horiz = TRUE, las =1)
legend("topright", fill = c("blue", "darkblue"), box.lty = 0,
       legend = c("vor Pandemie", "im Lockdown"))
dev.off()

# Ergebnisse:
# im Lockdown wurde hauptsaechlich Zuhause und im Freien Sport getrieben, dafuer 
# (fast) gar nicht in einer Halle oder im Fitnessstudio. Diese beiden Orte waren
# vor der Pandemie die beliebtesten Orte, um Sport zu treiben.

## Wurde im Lockdown mehr Fitness/Laufsport gemacht?

# Vergleich der Sportarten:
sum(sport$art_vor == "Leichtathletik/Laufsport", na.rm = TRUE) # 1
sum(sport$art_lock == "Leichtathletik/Laufsport", na.rm = TRUE) # 9
sum(sport$art_mom == "Leichtathletik/Laufsport", na.rm = TRUE) # 3

# Im Lockdown haben mehr Leute Leichtathletik/Laufsport gemacht als vorher und nachher.

sum(sport$art_vor == "Fitness/Kraftsport", na.rm = TRUE) # 18
sum(sport$art_lock == "Fitness/Kraftsport", na.rm = TRUE) # 21
sum(sport$art_mom == "Fitness/Kraftsport", na.rm = TRUE) # 23

# Bei Fitness ist kein direkter Zusammenhang zu erkennen (aber Fitness kann man ja auch im Gym machen)

sum((sport$art_vor == "Fitness/Kraftsport") & (sport$ort_vor == "Zuhause"), na.rm = TRUE) # 4
sum((sport$art_lock == "Fitness/Kraftsport") & (sport$ort_lock == "Zuhause"), na.rm = TRUE) # 19
sum((sport$art_mom == "Fitness/Kraftsport") & (sport$ort_mom == "Zuhause"), na.rm = TRUE) # 6

# Jetzt ist ein deutlicher Zusammenhang zu erkennen, also haben im Lockdown auf 
# jeden Fall deutlich mehr Leute von Zuhause aus Fitness gemacht als vorher und nachher.


       