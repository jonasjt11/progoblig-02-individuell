use context essentials2021
include gdrive-sheets
include shared-gdrive(
  "dcic-2021",
  "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")

include data-source
ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"


kWh-wealthy-consumer-data =
  load-table: komponent, energi
    source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
    sanitize energi using string-sanitizer
end

kWh-wealthy-consumer-data

# Oppgave a:

# lest og studert.

# Oppgave b:

fun energi-to-number(str :: String) -> Number:
  doc: ```changes string value to number value```
  cases(Option) string-to-number(str):
    | some(a) => a
    | none => 0
  end
where:
  energi-to-number("") is 0
  energi-to-number("48") is 48
end

# Oppgave c:

fixed-energi = 
  transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number)

# Oppgave d:

fun sum-energi-fixed(table :: Table) -> Number:
 doc: ```summarizes the fixed "energi"-column```
 energi-fixed = transform-column(table, "energi", energi-to-number)
 sum(energi-fixed, "energi")
end

sum-energi-fixed(kWh-wealthy-consumer-data)

# Oppgave e:

bar-chart(fixed-energi, "komponent", "energi")

# Jeg er usikker på hva jeg kunne endret i "energi-to-number"-funksjonen,
# for det ser ut som om "bar-chart"-funksjonen viser meg korrekt visualisering.
#
# Usikker på hva det siktes til, dersom det ikke skal stå 0 i energi for "bil".