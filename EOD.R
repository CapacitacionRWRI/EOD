---
title: "EOD17"
author: "Gonzalo"
date: "7/7/2021"
output: html_document
---

# Script análisis bases de datos EOD-2017

## Crear y establacer directorios de trabajo

```{r}
setwd("~/")

if (!dir.exists("analisis_eod")) {
  dir.create("analisis_eod")
}
setwd("~/analisis_eod")

```

### URL que contiene la descarga del archivo comprimido con las bases de datos:

```{r}
setwd("~/")

url_eod <- "https://www.inegi.org.mx/contenidos/programas/eod/2017/datosabiertos/eod_2017_csv.zip"
```

### Variable con el nombre del archivo que interesa

```{r}
setwd("~/")

eod_file <- "eod_2017_csv.zip"
```

### Verificación y descarga de bases de datos 

```{r}
setwd("~/")

if (!file.exists(eod_file)) {
  download.file(url_eod, eod_file, mode = "wb")
}

if (!dir.exists("eod_2017_csv")) {
  unzip(eod_file)
}
```

### Cargar CSVs de bases de datos en sesion de R.

##### Intenté con read_csv pero tuve problemas al sacar las medianas así me salia error siempre.

```{r}
setwd("~/")

library(readr)
Hogar <- read.csv("thogar_eod2017/conjunto_de_datos/thogar.csv")
Vivienda <- read.csv("tvivienda_eod2017/conjunto_de_datos/tvivienda.csv")
PerfilSociodemografico <- read.csv("tsdem_eod2017/conjunto_de_datos/tsdem.csv")
Viajes <- read.csv("tviaje_eod2017/conjunto_de_datos/tviaje.csv")
Transporte <- read.csv("ttransporte_eod2017/conjunto_de_datos/ttransporte.csv")

```


### Explorar bases de datos Hogar
```{r}
head(Hogar)
tail(Hogar)
str(Hogar)
summary(Hogar)
Hogar[!complete.cases(Hogar),]
```

### Supliendo los NAs por las medianas por municipio:

```{r}

median(Hogar[,"p2_2"], na.rm = T)
is.numeric(Hogar$p2_2)

med_Hogar_p2_2_m10 <- median(Hogar[Hogar$mun == "10", "p2_2"], na.rm = T)
med_Hogar_p2_2_m10
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "10"), "p2_2"] <- med_Hogar_p2_2_m10

Hogar$mun <- as.factor(Hogar$mun)
levels(Hogar$mun)

med_Hogar_p2_2_m2 <- median(Hogar[Hogar$mun == "2", "p2_2"], na.rm = T)
med_Hogar_p2_2_m2
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "2"), "p2_2"] <- med_Hogar_p2_2_m2


med_Hogar_p2_2_m3 <- median(Hogar[Hogar$mun == "3", "p2_2"], na.rm = T)
med_Hogar_p2_2_m3
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "3"), "p2_2"] <- med_Hogar_p2_2_m3


med_Hogar_p2_2_m4 <- median(Hogar[Hogar$mun == "4", "p2_2"], na.rm = T)
med_Hogar_p2_2_m4
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "4"), "p2_2"] <- med_Hogar_p2_2_m4

med_Hogar_p2_2_m5 <- median(Hogar[Hogar$mun == "5", "p2_2"], na.rm = T)
med_Hogar_p2_2_m5
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "5"), "p2_2"] <- med_Hogar_p2_2_m5


med_Hogar_p2_2_m6 <- median(Hogar[Hogar$mun == "6", "p2_2"], na.rm = T)
med_Hogar_p2_2_m6
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "6"), "p2_2"] <- med_Hogar_p2_2_m6


med_Hogar_p2_2_m7 <- median(Hogar[Hogar$mun == "7", "p2_2"], na.rm = T)
med_Hogar_p2_2_m7
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "7"), "p2_2"] <- med_Hogar_p2_2_m7


med_Hogar_p2_2_m8 <- median(Hogar[Hogar$mun == "8", "p2_2"], na.rm = T)
med_Hogar_p2_2_m8
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "8"), "p2_2"] <- med_Hogar_p2_2_m8


med_Hogar_p2_2_m9 <- median(Hogar[Hogar$mun == "9", "p2_2"], na.rm = T)
med_Hogar_p2_2_m9
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "9"), "p2_2"] <- med_Hogar_p2_2_m9


med_Hogar_p2_2_m11 <- median(Hogar[Hogar$mun == "11", "p2_2"], na.rm = T)
med_Hogar_p2_2_m11
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "11"), "p2_2"] <- med_Hogar_p2_2_m11


med_Hogar_p2_2_m12 <- median(Hogar[Hogar$mun == "12", "p2_2"], na.rm = T)
med_Hogar_p2_2_m12
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "12"), "p2_2"] <- med_Hogar_p2_2_m12

med_Hogar_p2_2_m13 <- median(Hogar[Hogar$mun == "13", "p2_2"], na.rm = T)
med_Hogar_p2_2_m13
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "13"), "p2_2"] <- med_Hogar_p2_2_m13

med_Hogar_p2_2_m14 <- median(Hogar[Hogar$mun == "14", "p2_2"], na.rm = T)
med_Hogar_p2_2_m14
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "14"), "p2_2"] <- med_Hogar_p2_2_m14

med_Hogar_p2_2_m15 <- median(Hogar[Hogar$mun == "15", "p2_2"], na.rm = T)
med_Hogar_p2_2_m15
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "15"), "p2_2"] <- med_Hogar_p2_2_m15


med_Hogar_p2_2_m16 <- median(Hogar[Hogar$mun == "16", "p2_2"], na.rm = T)
med_Hogar_p2_2_m16
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "16"), "p2_2"] <- med_Hogar_p2_2_m16


med_Hogar_p2_2_m17 <- median(Hogar[Hogar$mun == "17", "p2_2"], na.rm = T)
med_Hogar_p2_2_m17
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "17"), "p2_2"] <- med_Hogar_p2_2_m17


med_Hogar_p2_2_m20 <- median(Hogar[Hogar$mun == "20", "p2_2"], na.rm = T)
med_Hogar_p2_2_m20
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "20"), "p2_2"] <- med_Hogar_p2_2_m20

med_Hogar_p2_2_m22 <- median(Hogar[Hogar$mun == "22", "p2_2"], na.rm = T)
med_Hogar_p2_2_m22
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "22"), "p2_2"] <- med_Hogar_p2_2_m22

med_Hogar_p2_2_m23 <- median(Hogar[Hogar$mun == "23", "p2_2"], na.rm = T)
med_Hogar_p2_2_m23
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "23"), "p2_2"] <- med_Hogar_p2_2_m23

med_Hogar_p2_2_m24 <- median(Hogar[Hogar$mun == "24", "p2_2"], na.rm = T)
med_Hogar_p2_2_m24
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "24"), "p2_2"] <- med_Hogar_p2_2_m24

med_Hogar_p2_2_m25 <- median(Hogar[Hogar$mun == "25", "p2_2"], na.rm = T)
med_Hogar_p2_2_m25
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "25"), "p2_2"] <- med_Hogar_p2_2_m25

med_Hogar_p2_2_m28 <- median(Hogar[Hogar$mun == "28", "p2_2"], na.rm = T)
med_Hogar_p2_2_m28
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "28"), "p2_2"] <- med_Hogar_p2_2_m28

med_Hogar_p2_2_m29 <- median(Hogar[Hogar$mun == "29", "p2_2"], na.rm = T)
med_Hogar_p2_2_m29
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "29"), "p2_2"] <- med_Hogar_p2_2_m29

med_Hogar_p2_2_m30 <- median(Hogar[Hogar$mun == "30", "p2_2"], na.rm = T)
med_Hogar_p2_2_m30
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "30"), "p2_2"] <- med_Hogar_p2_2_m30

med_Hogar_p2_2_m31 <- median(Hogar[Hogar$mun == "31", "p2_2"], na.rm = T)
med_Hogar_p2_2_m31
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "31"), "p2_2"] <- med_Hogar_p2_2_m31

med_Hogar_p2_2_m33 <- median(Hogar[Hogar$mun == "33", "p2_2"], na.rm = T)
med_Hogar_p2_2_m33
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "33"), "p2_2"] <- med_Hogar_p2_2_m33

med_Hogar_p2_2_m34 <- median(Hogar[Hogar$mun == "34", "p2_2"], na.rm = T)
med_Hogar_p2_2_m34
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "34"), "p2_2"] <- med_Hogar_p2_2_m34

med_Hogar_p2_2_m35 <- median(Hogar[Hogar$mun == "35", "p2_2"], na.rm = T)
med_Hogar_p2_2_m35
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "35"), "p2_2"] <- med_Hogar_p2_2_m35

med_Hogar_p2_2_m36 <- median(Hogar[Hogar$mun == "36", "p2_2"], na.rm = T)
med_Hogar_p2_2_m36
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "36"), "p2_2"] <- med_Hogar_p2_2_m36

med_Hogar_p2_2_m37 <- median(Hogar[Hogar$mun == "37", "p2_2"], na.rm = T)
med_Hogar_p2_2_m37
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "37"), "p2_2"] <- med_Hogar_p2_2_m37

med_Hogar_p2_2_m38 <- median(Hogar[Hogar$mun == "38", "p2_2"], na.rm = T)
med_Hogar_p2_2_m38
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "38"), "p2_2"] <- med_Hogar_p2_2_m38

med_Hogar_p2_2_m39 <- median(Hogar[Hogar$mun == "39", "p2_2"], na.rm = T)
med_Hogar_p2_2_m39
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "39"), "p2_2"] <- med_Hogar_p2_2_m39

med_Hogar_p2_2_m44 <- median(Hogar[Hogar$mun == "44", "p2_2"], na.rm = T)
med_Hogar_p2_2_m44
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "44"), "p2_2"] <- med_Hogar_p2_2_m44

med_Hogar_p2_2_m46 <- median(Hogar[Hogar$mun == "46", "p2_2"], na.rm = T)
med_Hogar_p2_2_m46
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "46"), "p2_2"] <- med_Hogar_p2_2_m46

med_Hogar_p2_2_m50 <- median(Hogar[Hogar$mun == "50", "p2_2"], na.rm = T)
med_Hogar_p2_2_m50
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "50"), "p2_2"] <- med_Hogar_p2_2_m50

med_Hogar_p2_2_m53 <- median(Hogar[Hogar$mun == "53", "p2_2"], na.rm = T)
med_Hogar_p2_2_m53
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "53"), "p2_2"] <- med_Hogar_p2_2_m53

med_Hogar_p2_2_m57 <- median(Hogar[Hogar$mun == "57", "p2_2"], na.rm = T)
med_Hogar_p2_2_m57
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "57"), "p2_2"] <- med_Hogar_p2_2_m57

med_Hogar_p2_2_m58 <- median(Hogar[Hogar$mun == "58", "p2_2"], na.rm = T)
med_Hogar_p2_2_m58
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "58"), "p2_2"] <- med_Hogar_p2_2_m58

med_Hogar_p2_2_m59 <- median(Hogar[Hogar$mun == "59", "p2_2"], na.rm = T)
med_Hogar_p2_2_m59
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "59"), "p2_2"] <- med_Hogar_p2_2_m59

med_Hogar_p2_2_m60 <- median(Hogar[Hogar$mun == "60", "p2_2"], na.rm = T)
med_Hogar_p2_2_m60
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "60"), "p2_2"] <- med_Hogar_p2_2_m60

med_Hogar_p2_2_m61 <- median(Hogar[Hogar$mun == "61", "p2_2"], na.rm = T)
med_Hogar_p2_2_m61
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "61"), "p2_2"] <- med_Hogar_p2_2_m61

med_Hogar_p2_2_m65 <- median(Hogar[Hogar$mun == "65", "p2_2"], na.rm = T)
med_Hogar_p2_2_m65
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "65"), "p2_2"] <- med_Hogar_p2_2_m65

med_Hogar_p2_2_m68 <- median(Hogar[Hogar$mun == "68", "p2_2"], na.rm = T)
med_Hogar_p2_2_m68
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "68"), "p2_2"] <- med_Hogar_p2_2_m68

med_Hogar_p2_2_m69 <- median(Hogar[Hogar$mun == "69", "p2_2"], na.rm = T)
med_Hogar_p2_2_m69
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "69"), "p2_2"] <- med_Hogar_p2_2_m69

med_Hogar_p2_2_m70 <- median(Hogar[Hogar$mun == "70", "p2_2"], na.rm = T)
med_Hogar_p2_2_m70
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "70"), "p2_2"] <- med_Hogar_p2_2_m70

med_Hogar_p2_2_m75 <- median(Hogar[Hogar$mun == "75", "p2_2"], na.rm = T)
med_Hogar_p2_2_m75
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "75"), "p2_2"] <- med_Hogar_p2_2_m75

med_Hogar_p2_2_m81 <- median(Hogar[Hogar$mun == "81", "p2_2"], na.rm = T)
med_Hogar_p2_2_m81
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "81"), "p2_2"] <- med_Hogar_p2_2_m81

med_Hogar_p2_2_m83 <- median(Hogar[Hogar$mun == "83", "p2_2"], na.rm = T)
med_Hogar_p2_2_m83
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "83"), "p2_2"] <- med_Hogar_p2_2_m83

med_Hogar_p2_2_m84 <- median(Hogar[Hogar$mun == "84", "p2_2"], na.rm = T)
med_Hogar_p2_2_m84
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "84"), "p2_2"] <- med_Hogar_p2_2_m84

med_Hogar_p2_2_m89 <- median(Hogar[Hogar$mun == "89", "p2_2"], na.rm = T)
med_Hogar_p2_2_m89
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "89"), "p2_2"] <- med_Hogar_p2_2_m89

med_Hogar_p2_2_m91 <- median(Hogar[Hogar$mun == "91", "p2_2"], na.rm = T)
med_Hogar_p2_2_m91
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "91"), "p2_2"] <- med_Hogar_p2_2_m91

med_Hogar_p2_2_m92 <- median(Hogar[Hogar$mun == "92", "p2_2"], na.rm = T)
med_Hogar_p2_2_m92
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "92"), "p2_2"] <- med_Hogar_p2_2_m92

med_Hogar_p2_2_m93 <- median(Hogar[Hogar$mun == "93", "p2_2"], na.rm = T)
med_Hogar_p2_2_m93
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "93"), "p2_2"] <- med_Hogar_p2_2_m93

med_Hogar_p2_2_m94 <- median(Hogar[Hogar$mun == "94", "p2_2"], na.rm = T)
med_Hogar_p2_2_m94
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "94"), "p2_2"] <- med_Hogar_p2_2_m94

med_Hogar_p2_2_m95 <- median(Hogar[Hogar$mun == "95", "p2_2"], na.rm = T)
med_Hogar_p2_2_m95
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "95"), "p2_2"] <- med_Hogar_p2_2_m95

med_Hogar_p2_2_m96 <- median(Hogar[Hogar$mun == "96", "p2_2"], na.rm = T)
med_Hogar_p2_2_m96
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "96"), "p2_2"] <- med_Hogar_p2_2_m96

med_Hogar_p2_2_m99 <- median(Hogar[Hogar$mun == "99", "p2_2"], na.rm = T)
med_Hogar_p2_2_m99
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "99"), "p2_2"] <- med_Hogar_p2_2_m99

med_Hogar_p2_2_m100 <- median(Hogar[Hogar$mun == "100", "p2_2"], na.rm = T)
med_Hogar_p2_2_m100
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "100"), "p2_2"] <- med_Hogar_p2_2_m100

med_Hogar_p2_2_m103 <- median(Hogar[Hogar$mun == "103", "p2_2"], na.rm = T)
med_Hogar_p2_2_m103
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "103"), "p2_2"] <- med_Hogar_p2_2_m103

med_Hogar_p2_2_m104 <- median(Hogar[Hogar$mun == "104", "p2_2"], na.rm = T)
med_Hogar_p2_2_m104
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "104"), "p2_2"] <- med_Hogar_p2_2_m104

med_Hogar_p2_2_m108 <- median(Hogar[Hogar$mun == "108", "p2_2"], na.rm = T)
med_Hogar_p2_2_m108
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "108"), "p2_2"] <- med_Hogar_p2_2_m108

med_Hogar_p2_2_m109 <- median(Hogar[Hogar$mun == "109", "p2_2"], na.rm = T)
med_Hogar_p2_2_m109
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "109"), "p2_2"] <- med_Hogar_p2_2_m109

med_Hogar_p2_2_m112 <- median(Hogar[Hogar$mun == "112", "p2_2"], na.rm = T)
med_Hogar_p2_2_m112
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "112"), "p2_2"] <- med_Hogar_p2_2_m112

med_Hogar_p2_2_m120 <- median(Hogar[Hogar$mun == "120", "p2_2"], na.rm = T)
med_Hogar_p2_2_m120
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "120"), "p2_2"] <- med_Hogar_p2_2_m120

med_Hogar_p2_2_m121 <- median(Hogar[Hogar$mun == "121", "p2_2"], na.rm = T)
med_Hogar_p2_2_m121
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "121"), "p2_2"] <- med_Hogar_p2_2_m121

med_Hogar_p2_2_m122 <- median(Hogar[Hogar$mun == "122", "p2_2"], na.rm = T)
med_Hogar_p2_2_m122
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "122"), "p2_2"] <- med_Hogar_p2_2_m122

med_Hogar_p2_2_m125 <- median(Hogar[Hogar$mun == "125", "p2_2"], na.rm = T)
med_Hogar_p2_2_m125
Hogar[(is.na(Hogar$p2_2) & Hogar$mun == "125"), "p2_2"] <- med_Hogar_p2_2_m125




Hogar[!complete.cases(Hogar),]

med_Hogar_p2_2b_1_m10 <- median(Hogar[Hogar$mun == "10", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m10
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "10"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m10


med_Hogar_p2_2b_1_m2 <- median(Hogar[Hogar$mun == "2", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m2
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "2"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m2


med_Hogar_p2_2b_1_m3 <- median(Hogar[Hogar$mun == "3", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m3
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "3"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m3


med_Hogar_p2_2b_1_m4 <- median(Hogar[Hogar$mun == "4", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m4
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "4"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m4

med_Hogar_p2_2b_1_m5 <- median(Hogar[Hogar$mun == "5", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m5
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "5"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m5


med_Hogar_p2_2b_1_m6 <- median(Hogar[Hogar$mun == "6", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m6
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "6"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m6


med_Hogar_p2_2b_1_m7 <- median(Hogar[Hogar$mun == "7", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m7
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "7"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m7


med_Hogar_p2_2b_1_m8 <- median(Hogar[Hogar$mun == "8", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m8
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "8"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m8


med_Hogar_p2_2b_1_m9 <- median(Hogar[Hogar$mun == "9", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m9
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "9"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m9


med_Hogar_p2_2b_1_m11 <- median(Hogar[Hogar$mun == "11", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m11
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "11"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m11


med_Hogar_p2_2b_1_m12 <- median(Hogar[Hogar$mun == "12", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m12
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "12"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m12

med_Hogar_p2_2b_1_m13 <- median(Hogar[Hogar$mun == "13", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m13
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "13"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m13

med_Hogar_p2_2b_1_m14 <- median(Hogar[Hogar$mun == "14", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m14
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "14"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m14

med_Hogar_p2_2b_1_m15 <- median(Hogar[Hogar$mun == "15", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m15
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "15"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m15


med_Hogar_p2_2b_1_m16 <- median(Hogar[Hogar$mun == "16", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m16
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "16"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m16


med_Hogar_p2_2b_1_m17 <- median(Hogar[Hogar$mun == "17", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m17
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "17"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m17


med_Hogar_p2_2b_1_m20 <- median(Hogar[Hogar$mun == "20", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m20
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "20"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m20

med_Hogar_p2_2b_1_m22 <- median(Hogar[Hogar$mun == "22", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m22
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "22"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m22

med_Hogar_p2_2b_1_m23 <- median(Hogar[Hogar$mun == "23", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m23
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "23"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m23

med_Hogar_p2_2b_1_m24 <- median(Hogar[Hogar$mun == "24", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m24
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "24"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m24

med_Hogar_p2_2b_1_m25 <- median(Hogar[Hogar$mun == "25", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m25
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "25"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m25

med_Hogar_p2_2b_1_m28 <- median(Hogar[Hogar$mun == "28", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m28
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "28"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m28

med_Hogar_p2_2b_1_m29 <- median(Hogar[Hogar$mun == "29", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m29
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "29"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m29

med_Hogar_p2_2b_1_m30 <- median(Hogar[Hogar$mun == "30", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m30
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "30"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m30

med_Hogar_p2_2b_1_m31 <- median(Hogar[Hogar$mun == "31", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m31
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "31"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m31

med_Hogar_p2_2b_1_m33 <- median(Hogar[Hogar$mun == "33", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m33
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "33"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m33

med_Hogar_p2_2b_1_m34 <- median(Hogar[Hogar$mun == "34", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m34
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "34"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m34

med_Hogar_p2_2b_1_m35 <- median(Hogar[Hogar$mun == "35", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m35
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "35"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m35

med_Hogar_p2_2b_1_m36 <- median(Hogar[Hogar$mun == "36", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m36
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "36"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m36

med_Hogar_p2_2b_1_m37 <- median(Hogar[Hogar$mun == "37", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m37
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "37"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m37

med_Hogar_p2_2b_1_m38 <- median(Hogar[Hogar$mun == "38", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m38
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "38"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m38

med_Hogar_p2_2b_1_m39 <- median(Hogar[Hogar$mun == "39", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m39
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "39"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m39

med_Hogar_p2_2b_1_m44 <- median(Hogar[Hogar$mun == "44", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m44
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "44"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m44

med_Hogar_p2_2b_1_m46 <- median(Hogar[Hogar$mun == "46", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m46
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "46"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m46

med_Hogar_p2_2b_1_m50 <- median(Hogar[Hogar$mun == "50", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m50
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "50"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m50

med_Hogar_p2_2b_1_m53 <- median(Hogar[Hogar$mun == "53", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m53
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "53"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m53

med_Hogar_p2_2b_1_m57 <- median(Hogar[Hogar$mun == "57", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m57
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "57"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m57

med_Hogar_p2_2b_1_m58 <- median(Hogar[Hogar$mun == "58", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m58
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "58"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m58

med_Hogar_p2_2b_1_m59 <- median(Hogar[Hogar$mun == "59", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m59
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "59"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m59

med_Hogar_p2_2b_1_m60 <- median(Hogar[Hogar$mun == "60", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m60
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "60"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m60

med_Hogar_p2_2b_1_m61 <- median(Hogar[Hogar$mun == "61", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m61
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "61"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m61

med_Hogar_p2_2b_1_m65 <- median(Hogar[Hogar$mun == "65", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m65
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "65"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m65

med_Hogar_p2_2b_1_m68 <- median(Hogar[Hogar$mun == "68", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m68
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "68"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m68

med_Hogar_p2_2b_1_m69 <- median(Hogar[Hogar$mun == "69", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m69
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "69"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m69

med_Hogar_p2_2b_1_m70 <- median(Hogar[Hogar$mun == "70", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m70
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "70"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m70

med_Hogar_p2_2b_1_m75 <- median(Hogar[Hogar$mun == "75", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m75
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "75"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m75

med_Hogar_p2_2b_1_m81 <- median(Hogar[Hogar$mun == "81", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m81
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "81"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m81

med_Hogar_p2_2b_1_m83 <- median(Hogar[Hogar$mun == "83", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m83
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "83"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m83

med_Hogar_p2_2b_1_m84 <- median(Hogar[Hogar$mun == "84", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m84
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "84"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m84

med_Hogar_p2_2b_1_m89 <- median(Hogar[Hogar$mun == "89", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m89
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "89"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m89

med_Hogar_p2_2b_1_m91 <- median(Hogar[Hogar$mun == "91", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m91
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "91"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m91

med_Hogar_p2_2b_1_m92 <- median(Hogar[Hogar$mun == "92", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m92
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "92"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m92

med_Hogar_p2_2b_1_m93 <- median(Hogar[Hogar$mun == "93", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m93
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "93"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m93

med_Hogar_p2_2b_1_m94 <- median(Hogar[Hogar$mun == "94", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m94
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "94"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m94

med_Hogar_p2_2b_1_m95 <- median(Hogar[Hogar$mun == "95", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m95
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "95"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m95

med_Hogar_p2_2b_1_m96 <- median(Hogar[Hogar$mun == "96", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m96
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "96"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m96

med_Hogar_p2_2b_1_m99 <- median(Hogar[Hogar$mun == "99", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m99
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "99"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m99

med_Hogar_p2_2b_1_m100 <- median(Hogar[Hogar$mun == "100", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m100
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "100"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m100

med_Hogar_p2_2b_1_m103 <- median(Hogar[Hogar$mun == "103", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m103
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "103"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m103

med_Hogar_p2_2b_1_m104 <- median(Hogar[Hogar$mun == "104", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m104
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "104"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m104

med_Hogar_p2_2b_1_m108 <- median(Hogar[Hogar$mun == "108", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m108
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "108"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m108

med_Hogar_p2_2b_1_m109 <- median(Hogar[Hogar$mun == "109", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m109
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "109"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m109

med_Hogar_p2_2b_1_m112 <- median(Hogar[Hogar$mun == "112", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m112
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "112"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m112

med_Hogar_p2_2b_1_m120 <- median(Hogar[Hogar$mun == "120", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m120
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "120"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m120

med_Hogar_p2_2b_1_m121 <- median(Hogar[Hogar$mun == "121", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m121
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "121"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m121

med_Hogar_p2_2b_1_m122 <- median(Hogar[Hogar$mun == "122", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m122
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "122"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m122

med_Hogar_p2_2b_1_m125 <- median(Hogar[Hogar$mun == "125", "p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1_m125
Hogar[(is.na(Hogar$p2_2b_1) & Hogar$mun == "125"), "p2_2b_1"] <- med_Hogar_p2_2b_1_m125




Hogar[!complete.cases(Hogar),]

med_Hogar_p2_2b_2_m10 <- median(Hogar[Hogar$mun == "10", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m10
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "10"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m10


med_Hogar_p2_2b_2_m2 <- median(Hogar[Hogar$mun == "2", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m2
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "2"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m2


med_Hogar_p2_2b_2_m3 <- median(Hogar[Hogar$mun == "3", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m3
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "3"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m3


med_Hogar_p2_2b_2_m4 <- median(Hogar[Hogar$mun == "4", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m4
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "4"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m4

med_Hogar_p2_2b_2_m5 <- median(Hogar[Hogar$mun == "5", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m5
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "5"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m5


med_Hogar_p2_2b_2_m6 <- median(Hogar[Hogar$mun == "6", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m6
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "6"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m6


med_Hogar_p2_2b_2_m7 <- median(Hogar[Hogar$mun == "7", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m7
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "7"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m7


med_Hogar_p2_2b_2_m8 <- median(Hogar[Hogar$mun == "8", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m8
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "8"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m8


med_Hogar_p2_2b_2_m9 <- median(Hogar[Hogar$mun == "9", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m9
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "9"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m9


med_Hogar_p2_2b_2_m11 <- median(Hogar[Hogar$mun == "11", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m11
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "11"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m11


med_Hogar_p2_2b_2_m12 <- median(Hogar[Hogar$mun == "12", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m12
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "12"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m12

med_Hogar_p2_2b_2_m13 <- median(Hogar[Hogar$mun == "13", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m13
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "13"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m13

med_Hogar_p2_2b_2_m14 <- median(Hogar[Hogar$mun == "14", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m14
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "14"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m14

med_Hogar_p2_2b_2_m15 <- median(Hogar[Hogar$mun == "15", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m15
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "15"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m15


med_Hogar_p2_2b_2_m16 <- median(Hogar[Hogar$mun == "16", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m16
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "16"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m16


med_Hogar_p2_2b_2_m17 <- median(Hogar[Hogar$mun == "17", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m17
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "17"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m17


med_Hogar_p2_2b_2_m20 <- median(Hogar[Hogar$mun == "20", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m20
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "20"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m20

med_Hogar_p2_2b_2_m22 <- median(Hogar[Hogar$mun == "22", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m22
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "22"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m22

med_Hogar_p2_2b_2_m23 <- median(Hogar[Hogar$mun == "23", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m23
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "23"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m23

med_Hogar_p2_2b_2_m24 <- median(Hogar[Hogar$mun == "24", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m24
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "24"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m24

med_Hogar_p2_2b_2_m25 <- median(Hogar[Hogar$mun == "25", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m25
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "25"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m25

med_Hogar_p2_2b_2_m28 <- median(Hogar[Hogar$mun == "28", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m28
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "28"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m28

med_Hogar_p2_2b_2_m29 <- median(Hogar[Hogar$mun == "29", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m29
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "29"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m29

med_Hogar_p2_2b_2_m30 <- median(Hogar[Hogar$mun == "30", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m30
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "30"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m30

med_Hogar_p2_2b_2_m31 <- median(Hogar[Hogar$mun == "31", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m31
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "31"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m31

med_Hogar_p2_2b_2_m33 <- median(Hogar[Hogar$mun == "33", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m33
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "33"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m33

med_Hogar_p2_2b_2_m34 <- median(Hogar[Hogar$mun == "34", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m34
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "34"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m34

med_Hogar_p2_2b_2_m35 <- median(Hogar[Hogar$mun == "35", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m35
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "35"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m35

med_Hogar_p2_2b_2_m36 <- median(Hogar[Hogar$mun == "36", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m36
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "36"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m36

med_Hogar_p2_2b_2_m37 <- median(Hogar[Hogar$mun == "37", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m37
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "37"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m37

med_Hogar_p2_2b_2_m38 <- median(Hogar[Hogar$mun == "38", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m38
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "38"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m38

med_Hogar_p2_2b_2_m39 <- median(Hogar[Hogar$mun == "39", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m39
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "39"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m39

med_Hogar_p2_2b_2_m44 <- median(Hogar[Hogar$mun == "44", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m44
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "44"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m44

med_Hogar_p2_2b_2_m46 <- median(Hogar[Hogar$mun == "46", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m46
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "46"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m46

med_Hogar_p2_2b_2_m50 <- median(Hogar[Hogar$mun == "50", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m50
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "50"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m50

med_Hogar_p2_2b_2_m53 <- median(Hogar[Hogar$mun == "53", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m53
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "53"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m53

med_Hogar_p2_2b_2_m57 <- median(Hogar[Hogar$mun == "57", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m57
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "57"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m57

med_Hogar_p2_2b_2_m58 <- median(Hogar[Hogar$mun == "58", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m58
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "58"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m58

med_Hogar_p2_2b_2_m59 <- median(Hogar[Hogar$mun == "59", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m59
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "59"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m59

med_Hogar_p2_2b_2_m60 <- median(Hogar[Hogar$mun == "60", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m60
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "60"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m60

med_Hogar_p2_2b_2_m61 <- median(Hogar[Hogar$mun == "61", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m61
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "61"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m61

med_Hogar_p2_2b_2_m65 <- median(Hogar[Hogar$mun == "65", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m65
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "65"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m65

med_Hogar_p2_2b_2_m68 <- median(Hogar[Hogar$mun == "68", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m68
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "68"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m68

med_Hogar_p2_2b_2_m69 <- median(Hogar[Hogar$mun == "69", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m69
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "69"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m69

med_Hogar_p2_2b_2_m70 <- median(Hogar[Hogar$mun == "70", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m70
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "70"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m70

med_Hogar_p2_2b_2_m75 <- median(Hogar[Hogar$mun == "75", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m75
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "75"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m75

med_Hogar_p2_2b_2_m81 <- median(Hogar[Hogar$mun == "81", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m81
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "81"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m81

med_Hogar_p2_2b_2_m83 <- median(Hogar[Hogar$mun == "83", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m83
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "83"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m83

med_Hogar_p2_2b_2_m84 <- median(Hogar[Hogar$mun == "84", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m84
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "84"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m84

med_Hogar_p2_2b_2_m89 <- median(Hogar[Hogar$mun == "89", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m89
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "89"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m89

med_Hogar_p2_2b_2_m91 <- median(Hogar[Hogar$mun == "91", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m91
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "91"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m91

med_Hogar_p2_2b_2_m92 <- median(Hogar[Hogar$mun == "92", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m92
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "92"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m92

med_Hogar_p2_2b_2_m93 <- median(Hogar[Hogar$mun == "93", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m93
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "93"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m93

med_Hogar_p2_2b_2_m94 <- median(Hogar[Hogar$mun == "94", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m94
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "94"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m94

med_Hogar_p2_2b_2_m95 <- median(Hogar[Hogar$mun == "95", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m95
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "95"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m95

med_Hogar_p2_2b_2_m96 <- median(Hogar[Hogar$mun == "96", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m96
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "96"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m96

med_Hogar_p2_2b_2_m99 <- median(Hogar[Hogar$mun == "99", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m99
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "99"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m99

med_Hogar_p2_2b_2_m100 <- median(Hogar[Hogar$mun == "100", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m100
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "100"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m100

med_Hogar_p2_2b_2_m103 <- median(Hogar[Hogar$mun == "103", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m103
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "103"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m103

med_Hogar_p2_2b_2_m104 <- median(Hogar[Hogar$mun == "104", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m104
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "104"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m104

med_Hogar_p2_2b_2_m108 <- median(Hogar[Hogar$mun == "108", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m108
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "108"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m108

med_Hogar_p2_2b_2_m109 <- median(Hogar[Hogar$mun == "109", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m109
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "109"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m109

med_Hogar_p2_2b_2_m112 <- median(Hogar[Hogar$mun == "112", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m112
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "112"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m112

med_Hogar_p2_2b_2_m120 <- median(Hogar[Hogar$mun == "120", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m120
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "120"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m120

med_Hogar_p2_2b_2_m121 <- median(Hogar[Hogar$mun == "121", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m121
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "121"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m121

med_Hogar_p2_2b_2_m122 <- median(Hogar[Hogar$mun == "122", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m122
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "122"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m122

med_Hogar_p2_2b_2_m125 <- median(Hogar[Hogar$mun == "125", "p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2_m125
Hogar[(is.na(Hogar$p2_2b_2) & Hogar$mun == "125"), "p2_2b_2"] <- med_Hogar_p2_2b_2_m125



med_Hogar_p2_2b_3_m10 <- median(Hogar[Hogar$mun == "10", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m10
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "10"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m10

Hogar$mun <- as.factor(Hogar$mun)
levels(Hogar$mun)

med_Hogar_p2_2b_3_m2 <- median(Hogar[Hogar$mun == "2", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m2
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "2"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m2


med_Hogar_p2_2b_3_m3 <- median(Hogar[Hogar$mun == "3", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m3
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "3"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m3


med_Hogar_p2_2b_3_m4 <- median(Hogar[Hogar$mun == "4", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m4
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "4"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m4

med_Hogar_p2_2b_3_m5 <- median(Hogar[Hogar$mun == "5", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m5
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "5"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m5


med_Hogar_p2_2b_3_m6 <- median(Hogar[Hogar$mun == "6", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m6
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "6"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m6


med_Hogar_p2_2b_3_m7 <- median(Hogar[Hogar$mun == "7", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m7
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "7"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m7


med_Hogar_p2_2b_3_m8 <- median(Hogar[Hogar$mun == "8", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m8
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "8"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m8


med_Hogar_p2_2b_3_m9 <- median(Hogar[Hogar$mun == "9", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m9
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "9"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m9


med_Hogar_p2_2b_3_m11 <- median(Hogar[Hogar$mun == "11", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m11
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "11"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m11


med_Hogar_p2_2b_3_m12 <- median(Hogar[Hogar$mun == "12", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m12
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "12"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m12

med_Hogar_p2_2b_3_m13 <- median(Hogar[Hogar$mun == "13", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m13
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "13"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m13

med_Hogar_p2_2b_3_m14 <- median(Hogar[Hogar$mun == "14", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m14
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "14"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m14

med_Hogar_p2_2b_3_m15 <- median(Hogar[Hogar$mun == "15", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m15
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "15"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m15


med_Hogar_p2_2b_3_m16 <- median(Hogar[Hogar$mun == "16", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m16
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "16"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m16


med_Hogar_p2_2b_3_m17 <- median(Hogar[Hogar$mun == "17", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m17
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "17"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m17


med_Hogar_p2_2b_3_m20 <- median(Hogar[Hogar$mun == "20", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m20
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "20"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m20

med_Hogar_p2_2b_3_m22 <- median(Hogar[Hogar$mun == "22", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m22
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "22"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m22

med_Hogar_p2_2b_3_m23 <- median(Hogar[Hogar$mun == "23", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m23
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "23"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m23

med_Hogar_p2_2b_3_m24 <- median(Hogar[Hogar$mun == "24", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m24
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "24"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m24

med_Hogar_p2_2b_3_m25 <- median(Hogar[Hogar$mun == "25", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m25
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "25"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m25

med_Hogar_p2_2b_3_m28 <- median(Hogar[Hogar$mun == "28", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m28
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "28"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m28

med_Hogar_p2_2b_3_m29 <- median(Hogar[Hogar$mun == "29", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m29
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "29"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m29

med_Hogar_p2_2b_3_m30 <- median(Hogar[Hogar$mun == "30", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m30
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "30"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m30

med_Hogar_p2_2b_3_m31 <- median(Hogar[Hogar$mun == "31", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m31
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "31"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m31

med_Hogar_p2_2b_3_m33 <- median(Hogar[Hogar$mun == "33", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m33
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "33"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m33

med_Hogar_p2_2b_3_m34 <- median(Hogar[Hogar$mun == "34", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m34
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "34"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m34

med_Hogar_p2_2b_3_m35 <- median(Hogar[Hogar$mun == "35", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m35
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "35"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m35

med_Hogar_p2_2b_3_m36 <- median(Hogar[Hogar$mun == "36", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m36
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "36"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m36

med_Hogar_p2_2b_3_m37 <- median(Hogar[Hogar$mun == "37", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m37
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "37"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m37

med_Hogar_p2_2b_3_m38 <- median(Hogar[Hogar$mun == "38", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m38
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "38"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m38

med_Hogar_p2_2b_3_m39 <- median(Hogar[Hogar$mun == "39", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m39
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "39"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m39

med_Hogar_p2_2b_3_m44 <- median(Hogar[Hogar$mun == "44", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m44
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "44"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m44

med_Hogar_p2_2b_3_m46 <- median(Hogar[Hogar$mun == "46", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m46
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "46"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m46

med_Hogar_p2_2b_3_m50 <- median(Hogar[Hogar$mun == "50", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m50
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "50"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m50

med_Hogar_p2_2b_3_m53 <- median(Hogar[Hogar$mun == "53", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m53
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "53"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m53

med_Hogar_p2_2b_3_m57 <- median(Hogar[Hogar$mun == "57", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m57
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "57"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m57

med_Hogar_p2_2b_3_m58 <- median(Hogar[Hogar$mun == "58", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m58
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "58"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m58

med_Hogar_p2_2b_3_m59 <- median(Hogar[Hogar$mun == "59", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m59
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "59"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m59

med_Hogar_p2_2b_3_m60 <- median(Hogar[Hogar$mun == "60", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m60
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "60"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m60

med_Hogar_p2_2b_3_m61 <- median(Hogar[Hogar$mun == "61", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m61
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "61"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m61

med_Hogar_p2_2b_3_m65 <- median(Hogar[Hogar$mun == "65", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m65
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "65"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m65

med_Hogar_p2_2b_3_m68 <- median(Hogar[Hogar$mun == "68", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m68
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "68"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m68

med_Hogar_p2_2b_3_m69 <- median(Hogar[Hogar$mun == "69", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m69
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "69"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m69

med_Hogar_p2_2b_3_m70 <- median(Hogar[Hogar$mun == "70", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m70
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "70"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m70

med_Hogar_p2_2b_3_m75 <- median(Hogar[Hogar$mun == "75", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m75
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "75"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m75

med_Hogar_p2_2b_3_m81 <- median(Hogar[Hogar$mun == "81", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m81
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "81"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m81

med_Hogar_p2_2b_3_m83 <- median(Hogar[Hogar$mun == "83", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m83
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "83"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m83

med_Hogar_p2_2b_3_m84 <- median(Hogar[Hogar$mun == "84", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m84
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "84"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m84

med_Hogar_p2_2b_3_m89 <- median(Hogar[Hogar$mun == "89", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m89
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "89"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m89

med_Hogar_p2_2b_3_m91 <- median(Hogar[Hogar$mun == "91", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m91
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "91"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m91

med_Hogar_p2_2b_3_m92 <- median(Hogar[Hogar$mun == "92", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m92
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "92"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m92

med_Hogar_p2_2b_3_m93 <- median(Hogar[Hogar$mun == "93", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m93
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "93"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m93

med_Hogar_p2_2b_3_m94 <- median(Hogar[Hogar$mun == "94", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m94
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "94"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m94

med_Hogar_p2_2b_3_m95 <- median(Hogar[Hogar$mun == "95", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m95
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "95"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m95

med_Hogar_p2_2b_3_m96 <- median(Hogar[Hogar$mun == "96", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m96
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "96"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m96

med_Hogar_p2_2b_3_m99 <- median(Hogar[Hogar$mun == "99", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m99
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "99"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m99

med_Hogar_p2_2b_3_m100 <- median(Hogar[Hogar$mun == "100", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m100
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "100"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m100

med_Hogar_p2_2b_3_m103 <- median(Hogar[Hogar$mun == "103", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m103
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "103"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m103

med_Hogar_p2_2b_3_m104 <- median(Hogar[Hogar$mun == "104", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m104
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "104"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m104

med_Hogar_p2_2b_3_m108 <- median(Hogar[Hogar$mun == "108", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m108
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "108"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m108

med_Hogar_p2_2b_3_m109 <- median(Hogar[Hogar$mun == "109", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m109
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "109"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m109

med_Hogar_p2_2b_3_m112 <- median(Hogar[Hogar$mun == "112", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m112
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "112"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m112

med_Hogar_p2_2b_3_m120 <- median(Hogar[Hogar$mun == "120", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m120
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "120"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m120

med_Hogar_p2_2b_3_m121 <- median(Hogar[Hogar$mun == "121", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m121
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "121"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m121

med_Hogar_p2_2b_3_m122 <- median(Hogar[Hogar$mun == "122", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m122
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "122"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m122

med_Hogar_p2_2b_3_m125 <- median(Hogar[Hogar$mun == "125", "p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3_m125
Hogar[(is.na(Hogar$p2_2b_3) & Hogar$mun == "125"), "p2_2b_3"] <- med_Hogar_p2_2b_3_m125



med_Hogar_p2_2b_4_m10 <- median(Hogar[Hogar$mun == "10", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m10
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "10"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m10

Hogar$mun <- as.factor(Hogar$mun)
levels(Hogar$mun)

med_Hogar_p2_2b_4_m2 <- median(Hogar[Hogar$mun == "2", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m2
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "2"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m2


med_Hogar_p2_2b_4_m3 <- median(Hogar[Hogar$mun == "3", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m3
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "3"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m3


med_Hogar_p2_2b_4_m4 <- median(Hogar[Hogar$mun == "4", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m4
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "4"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m4

med_Hogar_p2_2b_4_m5 <- median(Hogar[Hogar$mun == "5", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m5
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "5"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m5


med_Hogar_p2_2b_4_m6 <- median(Hogar[Hogar$mun == "6", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m6
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "6"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m6


med_Hogar_p2_2b_4_m7 <- median(Hogar[Hogar$mun == "7", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m7
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "7"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m7


med_Hogar_p2_2b_4_m8 <- median(Hogar[Hogar$mun == "8", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m8
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "8"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m8


med_Hogar_p2_2b_4_m9 <- median(Hogar[Hogar$mun == "9", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m9
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "9"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m9


med_Hogar_p2_2b_4_m11 <- median(Hogar[Hogar$mun == "11", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m11
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "11"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m11


med_Hogar_p2_2b_4_m12 <- median(Hogar[Hogar$mun == "12", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m12
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "12"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m12

med_Hogar_p2_2b_4_m13 <- median(Hogar[Hogar$mun == "13", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m13
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "13"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m13

med_Hogar_p2_2b_4_m14 <- median(Hogar[Hogar$mun == "14", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m14
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "14"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m14

med_Hogar_p2_2b_4_m15 <- median(Hogar[Hogar$mun == "15", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m15
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "15"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m15


med_Hogar_p2_2b_4_m16 <- median(Hogar[Hogar$mun == "16", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m16
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "16"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m16


med_Hogar_p2_2b_4_m17 <- median(Hogar[Hogar$mun == "17", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m17
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "17"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m17


med_Hogar_p2_2b_4_m20 <- median(Hogar[Hogar$mun == "20", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m20
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "20"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m20

med_Hogar_p2_2b_4_m22 <- median(Hogar[Hogar$mun == "22", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m22
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "22"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m22

med_Hogar_p2_2b_4_m23 <- median(Hogar[Hogar$mun == "23", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m23
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "23"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m23

med_Hogar_p2_2b_4_m24 <- median(Hogar[Hogar$mun == "24", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m24
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "24"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m24

med_Hogar_p2_2b_4_m25 <- median(Hogar[Hogar$mun == "25", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m25
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "25"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m25

med_Hogar_p2_2b_4_m28 <- median(Hogar[Hogar$mun == "28", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m28
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "28"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m28

med_Hogar_p2_2b_4_m29 <- median(Hogar[Hogar$mun == "29", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m29
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "29"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m29

med_Hogar_p2_2b_4_m30 <- median(Hogar[Hogar$mun == "30", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m30
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "30"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m30

med_Hogar_p2_2b_4_m31 <- median(Hogar[Hogar$mun == "31", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m31
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "31"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m31

med_Hogar_p2_2b_4_m33 <- median(Hogar[Hogar$mun == "33", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m33
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "33"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m33

med_Hogar_p2_2b_4_m34 <- median(Hogar[Hogar$mun == "34", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m34
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "34"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m34

med_Hogar_p2_2b_4_m35 <- median(Hogar[Hogar$mun == "35", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m35
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "35"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m35

med_Hogar_p2_2b_4_m36 <- median(Hogar[Hogar$mun == "36", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m36
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "36"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m36

med_Hogar_p2_2b_4_m37 <- median(Hogar[Hogar$mun == "37", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m37
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "37"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m37

med_Hogar_p2_2b_4_m38 <- median(Hogar[Hogar$mun == "38", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m38
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "38"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m38

med_Hogar_p2_2b_4_m39 <- median(Hogar[Hogar$mun == "39", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m39
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "39"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m39

med_Hogar_p2_2b_4_m44 <- median(Hogar[Hogar$mun == "44", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m44
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "44"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m44

med_Hogar_p2_2b_4_m46 <- median(Hogar[Hogar$mun == "46", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m46
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "46"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m46

med_Hogar_p2_2b_4_m50 <- median(Hogar[Hogar$mun == "50", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m50
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "50"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m50

med_Hogar_p2_2b_4_m53 <- median(Hogar[Hogar$mun == "53", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m53
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "53"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m53

med_Hogar_p2_2b_4_m57 <- median(Hogar[Hogar$mun == "57", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m57
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "57"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m57

med_Hogar_p2_2b_4_m58 <- median(Hogar[Hogar$mun == "58", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m58
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "58"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m58

med_Hogar_p2_2b_4_m59 <- median(Hogar[Hogar$mun == "59", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m59
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "59"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m59

med_Hogar_p2_2b_4_m60 <- median(Hogar[Hogar$mun == "60", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m60
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "60"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m60

med_Hogar_p2_2b_4_m61 <- median(Hogar[Hogar$mun == "61", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m61
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "61"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m61

med_Hogar_p2_2b_4_m65 <- median(Hogar[Hogar$mun == "65", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m65
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "65"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m65

med_Hogar_p2_2b_4_m68 <- median(Hogar[Hogar$mun == "68", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m68
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "68"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m68

med_Hogar_p2_2b_4_m69 <- median(Hogar[Hogar$mun == "69", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m69
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "69"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m69

med_Hogar_p2_2b_4_m70 <- median(Hogar[Hogar$mun == "70", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m70
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "70"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m70

med_Hogar_p2_2b_4_m75 <- median(Hogar[Hogar$mun == "75", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m75
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "75"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m75

med_Hogar_p2_2b_4_m81 <- median(Hogar[Hogar$mun == "81", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m81
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "81"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m81

med_Hogar_p2_2b_4_m83 <- median(Hogar[Hogar$mun == "83", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m83
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "83"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m83

med_Hogar_p2_2b_4_m84 <- median(Hogar[Hogar$mun == "84", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m84
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "84"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m84

med_Hogar_p2_2b_4_m89 <- median(Hogar[Hogar$mun == "89", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m89
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "89"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m89

med_Hogar_p2_2b_4_m91 <- median(Hogar[Hogar$mun == "91", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m91
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "91"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m91

med_Hogar_p2_2b_4_m92 <- median(Hogar[Hogar$mun == "92", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m92
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "92"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m92

med_Hogar_p2_2b_4_m93 <- median(Hogar[Hogar$mun == "93", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m93
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "93"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m93

med_Hogar_p2_2b_4_m94 <- median(Hogar[Hogar$mun == "94", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m94
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "94"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m94

med_Hogar_p2_2b_4_m95 <- median(Hogar[Hogar$mun == "95", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m95
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "95"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m95

med_Hogar_p2_2b_4_m96 <- median(Hogar[Hogar$mun == "96", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m96
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "96"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m96

med_Hogar_p2_2b_4_m99 <- median(Hogar[Hogar$mun == "99", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m99
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "99"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m99

med_Hogar_p2_2b_4_m100 <- median(Hogar[Hogar$mun == "100", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m100
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "100"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m100

med_Hogar_p2_2b_4_m103 <- median(Hogar[Hogar$mun == "103", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m103
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "103"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m103

med_Hogar_p2_2b_4_m104 <- median(Hogar[Hogar$mun == "104", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m104
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "104"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m104

med_Hogar_p2_2b_4_m108 <- median(Hogar[Hogar$mun == "108", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m108
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "108"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m108

med_Hogar_p2_2b_4_m109 <- median(Hogar[Hogar$mun == "109", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m109
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "109"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m109

med_Hogar_p2_2b_4_m112 <- median(Hogar[Hogar$mun == "112", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m112
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "112"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m112

med_Hogar_p2_2b_4_m120 <- median(Hogar[Hogar$mun == "120", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m120
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "120"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m120

med_Hogar_p2_2b_4_m121 <- median(Hogar[Hogar$mun == "121", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m121
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "121"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m121

med_Hogar_p2_2b_4_m122 <- median(Hogar[Hogar$mun == "122", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m122
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "122"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m122

med_Hogar_p2_2b_4_m125 <- median(Hogar[Hogar$mun == "125", "p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4_m125
Hogar[(is.na(Hogar$p2_2b_4) & Hogar$mun == "125"), "p2_2b_4"] <- med_Hogar_p2_2b_4_m125

```

#### Checar otra vez Hogar

```{r}
head(Hogar)
tail(Hogar)
str(Hogar)
summary(Hogar)
Hogar[!complete.cases(Hogar),]
```

#### entonces lo que queda pongo la mediana general de toda la columna:

```{r}
med_Hogar_p2_2 <- median(Hogar[,"p2_2"], na.rm = T)
med_Hogar_p2_2
Hogar[is.na(Hogar$p2_2), "p2_2"] <- med_Hogar_p2_2


med_Hogar_p2_2b_1 <- median(Hogar[,"p2_2b_1"], na.rm = T)
med_Hogar_p2_2b_1
Hogar[is.na(Hogar$p2_2b_1), "p2_2b_1"] <- med_Hogar_p2_2b_1


med_Hogar_p2_2b_2 <- median(Hogar[,"p2_2b_2"], na.rm = T)
med_Hogar_p2_2b_2
Hogar[is.na(Hogar$p2_2b_2), "p2_2b_2"] <- med_Hogar_p2_2b_2

med_Hogar_p2_2b_3 <- median(Hogar[,"p2_2b_3"], na.rm = T)
med_Hogar_p2_2b_3
Hogar[is.na(Hogar$p2_2b_3), "p2_2b_3"] <- med_Hogar_p2_2b_3

med_Hogar_p2_2b_4 <- median(Hogar[,"p2_2b_4"], na.rm = T)
med_Hogar_p2_2b_4
Hogar[is.na(Hogar$p2_2b_4), "p2_2b_4"] <- med_Hogar_p2_2b_4


Hogar[!complete.cases(Hogar),]

```


### Explorar base de datos Vivienda

```{r}
head(Vivienda)
tail(Vivienda)
str(Vivienda)
summary(Vivienda)

Vivienda$p1_3 <- as.numeric(Vivienda$p1_3)
Vivienda$p1_1 <- as.numeric(Vivienda$p1_1)
str(Vivienda)

Vivienda[!complete.cases(Vivienda),]
```

#### Por lo que vi creo que los que no contestaron la pregunta 3 su respuesta es 1 entonces:

```{r}
Vivienda_backup <- Vivienda
Vivienda[!complete.cases(Vivienda),]
Vivienda[is.na(Vivienda$p1_3),]
Vivienda[is.na(Vivienda$p1_3),]
Vivienda[is.na(Vivienda$p1_3), "p1_3"] <- 1
Vivienda[!complete.cases(Vivienda),]
head(Vivienda)
```


### Explorar base de datos PerfilSociodemografico

```{r}
head(PerfilSociodemografico)
tail(PerfilSociodemografico)
str(PerfilSociodemografico)
summary(PerfilSociodemografico)

PerfilSociodemografico$edad <- as.numeric(PerfilSociodemografico$edad)
PerfilSociodemografico$p5_4 <- as.numeric(PerfilSociodemografico$p5_4)
PerfilSociodemografico$p6_4 <- as.numeric(PerfilSociodemografico$p6_4)
str(PerfilSociodemografico)

str(PerfilSociodemografico)

PerfilSociodemografico[!complete.cases(PerfilSociodemografico),]
```

### Voy a sustituir por medianas

```{r}
PerfilSociodemografico$mun <- as.factor(PerfilSociodemografico$mun)
levels(PerfilSociodemografico$mun)

med_tsdem_niv_2 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "2", "niv"], na.rm = T)
PerfilSociodemografico[(is.na(PerfilSociodemografico$"niv") & PerfilSociodemografico$mun == "2"), "niv"] <- med_tsdem_niv_2

med_PerfilSociodemografico_niv_m10 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "10", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m10
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "10"), "niv"] <- med_PerfilSociodemografico_niv_m10

med_PerfilSociodemografico_niv_m3 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "3", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m3
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "3"), "niv"] <- med_PerfilSociodemografico_niv_m3


med_PerfilSociodemografico_niv_m4 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "4", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m4
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "4"), "niv"] <- med_PerfilSociodemografico_niv_m4

med_PerfilSociodemografico_niv_m5 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "5", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m5
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "5"), "niv"] <- med_PerfilSociodemografico_niv_m5


med_PerfilSociodemografico_niv_m6 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "6", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m6
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "6"), "niv"] <- med_PerfilSociodemografico_niv_m6


med_PerfilSociodemografico_niv_m7 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "7", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m7
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "7"), "niv"] <- med_PerfilSociodemografico_niv_m7


med_PerfilSociodemografico_niv_m8 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "8", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m8
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "8"), "niv"] <- med_PerfilSociodemografico_niv_m8


med_PerfilSociodemografico_niv_m9 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "9", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m9
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "9"), "niv"] <- med_PerfilSociodemografico_niv_m9


med_PerfilSociodemografico_niv_m11 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "11", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m11
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "11"), "niv"] <- med_PerfilSociodemografico_niv_m11


med_PerfilSociodemografico_niv_m12 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "12", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m12
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "12"), "niv"] <- med_PerfilSociodemografico_niv_m12

med_PerfilSociodemografico_niv_m13 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "13", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m13
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "13"), "niv"] <- med_PerfilSociodemografico_niv_m13

med_PerfilSociodemografico_niv_m14 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "14", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m14
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "14"), "niv"] <- med_PerfilSociodemografico_niv_m14

med_PerfilSociodemografico_niv_m15 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "15", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m15
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "15"), "niv"] <- med_PerfilSociodemografico_niv_m15


med_PerfilSociodemografico_niv_m16 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "16", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m16
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "16"), "niv"] <- med_PerfilSociodemografico_niv_m16


med_PerfilSociodemografico_niv_m17 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "17", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m17
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "17"), "niv"] <- med_PerfilSociodemografico_niv_m17


med_PerfilSociodemografico_niv_m20 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "20", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m20
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "20"), "niv"] <- med_PerfilSociodemografico_niv_m20

med_PerfilSociodemografico_niv_m22 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "22", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m22
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "22"), "niv"] <- med_PerfilSociodemografico_niv_m22

med_PerfilSociodemografico_niv_m23 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "23", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m23
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "23"), "niv"] <- med_PerfilSociodemografico_niv_m23

med_PerfilSociodemografico_niv_m24 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "24", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m24
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "24"), "niv"] <- med_PerfilSociodemografico_niv_m24

med_PerfilSociodemografico_niv_m25 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "25", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m25
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "25"), "niv"] <- med_PerfilSociodemografico_niv_m25

med_PerfilSociodemografico_niv_m28 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "28", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m28
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "28"), "niv"] <- med_PerfilSociodemografico_niv_m28

med_PerfilSociodemografico_niv_m29 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "29", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m29
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "29"), "niv"] <- med_PerfilSociodemografico_niv_m29

med_PerfilSociodemografico_niv_m30 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "30", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m30
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "30"), "niv"] <- med_PerfilSociodemografico_niv_m30

med_PerfilSociodemografico_niv_m31 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "31", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m31
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "31"), "niv"] <- med_PerfilSociodemografico_niv_m31

med_PerfilSociodemografico_niv_m33 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "33", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m33
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "33"), "niv"] <- med_PerfilSociodemografico_niv_m33

med_PerfilSociodemografico_niv_m34 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "34", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m34
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "34"), "niv"] <- med_PerfilSociodemografico_niv_m34

med_PerfilSociodemografico_niv_m35 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "35", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m35
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "35"), "niv"] <- med_PerfilSociodemografico_niv_m35

med_PerfilSociodemografico_niv_m36 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "36", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m36
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "36"), "niv"] <- med_PerfilSociodemografico_niv_m36

med_PerfilSociodemografico_niv_m37 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "37", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m37
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "37"), "niv"] <- med_PerfilSociodemografico_niv_m37

med_PerfilSociodemografico_niv_m38 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "38", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m38
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "38"), "niv"] <- med_PerfilSociodemografico_niv_m38

med_PerfilSociodemografico_niv_m39 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "39", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m39
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "39"), "niv"] <- med_PerfilSociodemografico_niv_m39

med_PerfilSociodemografico_niv_m44 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "44", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m44
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "44"), "niv"] <- med_PerfilSociodemografico_niv_m44

med_PerfilSociodemografico_niv_m46 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "46", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m46
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "46"), "niv"] <- med_PerfilSociodemografico_niv_m46

med_PerfilSociodemografico_niv_m50 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "50", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m50
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "50"), "niv"] <- med_PerfilSociodemografico_niv_m50

med_PerfilSociodemografico_niv_m53 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "53", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m53
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "53"), "niv"] <- med_PerfilSociodemografico_niv_m53

med_PerfilSociodemografico_niv_m57 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "57", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m57
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "57"), "niv"] <- med_PerfilSociodemografico_niv_m57

med_PerfilSociodemografico_niv_m58 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "58", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m58
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "58"), "niv"] <- med_PerfilSociodemografico_niv_m58

med_PerfilSociodemografico_niv_m59 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "59", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m59
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "59"), "niv"] <- med_PerfilSociodemografico_niv_m59

med_PerfilSociodemografico_niv_m60 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "60", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m60
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "60"), "niv"] <- med_PerfilSociodemografico_niv_m60

med_PerfilSociodemografico_niv_m61 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "61", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m61
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "61"), "niv"] <- med_PerfilSociodemografico_niv_m61

med_PerfilSociodemografico_niv_m65 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "65", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m65
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "65"), "niv"] <- med_PerfilSociodemografico_niv_m65

med_PerfilSociodemografico_niv_m68 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "68", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m68
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "68"), "niv"] <- med_PerfilSociodemografico_niv_m68

med_PerfilSociodemografico_niv_m69 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "69", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m69
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "69"), "niv"] <- med_PerfilSociodemografico_niv_m69

med_PerfilSociodemografico_niv_m70 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "70", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m70
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "70"), "niv"] <- med_PerfilSociodemografico_niv_m70

med_PerfilSociodemografico_niv_m75 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "75", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m75
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "75"), "niv"] <- med_PerfilSociodemografico_niv_m75

med_PerfilSociodemografico_niv_m81 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "81", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m81
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "81"), "niv"] <- med_PerfilSociodemografico_niv_m81

med_PerfilSociodemografico_niv_m83 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "83", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m83
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "83"), "niv"] <- med_PerfilSociodemografico_niv_m83

med_PerfilSociodemografico_niv_m84 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "84", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m84
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "84"), "niv"] <- med_PerfilSociodemografico_niv_m84

med_PerfilSociodemografico_niv_m89 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "89", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m89
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "89"), "niv"] <- med_PerfilSociodemografico_niv_m89

med_PerfilSociodemografico_niv_m91 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "91", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m91
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "91"), "niv"] <- med_PerfilSociodemografico_niv_m91

med_PerfilSociodemografico_niv_m92 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "92", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m92
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "92"), "niv"] <- med_PerfilSociodemografico_niv_m92

med_PerfilSociodemografico_niv_m93 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "93", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m93
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "93"), "niv"] <- med_PerfilSociodemografico_niv_m93

med_PerfilSociodemografico_niv_m94 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "94", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m94
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "94"), "niv"] <- med_PerfilSociodemografico_niv_m94

med_PerfilSociodemografico_niv_m95 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "95", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m95
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "95"), "niv"] <- med_PerfilSociodemografico_niv_m95

med_PerfilSociodemografico_niv_m96 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "96", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m96
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "96"), "niv"] <- med_PerfilSociodemografico_niv_m96

med_PerfilSociodemografico_niv_m99 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "99", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m99
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "99"), "niv"] <- med_PerfilSociodemografico_niv_m99

med_PerfilSociodemografico_niv_m100 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "100", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m100
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "100"), "niv"] <- med_PerfilSociodemografico_niv_m100

med_PerfilSociodemografico_niv_m103 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "103", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m103
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "103"), "niv"] <- med_PerfilSociodemografico_niv_m103

med_PerfilSociodemografico_niv_m104 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "104", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m104
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "104"), "niv"] <- med_PerfilSociodemografico_niv_m104

med_PerfilSociodemografico_niv_m108 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "108", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m108
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "108"), "niv"] <- med_PerfilSociodemografico_niv_m108

med_PerfilSociodemografico_niv_m109 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "109", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m109
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "109"), "niv"] <- med_PerfilSociodemografico_niv_m109

med_PerfilSociodemografico_niv_m112 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "112", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m112
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "112"), "niv"] <- med_PerfilSociodemografico_niv_m112

med_PerfilSociodemografico_niv_m120 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "120", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m120
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "120"), "niv"] <- med_PerfilSociodemografico_niv_m120

med_PerfilSociodemografico_niv_m121 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "121", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m121
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "121"), "niv"] <- med_PerfilSociodemografico_niv_m121

med_PerfilSociodemografico_niv_m122 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "122", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m122
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "122"), "niv"] <- med_PerfilSociodemografico_niv_m122

med_PerfilSociodemografico_niv_m125 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "125", "niv"], na.rm = T)
med_PerfilSociodemografico_niv_m125
PerfilSociodemografico[(is.na(PerfilSociodemografico$niv) & PerfilSociodemografico$mun == "125"), "niv"] <- med_PerfilSociodemografico_niv_m125



med_tsdem_gra_2 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "2", "gra"], na.rm = T)
PerfilSociodemografico[(is.na(PerfilSociodemografico$"gra") & PerfilSociodemografico$mun == "2"), "gra"] <- med_tsdem_gra_2

med_PerfilSociodemografico_gra_m10 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "10", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m10
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "10"), "gra"] <- med_PerfilSociodemografico_gra_m10

med_PerfilSociodemografico_gra_m3 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "3", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m3
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "3"), "gra"] <- med_PerfilSociodemografico_gra_m3


med_PerfilSociodemografico_gra_m4 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "4", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m4
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "4"), "gra"] <- med_PerfilSociodemografico_gra_m4

med_PerfilSociodemografico_gra_m5 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "5", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m5
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "5"), "gra"] <- med_PerfilSociodemografico_gra_m5


med_PerfilSociodemografico_gra_m6 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "6", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m6
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "6"), "gra"] <- med_PerfilSociodemografico_gra_m6


med_PerfilSociodemografico_gra_m7 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "7", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m7
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "7"), "gra"] <- med_PerfilSociodemografico_gra_m7


med_PerfilSociodemografico_gra_m8 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "8", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m8
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "8"), "gra"] <- med_PerfilSociodemografico_gra_m8


med_PerfilSociodemografico_gra_m9 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "9", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m9
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "9"), "gra"] <- med_PerfilSociodemografico_gra_m9


med_PerfilSociodemografico_gra_m11 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "11", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m11
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "11"), "gra"] <- med_PerfilSociodemografico_gra_m11


med_PerfilSociodemografico_gra_m12 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "12", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m12
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "12"), "gra"] <- med_PerfilSociodemografico_gra_m12

med_PerfilSociodemografico_gra_m13 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "13", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m13
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "13"), "gra"] <- med_PerfilSociodemografico_gra_m13

med_PerfilSociodemografico_gra_m14 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "14", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m14
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "14"), "gra"] <- med_PerfilSociodemografico_gra_m14

med_PerfilSociodemografico_gra_m15 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "15", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m15
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "15"), "gra"] <- med_PerfilSociodemografico_gra_m15


med_PerfilSociodemografico_gra_m16 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "16", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m16
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "16"), "gra"] <- med_PerfilSociodemografico_gra_m16


med_PerfilSociodemografico_gra_m17 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "17", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m17
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "17"), "gra"] <- med_PerfilSociodemografico_gra_m17


med_PerfilSociodemografico_gra_m20 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "20", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m20
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "20"), "gra"] <- med_PerfilSociodemografico_gra_m20

med_PerfilSociodemografico_gra_m22 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "22", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m22
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "22"), "gra"] <- med_PerfilSociodemografico_gra_m22

med_PerfilSociodemografico_gra_m23 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "23", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m23
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "23"), "gra"] <- med_PerfilSociodemografico_gra_m23

med_PerfilSociodemografico_gra_m24 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "24", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m24
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "24"), "gra"] <- med_PerfilSociodemografico_gra_m24

med_PerfilSociodemografico_gra_m25 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "25", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m25
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "25"), "gra"] <- med_PerfilSociodemografico_gra_m25

med_PerfilSociodemografico_gra_m28 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "28", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m28
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "28"), "gra"] <- med_PerfilSociodemografico_gra_m28

med_PerfilSociodemografico_gra_m29 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "29", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m29
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "29"), "gra"] <- med_PerfilSociodemografico_gra_m29

med_PerfilSociodemografico_gra_m30 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "30", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m30
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "30"), "gra"] <- med_PerfilSociodemografico_gra_m30

med_PerfilSociodemografico_gra_m31 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "31", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m31
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "31"), "gra"] <- med_PerfilSociodemografico_gra_m31

med_PerfilSociodemografico_gra_m33 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "33", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m33
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "33"), "gra"] <- med_PerfilSociodemografico_gra_m33

med_PerfilSociodemografico_gra_m34 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "34", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m34
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "34"), "gra"] <- med_PerfilSociodemografico_gra_m34

med_PerfilSociodemografico_gra_m35 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "35", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m35
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "35"), "gra"] <- med_PerfilSociodemografico_gra_m35

med_PerfilSociodemografico_gra_m36 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "36", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m36
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "36"), "gra"] <- med_PerfilSociodemografico_gra_m36

med_PerfilSociodemografico_gra_m37 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "37", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m37
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "37"), "gra"] <- med_PerfilSociodemografico_gra_m37

med_PerfilSociodemografico_gra_m38 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "38", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m38
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "38"), "gra"] <- med_PerfilSociodemografico_gra_m38

med_PerfilSociodemografico_gra_m39 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "39", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m39
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "39"), "gra"] <- med_PerfilSociodemografico_gra_m39

med_PerfilSociodemografico_gra_m44 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "44", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m44
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "44"), "gra"] <- med_PerfilSociodemografico_gra_m44

med_PerfilSociodemografico_gra_m46 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "46", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m46
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "46"), "gra"] <- med_PerfilSociodemografico_gra_m46

med_PerfilSociodemografico_gra_m50 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "50", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m50
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "50"), "gra"] <- med_PerfilSociodemografico_gra_m50

med_PerfilSociodemografico_gra_m53 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "53", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m53
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "53"), "gra"] <- med_PerfilSociodemografico_gra_m53

med_PerfilSociodemografico_gra_m57 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "57", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m57
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "57"), "gra"] <- med_PerfilSociodemografico_gra_m57

med_PerfilSociodemografico_gra_m58 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "58", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m58
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "58"), "gra"] <- med_PerfilSociodemografico_gra_m58

med_PerfilSociodemografico_gra_m59 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "59", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m59
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "59"), "gra"] <- med_PerfilSociodemografico_gra_m59

med_PerfilSociodemografico_gra_m60 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "60", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m60
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "60"), "gra"] <- med_PerfilSociodemografico_gra_m60

med_PerfilSociodemografico_gra_m61 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "61", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m61
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "61"), "gra"] <- med_PerfilSociodemografico_gra_m61

med_PerfilSociodemografico_gra_m65 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "65", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m65
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "65"), "gra"] <- med_PerfilSociodemografico_gra_m65

med_PerfilSociodemografico_gra_m68 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "68", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m68
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "68"), "gra"] <- med_PerfilSociodemografico_gra_m68

med_PerfilSociodemografico_gra_m69 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "69", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m69
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "69"), "gra"] <- med_PerfilSociodemografico_gra_m69

med_PerfilSociodemografico_gra_m70 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "70", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m70
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "70"), "gra"] <- med_PerfilSociodemografico_gra_m70

med_PerfilSociodemografico_gra_m75 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "75", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m75
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "75"), "gra"] <- med_PerfilSociodemografico_gra_m75

med_PerfilSociodemografico_gra_m81 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "81", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m81
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "81"), "gra"] <- med_PerfilSociodemografico_gra_m81

med_PerfilSociodemografico_gra_m83 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "83", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m83
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "83"), "gra"] <- med_PerfilSociodemografico_gra_m83

med_PerfilSociodemografico_gra_m84 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "84", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m84
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "84"), "gra"] <- med_PerfilSociodemografico_gra_m84

med_PerfilSociodemografico_gra_m89 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "89", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m89
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "89"), "gra"] <- med_PerfilSociodemografico_gra_m89

med_PerfilSociodemografico_gra_m91 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "91", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m91
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "91"), "gra"] <- med_PerfilSociodemografico_gra_m91

med_PerfilSociodemografico_gra_m92 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "92", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m92
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "92"), "gra"] <- med_PerfilSociodemografico_gra_m92

med_PerfilSociodemografico_gra_m93 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "93", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m93
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "93"), "gra"] <- med_PerfilSociodemografico_gra_m93

med_PerfilSociodemografico_gra_m94 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "94", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m94
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "94"), "gra"] <- med_PerfilSociodemografico_gra_m94

med_PerfilSociodemografico_gra_m95 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "95", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m95
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "95"), "gra"] <- med_PerfilSociodemografico_gra_m95

med_PerfilSociodemografico_gra_m96 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "96", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m96
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "96"), "gra"] <- med_PerfilSociodemografico_gra_m96

med_PerfilSociodemografico_gra_m99 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "99", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m99
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "99"), "gra"] <- med_PerfilSociodemografico_gra_m99

med_PerfilSociodemografico_gra_m100 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "100", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m100
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "100"), "gra"] <- med_PerfilSociodemografico_gra_m100

med_PerfilSociodemografico_gra_m103 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "103", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m103
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "103"), "gra"] <- med_PerfilSociodemografico_gra_m103

med_PerfilSociodemografico_gra_m104 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "104", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m104
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "104"), "gra"] <- med_PerfilSociodemografico_gra_m104

med_PerfilSociodemografico_gra_m108 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "108", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m108
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "108"), "gra"] <- med_PerfilSociodemografico_gra_m108

med_PerfilSociodemografico_gra_m109 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "109", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m109
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "109"), "gra"] <- med_PerfilSociodemografico_gra_m109

med_PerfilSociodemografico_gra_m112 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "112", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m112
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "112"), "gra"] <- med_PerfilSociodemografico_gra_m112

med_PerfilSociodemografico_gra_m120 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "120", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m120
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "120"), "gra"] <- med_PerfilSociodemografico_gra_m120

med_PerfilSociodemografico_gra_m121 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "121", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m121
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "121"), "gra"] <- med_PerfilSociodemografico_gra_m121

med_PerfilSociodemografico_gra_m122 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "122", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m122
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "122"), "gra"] <- med_PerfilSociodemografico_gra_m122

med_PerfilSociodemografico_gra_m125 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "125", "gra"], na.rm = T)
med_PerfilSociodemografico_gra_m125
PerfilSociodemografico[(is.na(PerfilSociodemografico$gra) & PerfilSociodemografico$mun == "125"), "gra"] <- med_PerfilSociodemografico_gra_m125

med_tsdem_p3_7_2 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "2", "p3_7"], na.rm = T)
PerfilSociodemografico[(is.na(PerfilSociodemografico$"p3_7") & PerfilSociodemografico$mun == "2"), "p3_7"] <- med_tsdem_p3_7_2

med_PerfilSociodemografico_p3_7_m10 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "10", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m10
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "10"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m10

med_PerfilSociodemografico_p3_7_m3 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "3", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m3
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "3"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m3


med_PerfilSociodemografico_p3_7_m4 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "4", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m4
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "4"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m4

med_PerfilSociodemografico_p3_7_m5 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "5", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m5
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "5"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m5


med_PerfilSociodemografico_p3_7_m6 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "6", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m6
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "6"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m6


med_PerfilSociodemografico_p3_7_m7 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "7", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m7
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "7"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m7


med_PerfilSociodemografico_p3_7_m8 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "8", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m8
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "8"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m8


med_PerfilSociodemografico_p3_7_m9 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "9", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m9
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "9"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m9


med_PerfilSociodemografico_p3_7_m11 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "11", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m11
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "11"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m11


med_PerfilSociodemografico_p3_7_m12 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "12", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m12
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "12"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m12

med_PerfilSociodemografico_p3_7_m13 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "13", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m13
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "13"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m13

med_PerfilSociodemografico_p3_7_m14 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "14", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m14
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "14"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m14

med_PerfilSociodemografico_p3_7_m15 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "15", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m15
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "15"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m15


med_PerfilSociodemografico_p3_7_m16 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "16", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m16
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "16"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m16


med_PerfilSociodemografico_p3_7_m17 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "17", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m17
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "17"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m17


med_PerfilSociodemografico_p3_7_m20 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "20", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m20
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "20"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m20

med_PerfilSociodemografico_p3_7_m22 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "22", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m22
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "22"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m22

med_PerfilSociodemografico_p3_7_m23 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "23", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m23
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "23"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m23

med_PerfilSociodemografico_p3_7_m24 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "24", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m24
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "24"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m24

med_PerfilSociodemografico_p3_7_m25 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "25", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m25
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "25"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m25

med_PerfilSociodemografico_p3_7_m28 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "28", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m28
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "28"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m28

med_PerfilSociodemografico_p3_7_m29 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "29", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m29
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "29"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m29

med_PerfilSociodemografico_p3_7_m30 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "30", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m30
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "30"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m30

med_PerfilSociodemografico_p3_7_m31 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "31", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m31
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "31"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m31

med_PerfilSociodemografico_p3_7_m33 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "33", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m33
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "33"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m33

med_PerfilSociodemografico_p3_7_m34 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "34", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m34
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "34"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m34

med_PerfilSociodemografico_p3_7_m35 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "35", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m35
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "35"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m35

med_PerfilSociodemografico_p3_7_m36 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "36", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m36
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "36"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m36

med_PerfilSociodemografico_p3_7_m37 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "37", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m37
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "37"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m37

med_PerfilSociodemografico_p3_7_m38 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "38", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m38
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "38"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m38

med_PerfilSociodemografico_p3_7_m39 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "39", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m39
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "39"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m39

med_PerfilSociodemografico_p3_7_m44 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "44", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m44
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "44"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m44

med_PerfilSociodemografico_p3_7_m46 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "46", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m46
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "46"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m46

med_PerfilSociodemografico_p3_7_m50 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "50", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m50
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "50"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m50

med_PerfilSociodemografico_p3_7_m53 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "53", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m53
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "53"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m53

med_PerfilSociodemografico_p3_7_m57 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "57", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m57
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "57"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m57

med_PerfilSociodemografico_p3_7_m58 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "58", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m58
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "58"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m58

med_PerfilSociodemografico_p3_7_m59 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "59", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m59
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "59"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m59

med_PerfilSociodemografico_p3_7_m60 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "60", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m60
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "60"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m60

med_PerfilSociodemografico_p3_7_m61 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "61", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m61
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "61"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m61

med_PerfilSociodemografico_p3_7_m65 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "65", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m65
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "65"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m65

med_PerfilSociodemografico_p3_7_m68 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "68", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m68
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "68"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m68

med_PerfilSociodemografico_p3_7_m69 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "69", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m69
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "69"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m69

med_PerfilSociodemografico_p3_7_m70 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "70", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m70
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "70"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m70

med_PerfilSociodemografico_p3_7_m75 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "75", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m75
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "75"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m75

med_PerfilSociodemografico_p3_7_m81 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "81", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m81
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "81"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m81

med_PerfilSociodemografico_p3_7_m83 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "83", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m83
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "83"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m83

med_PerfilSociodemografico_p3_7_m84 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "84", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m84
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "84"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m84

med_PerfilSociodemografico_p3_7_m89 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "89", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m89
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "89"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m89

med_PerfilSociodemografico_p3_7_m91 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "91", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m91
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "91"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m91

med_PerfilSociodemografico_p3_7_m92 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "92", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m92
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "92"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m92

med_PerfilSociodemografico_p3_7_m93 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "93", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m93
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "93"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m93

med_PerfilSociodemografico_p3_7_m94 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "94", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m94
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "94"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m94

med_PerfilSociodemografico_p3_7_m95 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "95", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m95
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "95"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m95

med_PerfilSociodemografico_p3_7_m96 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "96", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m96
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "96"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m96

med_PerfilSociodemografico_p3_7_m99 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "99", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m99
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "99"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m99

med_PerfilSociodemografico_p3_7_m100 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "100", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m100
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "100"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m100

med_PerfilSociodemografico_p3_7_m103 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "103", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m103
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "103"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m103

med_PerfilSociodemografico_p3_7_m104 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "104", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m104
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "104"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m104

med_PerfilSociodemografico_p3_7_m108 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "108", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m108
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "108"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m108

med_PerfilSociodemografico_p3_7_m109 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "109", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m109
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "109"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m109

med_PerfilSociodemografico_p3_7_m112 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "112", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m112
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "112"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m112

med_PerfilSociodemografico_p3_7_m120 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "120", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m120
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "120"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m120

med_PerfilSociodemografico_p3_7_m121 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "121", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m121
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "121"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m121

med_PerfilSociodemografico_p3_7_m122 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "122", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m122
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "122"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m122

med_PerfilSociodemografico_p3_7_m125 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "125", "p3_7"], na.rm = T)
med_PerfilSociodemografico_p3_7_m125
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_7) & PerfilSociodemografico$mun == "125"), "p3_7"] <- med_PerfilSociodemografico_p3_7_m125



med_tsdem_p3_8_2 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "2", "p3_8"], na.rm = T)
PerfilSociodemografico[(is.na(PerfilSociodemografico$"p3_8") & PerfilSociodemografico$mun == "2"), "p3_8"] <- med_tsdem_p3_8_2

med_PerfilSociodemografico_p3_8_m10 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "10", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m10
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "10"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m10

med_PerfilSociodemografico_p3_8_m3 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "3", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m3
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "3"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m3


med_PerfilSociodemografico_p3_8_m4 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "4", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m4
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "4"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m4

med_PerfilSociodemografico_p3_8_m5 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "5", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m5
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "5"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m5


med_PerfilSociodemografico_p3_8_m6 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "6", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m6
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "6"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m6


med_PerfilSociodemografico_p3_8_m7 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "7", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m7
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "7"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m7


med_PerfilSociodemografico_p3_8_m8 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "8", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m8
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "8"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m8


med_PerfilSociodemografico_p3_8_m9 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "9", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m9
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "9"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m9


med_PerfilSociodemografico_p3_8_m11 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "11", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m11
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "11"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m11


med_PerfilSociodemografico_p3_8_m12 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "12", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m12
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "12"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m12

med_PerfilSociodemografico_p3_8_m13 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "13", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m13
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "13"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m13

med_PerfilSociodemografico_p3_8_m14 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "14", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m14
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "14"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m14

med_PerfilSociodemografico_p3_8_m15 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "15", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m15
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "15"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m15


med_PerfilSociodemografico_p3_8_m16 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "16", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m16
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "16"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m16


med_PerfilSociodemografico_p3_8_m17 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "17", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m17
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "17"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m17


med_PerfilSociodemografico_p3_8_m20 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "20", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m20
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "20"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m20

med_PerfilSociodemografico_p3_8_m22 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "22", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m22
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "22"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m22

med_PerfilSociodemografico_p3_8_m23 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "23", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m23
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "23"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m23

med_PerfilSociodemografico_p3_8_m24 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "24", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m24
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "24"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m24

med_PerfilSociodemografico_p3_8_m25 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "25", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m25
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "25"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m25

med_PerfilSociodemografico_p3_8_m28 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "28", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m28
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "28"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m28

med_PerfilSociodemografico_p3_8_m29 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "29", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m29
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "29"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m29

med_PerfilSociodemografico_p3_8_m30 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "30", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m30
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "30"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m30

med_PerfilSociodemografico_p3_8_m31 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "31", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m31
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "31"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m31

med_PerfilSociodemografico_p3_8_m33 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "33", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m33
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "33"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m33

med_PerfilSociodemografico_p3_8_m34 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "34", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m34
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "34"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m34

med_PerfilSociodemografico_p3_8_m35 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "35", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m35
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "35"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m35

med_PerfilSociodemografico_p3_8_m36 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "36", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m36
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "36"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m36

med_PerfilSociodemografico_p3_8_m37 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "37", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m37
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "37"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m37

med_PerfilSociodemografico_p3_8_m38 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "38", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m38
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "38"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m38

med_PerfilSociodemografico_p3_8_m39 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "39", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m39
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "39"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m39

med_PerfilSociodemografico_p3_8_m44 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "44", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m44
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "44"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m44

med_PerfilSociodemografico_p3_8_m46 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "46", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m46
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "46"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m46

med_PerfilSociodemografico_p3_8_m50 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "50", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m50
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "50"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m50

med_PerfilSociodemografico_p3_8_m53 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "53", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m53
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "53"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m53

med_PerfilSociodemografico_p3_8_m57 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "57", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m57
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "57"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m57

med_PerfilSociodemografico_p3_8_m58 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "58", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m58
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "58"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m58

med_PerfilSociodemografico_p3_8_m59 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "59", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m59
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "59"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m59

med_PerfilSociodemografico_p3_8_m60 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "60", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m60
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "60"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m60

med_PerfilSociodemografico_p3_8_m61 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "61", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m61
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "61"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m61

med_PerfilSociodemografico_p3_8_m65 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "65", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m65
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "65"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m65

med_PerfilSociodemografico_p3_8_m68 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "68", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m68
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "68"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m68

med_PerfilSociodemografico_p3_8_m69 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "69", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m69
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "69"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m69

med_PerfilSociodemografico_p3_8_m70 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "70", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m70
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "70"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m70

med_PerfilSociodemografico_p3_8_m75 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "75", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m75
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "75"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m75

med_PerfilSociodemografico_p3_8_m81 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "81", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m81
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "81"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m81

med_PerfilSociodemografico_p3_8_m83 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "83", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m83
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "83"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m83

med_PerfilSociodemografico_p3_8_m84 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "84", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m84
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "84"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m84

med_PerfilSociodemografico_p3_8_m89 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "89", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m89
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "89"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m89

med_PerfilSociodemografico_p3_8_m91 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "91", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m91
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "91"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m91

med_PerfilSociodemografico_p3_8_m92 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "92", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m92
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "92"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m92

med_PerfilSociodemografico_p3_8_m93 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "93", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m93
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "93"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m93

med_PerfilSociodemografico_p3_8_m94 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "94", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m94
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "94"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m94

med_PerfilSociodemografico_p3_8_m95 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "95", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m95
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "95"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m95

med_PerfilSociodemografico_p3_8_m96 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "96", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m96
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "96"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m96

med_PerfilSociodemografico_p3_8_m99 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "99", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m99
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "99"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m99

med_PerfilSociodemografico_p3_8_m100 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "100", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m100
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "100"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m100

med_PerfilSociodemografico_p3_8_m103 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "103", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m103
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "103"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m103

med_PerfilSociodemografico_p3_8_m104 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "104", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m104
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "104"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m104

med_PerfilSociodemografico_p3_8_m108 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "108", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m108
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "108"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m108

med_PerfilSociodemografico_p3_8_m109 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "109", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m109
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "109"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m109

med_PerfilSociodemografico_p3_8_m112 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "112", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m112
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "112"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m112

med_PerfilSociodemografico_p3_8_m120 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "120", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m120
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "120"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m120

med_PerfilSociodemografico_p3_8_m121 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "121", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m121
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "121"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m121

med_PerfilSociodemografico_p3_8_m122 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "122", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m122
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "122"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m122

med_PerfilSociodemografico_p3_8_m125 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "125", "p3_8"], na.rm = T)
med_PerfilSociodemografico_p3_8_m125
PerfilSociodemografico[(is.na(PerfilSociodemografico$p3_8) & PerfilSociodemografico$mun == "125"), "p3_8"] <- med_PerfilSociodemografico_p3_8_m125



med_tsdem_p4_2_2 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "2", "p4_2"], na.rm = T)
PerfilSociodemografico[(is.na(PerfilSociodemografico$"p4_2") & PerfilSociodemografico$mun == "2"), "p4_2"] <- med_tsdem_p4_2_2

med_PerfilSociodemografico_p4_2_m10 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "10", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m10
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "10"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m10

med_PerfilSociodemografico_p4_2_m3 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "3", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m3
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "3"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m3


med_PerfilSociodemografico_p4_2_m4 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "4", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m4
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "4"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m4

med_PerfilSociodemografico_p4_2_m5 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "5", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m5
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "5"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m5


med_PerfilSociodemografico_p4_2_m6 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "6", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m6
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "6"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m6


med_PerfilSociodemografico_p4_2_m7 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "7", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m7
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "7"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m7


med_PerfilSociodemografico_p4_2_m8 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "8", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m8
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "8"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m8


med_PerfilSociodemografico_p4_2_m9 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "9", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m9
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "9"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m9


med_PerfilSociodemografico_p4_2_m11 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "11", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m11
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "11"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m11


med_PerfilSociodemografico_p4_2_m12 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "12", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m12
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "12"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m12

med_PerfilSociodemografico_p4_2_m13 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "13", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m13
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "13"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m13

med_PerfilSociodemografico_p4_2_m14 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "14", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m14
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "14"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m14

med_PerfilSociodemografico_p4_2_m15 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "15", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m15
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "15"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m15


med_PerfilSociodemografico_p4_2_m16 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "16", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m16
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "16"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m16


med_PerfilSociodemografico_p4_2_m17 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "17", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m17
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "17"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m17


med_PerfilSociodemografico_p4_2_m20 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "20", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m20
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "20"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m20

med_PerfilSociodemografico_p4_2_m22 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "22", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m22
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "22"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m22

med_PerfilSociodemografico_p4_2_m23 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "23", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m23
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "23"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m23

med_PerfilSociodemografico_p4_2_m24 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "24", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m24
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "24"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m24

med_PerfilSociodemografico_p4_2_m25 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "25", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m25
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "25"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m25

med_PerfilSociodemografico_p4_2_m28 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "28", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m28
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "28"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m28

med_PerfilSociodemografico_p4_2_m29 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "29", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m29
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "29"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m29

med_PerfilSociodemografico_p4_2_m30 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "30", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m30
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "30"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m30

med_PerfilSociodemografico_p4_2_m31 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "31", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m31
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "31"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m31

med_PerfilSociodemografico_p4_2_m33 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "33", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m33
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "33"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m33

med_PerfilSociodemografico_p4_2_m34 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "34", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m34
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "34"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m34

med_PerfilSociodemografico_p4_2_m35 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "35", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m35
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "35"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m35

med_PerfilSociodemografico_p4_2_m36 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "36", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m36
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "36"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m36

med_PerfilSociodemografico_p4_2_m37 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "37", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m37
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "37"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m37

med_PerfilSociodemografico_p4_2_m38 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "38", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m38
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "38"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m38

med_PerfilSociodemografico_p4_2_m39 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "39", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m39
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "39"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m39

med_PerfilSociodemografico_p4_2_m44 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "44", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m44
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "44"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m44

med_PerfilSociodemografico_p4_2_m46 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "46", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m46
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "46"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m46

med_PerfilSociodemografico_p4_2_m50 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "50", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m50
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "50"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m50

med_PerfilSociodemografico_p4_2_m53 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "53", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m53
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "53"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m53

med_PerfilSociodemografico_p4_2_m57 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "57", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m57
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "57"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m57

med_PerfilSociodemografico_p4_2_m58 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "58", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m58
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "58"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m58

med_PerfilSociodemografico_p4_2_m59 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "59", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m59
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "59"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m59

med_PerfilSociodemografico_p4_2_m60 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "60", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m60
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "60"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m60

med_PerfilSociodemografico_p4_2_m61 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "61", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m61
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "61"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m61

med_PerfilSociodemografico_p4_2_m65 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "65", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m65
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "65"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m65

med_PerfilSociodemografico_p4_2_m68 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "68", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m68
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "68"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m68

med_PerfilSociodemografico_p4_2_m69 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "69", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m69
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "69"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m69

med_PerfilSociodemografico_p4_2_m70 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "70", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m70
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "70"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m70

med_PerfilSociodemografico_p4_2_m75 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "75", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m75
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "75"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m75

med_PerfilSociodemografico_p4_2_m81 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "81", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m81
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "81"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m81

med_PerfilSociodemografico_p4_2_m83 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "83", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m83
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "83"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m83

med_PerfilSociodemografico_p4_2_m84 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "84", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m84
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "84"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m84

med_PerfilSociodemografico_p4_2_m89 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "89", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m89
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "89"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m89

med_PerfilSociodemografico_p4_2_m91 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "91", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m91
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "91"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m91

med_PerfilSociodemografico_p4_2_m92 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "92", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m92
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "92"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m92

med_PerfilSociodemografico_p4_2_m93 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "93", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m93
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "93"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m93

med_PerfilSociodemografico_p4_2_m94 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "94", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m94
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "94"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m94

med_PerfilSociodemografico_p4_2_m95 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "95", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m95
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "95"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m95

med_PerfilSociodemografico_p4_2_m96 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "96", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m96
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "96"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m96

med_PerfilSociodemografico_p4_2_m99 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "99", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m99
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "99"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m99

med_PerfilSociodemografico_p4_2_m100 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "100", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m100
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "100"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m100

med_PerfilSociodemografico_p4_2_m103 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "103", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m103
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "103"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m103

med_PerfilSociodemografico_p4_2_m104 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "104", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m104
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "104"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m104

med_PerfilSociodemografico_p4_2_m108 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "108", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m108
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "108"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m108

med_PerfilSociodemografico_p4_2_m109 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "109", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m109
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "109"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m109

med_PerfilSociodemografico_p4_2_m112 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "112", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m112
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "112"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m112

med_PerfilSociodemografico_p4_2_m120 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "120", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m120
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "120"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m120

med_PerfilSociodemografico_p4_2_m121 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "121", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m121
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "121"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m121

med_PerfilSociodemografico_p4_2_m122 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "122", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m122
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "122"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m122

med_PerfilSociodemografico_p4_2_m125 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "125", "p4_2"], na.rm = T)
med_PerfilSociodemografico_p4_2_m125
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_2) & PerfilSociodemografico$mun == "125"), "p4_2"] <- med_PerfilSociodemografico_p4_2_m125




med_tsdem_p4_3_2 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "2", "p4_3"], na.rm = T)
PerfilSociodemografico[(is.na(PerfilSociodemografico$"p4_3") & PerfilSociodemografico$mun == "2"), "p4_3"] <- med_tsdem_p4_3_2

med_PerfilSociodemografico_p4_3_m10 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "10", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m10
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "10"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m10

med_PerfilSociodemografico_p4_3_m3 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "3", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m3
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "3"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m3


med_PerfilSociodemografico_p4_3_m4 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "4", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m4
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "4"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m4

med_PerfilSociodemografico_p4_3_m5 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "5", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m5
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "5"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m5


med_PerfilSociodemografico_p4_3_m6 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "6", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m6
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "6"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m6


med_PerfilSociodemografico_p4_3_m7 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "7", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m7
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "7"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m7


med_PerfilSociodemografico_p4_3_m8 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "8", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m8
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "8"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m8


med_PerfilSociodemografico_p4_3_m9 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "9", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m9
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "9"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m9


med_PerfilSociodemografico_p4_3_m11 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "11", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m11
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "11"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m11


med_PerfilSociodemografico_p4_3_m12 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "12", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m12
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "12"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m12

med_PerfilSociodemografico_p4_3_m13 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "13", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m13
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "13"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m13

med_PerfilSociodemografico_p4_3_m14 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "14", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m14
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "14"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m14

med_PerfilSociodemografico_p4_3_m15 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "15", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m15
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "15"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m15


med_PerfilSociodemografico_p4_3_m16 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "16", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m16
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "16"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m16


med_PerfilSociodemografico_p4_3_m17 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "17", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m17
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "17"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m17


med_PerfilSociodemografico_p4_3_m20 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "20", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m20
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "20"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m20

med_PerfilSociodemografico_p4_3_m22 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "22", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m22
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "22"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m22

med_PerfilSociodemografico_p4_3_m23 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "23", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m23
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "23"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m23

med_PerfilSociodemografico_p4_3_m24 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "24", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m24
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "24"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m24

med_PerfilSociodemografico_p4_3_m25 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "25", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m25
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "25"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m25

med_PerfilSociodemografico_p4_3_m28 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "28", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m28
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "28"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m28

med_PerfilSociodemografico_p4_3_m29 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "29", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m29
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "29"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m29

med_PerfilSociodemografico_p4_3_m30 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "30", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m30
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "30"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m30

med_PerfilSociodemografico_p4_3_m31 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "31", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m31
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "31"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m31

med_PerfilSociodemografico_p4_3_m33 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "33", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m33
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "33"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m33

med_PerfilSociodemografico_p4_3_m34 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "34", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m34
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "34"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m34

med_PerfilSociodemografico_p4_3_m35 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "35", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m35
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "35"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m35

med_PerfilSociodemografico_p4_3_m36 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "36", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m36
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "36"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m36

med_PerfilSociodemografico_p4_3_m37 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "37", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m37
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "37"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m37

med_PerfilSociodemografico_p4_3_m38 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "38", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m38
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "38"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m38

med_PerfilSociodemografico_p4_3_m39 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "39", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m39
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "39"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m39

med_PerfilSociodemografico_p4_3_m44 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "44", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m44
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "44"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m44

med_PerfilSociodemografico_p4_3_m46 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "46", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m46
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "46"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m46

med_PerfilSociodemografico_p4_3_m50 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "50", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m50
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "50"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m50

med_PerfilSociodemografico_p4_3_m53 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "53", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m53
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "53"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m53

med_PerfilSociodemografico_p4_3_m57 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "57", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m57
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "57"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m57

med_PerfilSociodemografico_p4_3_m58 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "58", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m58
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "58"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m58

med_PerfilSociodemografico_p4_3_m59 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "59", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m59
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "59"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m59

med_PerfilSociodemografico_p4_3_m60 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "60", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m60
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "60"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m60

med_PerfilSociodemografico_p4_3_m61 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "61", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m61
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "61"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m61

med_PerfilSociodemografico_p4_3_m65 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "65", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m65
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "65"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m65

med_PerfilSociodemografico_p4_3_m68 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "68", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m68
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "68"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m68

med_PerfilSociodemografico_p4_3_m69 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "69", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m69
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "69"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m69

med_PerfilSociodemografico_p4_3_m70 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "70", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m70
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "70"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m70

med_PerfilSociodemografico_p4_3_m75 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "75", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m75
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "75"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m75

med_PerfilSociodemografico_p4_3_m81 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "81", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m81
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "81"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m81

med_PerfilSociodemografico_p4_3_m83 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "83", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m83
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "83"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m83

med_PerfilSociodemografico_p4_3_m84 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "84", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m84
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "84"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m84

med_PerfilSociodemografico_p4_3_m89 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "89", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m89
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "89"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m89

med_PerfilSociodemografico_p4_3_m91 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "91", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m91
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "91"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m91

med_PerfilSociodemografico_p4_3_m92 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "92", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m92
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "92"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m92

med_PerfilSociodemografico_p4_3_m93 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "93", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m93
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "93"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m93

med_PerfilSociodemografico_p4_3_m94 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "94", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m94
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "94"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m94

med_PerfilSociodemografico_p4_3_m95 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "95", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m95
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "95"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m95

med_PerfilSociodemografico_p4_3_m96 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "96", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m96
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "96"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m96

med_PerfilSociodemografico_p4_3_m99 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "99", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m99
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "99"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m99

med_PerfilSociodemografico_p4_3_m100 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "100", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m100
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "100"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m100

med_PerfilSociodemografico_p4_3_m103 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "103", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m103
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "103"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m103

med_PerfilSociodemografico_p4_3_m104 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "104", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m104
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "104"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m104

med_PerfilSociodemografico_p4_3_m108 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "108", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m108
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "108"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m108

med_PerfilSociodemografico_p4_3_m109 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "109", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m109
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "109"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m109

med_PerfilSociodemografico_p4_3_m112 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "112", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m112
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "112"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m112

med_PerfilSociodemografico_p4_3_m120 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "120", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m120
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "120"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m120

med_PerfilSociodemografico_p4_3_m121 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "121", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m121
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "121"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m121

med_PerfilSociodemografico_p4_3_m122 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "122", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m122
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "122"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m122

med_PerfilSociodemografico_p4_3_m125 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "125", "p4_3"], na.rm = T)
med_PerfilSociodemografico_p4_3_m125
PerfilSociodemografico[(is.na(PerfilSociodemografico$p4_3) & PerfilSociodemografico$mun == "125"), "p4_3"] <- med_PerfilSociodemografico_p4_3_m125



med_tsdem_p5_4_2 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "2", "p5_4"], na.rm = T)
PerfilSociodemografico[(is.na(PerfilSociodemografico$"p5_4") & PerfilSociodemografico$mun == "2"), "p5_4"] <- med_tsdem_p5_4_2

med_PerfilSociodemografico_p5_4_m10 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "10", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m10
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "10"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m10

med_PerfilSociodemografico_p5_4_m3 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "3", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m3
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "3"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m3


med_PerfilSociodemografico_p5_4_m4 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "4", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m4
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "4"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m4

med_PerfilSociodemografico_p5_4_m5 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "5", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m5
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "5"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m5


med_PerfilSociodemografico_p5_4_m6 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "6", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m6
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "6"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m6


med_PerfilSociodemografico_p5_4_m7 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "7", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m7
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "7"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m7


med_PerfilSociodemografico_p5_4_m8 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "8", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m8
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "8"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m8


med_PerfilSociodemografico_p5_4_m9 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "9", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m9
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "9"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m9


med_PerfilSociodemografico_p5_4_m11 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "11", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m11
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "11"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m11


med_PerfilSociodemografico_p5_4_m12 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "12", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m12
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "12"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m12

med_PerfilSociodemografico_p5_4_m13 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "13", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m13
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "13"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m13

med_PerfilSociodemografico_p5_4_m14 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "14", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m14
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "14"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m14

med_PerfilSociodemografico_p5_4_m15 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "15", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m15
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "15"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m15


med_PerfilSociodemografico_p5_4_m16 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "16", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m16
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "16"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m16


med_PerfilSociodemografico_p5_4_m17 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "17", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m17
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "17"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m17


med_PerfilSociodemografico_p5_4_m20 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "20", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m20
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "20"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m20

med_PerfilSociodemografico_p5_4_m22 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "22", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m22
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "22"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m22

med_PerfilSociodemografico_p5_4_m23 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "23", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m23
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "23"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m23

med_PerfilSociodemografico_p5_4_m24 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "24", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m24
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "24"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m24

med_PerfilSociodemografico_p5_4_m25 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "25", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m25
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "25"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m25

med_PerfilSociodemografico_p5_4_m28 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "28", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m28
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "28"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m28

med_PerfilSociodemografico_p5_4_m29 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "29", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m29
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "29"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m29

med_PerfilSociodemografico_p5_4_m30 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "30", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m30
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "30"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m30

med_PerfilSociodemografico_p5_4_m31 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "31", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m31
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "31"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m31

med_PerfilSociodemografico_p5_4_m33 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "33", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m33
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "33"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m33

med_PerfilSociodemografico_p5_4_m34 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "34", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m34
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "34"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m34

med_PerfilSociodemografico_p5_4_m35 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "35", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m35
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "35"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m35

med_PerfilSociodemografico_p5_4_m36 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "36", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m36
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "36"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m36

med_PerfilSociodemografico_p5_4_m37 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "37", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m37
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "37"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m37

med_PerfilSociodemografico_p5_4_m38 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "38", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m38
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "38"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m38

med_PerfilSociodemografico_p5_4_m39 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "39", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m39
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "39"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m39

med_PerfilSociodemografico_p5_4_m44 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "44", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m44
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "44"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m44

med_PerfilSociodemografico_p5_4_m46 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "46", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m46
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "46"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m46

med_PerfilSociodemografico_p5_4_m50 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "50", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m50
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "50"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m50

med_PerfilSociodemografico_p5_4_m53 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "53", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m53
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "53"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m53

med_PerfilSociodemografico_p5_4_m57 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "57", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m57
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "57"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m57

med_PerfilSociodemografico_p5_4_m58 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "58", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m58
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "58"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m58

med_PerfilSociodemografico_p5_4_m59 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "59", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m59
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "59"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m59

med_PerfilSociodemografico_p5_4_m60 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "60", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m60
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "60"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m60

med_PerfilSociodemografico_p5_4_m61 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "61", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m61
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "61"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m61

med_PerfilSociodemografico_p5_4_m65 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "65", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m65
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "65"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m65

med_PerfilSociodemografico_p5_4_m68 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "68", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m68
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "68"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m68

med_PerfilSociodemografico_p5_4_m69 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "69", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m69
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "69"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m69

med_PerfilSociodemografico_p5_4_m70 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "70", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m70
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "70"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m70

med_PerfilSociodemografico_p5_4_m75 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "75", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m75
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "75"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m75

med_PerfilSociodemografico_p5_4_m81 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "81", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m81
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "81"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m81

med_PerfilSociodemografico_p5_4_m83 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "83", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m83
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "83"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m83

med_PerfilSociodemografico_p5_4_m84 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "84", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m84
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "84"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m84

med_PerfilSociodemografico_p5_4_m89 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "89", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m89
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "89"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m89

med_PerfilSociodemografico_p5_4_m91 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "91", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m91
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "91"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m91

med_PerfilSociodemografico_p5_4_m92 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "92", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m92
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "92"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m92

med_PerfilSociodemografico_p5_4_m93 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "93", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m93
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "93"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m93

med_PerfilSociodemografico_p5_4_m94 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "94", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m94
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "94"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m94

med_PerfilSociodemografico_p5_4_m95 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "95", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m95
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "95"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m95

med_PerfilSociodemografico_p5_4_m96 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "96", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m96
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "96"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m96

med_PerfilSociodemografico_p5_4_m99 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "99", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m99
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "99"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m99

med_PerfilSociodemografico_p5_4_m100 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "100", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m100
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "100"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m100

med_PerfilSociodemografico_p5_4_m103 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "103", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m103
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "103"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m103

med_PerfilSociodemografico_p5_4_m104 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "104", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m104
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "104"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m104

med_PerfilSociodemografico_p5_4_m108 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "108", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m108
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "108"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m108

med_PerfilSociodemografico_p5_4_m109 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "109", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m109
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "109"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m109

med_PerfilSociodemografico_p5_4_m112 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "112", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m112
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "112"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m112

med_PerfilSociodemografico_p5_4_m120 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "120", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m120
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "120"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m120

med_PerfilSociodemografico_p5_4_m121 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "121", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m121
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "121"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m121

med_PerfilSociodemografico_p5_4_m122 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "122", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m122
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "122"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m122

med_PerfilSociodemografico_p5_4_m125 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "125", "p5_4"], na.rm = T)
med_PerfilSociodemografico_p5_4_m125
PerfilSociodemografico[(is.na(PerfilSociodemografico$p5_4) & PerfilSociodemografico$mun == "125"), "p5_4"] <- med_PerfilSociodemografico_p5_4_m125




med_tsdem_p6_4_2 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "2", "p6_4"], na.rm = T)
PerfilSociodemografico[(is.na(PerfilSociodemografico$"p6_4") & PerfilSociodemografico$mun == "2"), "p6_4"] <- med_tsdem_p6_4_2

med_PerfilSociodemografico_p6_4_m10 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "10", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m10
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "10"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m10

med_PerfilSociodemografico_p6_4_m3 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "3", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m3
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "3"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m3


med_PerfilSociodemografico_p6_4_m4 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "4", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m4
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "4"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m4

med_PerfilSociodemografico_p6_4_m5 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "5", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m5
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "5"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m5


med_PerfilSociodemografico_p6_4_m6 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "6", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m6
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "6"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m6


med_PerfilSociodemografico_p6_4_m7 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "7", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m7
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "7"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m7


med_PerfilSociodemografico_p6_4_m8 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "8", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m8
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "8"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m8


med_PerfilSociodemografico_p6_4_m9 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "9", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m9
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "9"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m9


med_PerfilSociodemografico_p6_4_m11 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "11", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m11
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "11"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m11


med_PerfilSociodemografico_p6_4_m12 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "12", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m12
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "12"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m12

med_PerfilSociodemografico_p6_4_m13 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "13", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m13
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "13"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m13

med_PerfilSociodemografico_p6_4_m14 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "14", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m14
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "14"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m14

med_PerfilSociodemografico_p6_4_m15 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "15", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m15
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "15"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m15


med_PerfilSociodemografico_p6_4_m16 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "16", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m16
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "16"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m16


med_PerfilSociodemografico_p6_4_m17 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "17", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m17
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "17"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m17


med_PerfilSociodemografico_p6_4_m20 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "20", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m20
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "20"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m20

med_PerfilSociodemografico_p6_4_m22 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "22", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m22
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "22"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m22

med_PerfilSociodemografico_p6_4_m23 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "23", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m23
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "23"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m23

med_PerfilSociodemografico_p6_4_m24 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "24", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m24
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "24"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m24

med_PerfilSociodemografico_p6_4_m25 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "25", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m25
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "25"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m25

med_PerfilSociodemografico_p6_4_m28 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "28", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m28
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "28"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m28

med_PerfilSociodemografico_p6_4_m29 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "29", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m29
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "29"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m29

med_PerfilSociodemografico_p6_4_m30 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "30", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m30
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "30"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m30

med_PerfilSociodemografico_p6_4_m31 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "31", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m31
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "31"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m31

med_PerfilSociodemografico_p6_4_m33 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "33", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m33
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "33"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m33

med_PerfilSociodemografico_p6_4_m34 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "34", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m34
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "34"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m34

med_PerfilSociodemografico_p6_4_m35 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "35", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m35
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "35"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m35

med_PerfilSociodemografico_p6_4_m36 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "36", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m36
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "36"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m36

med_PerfilSociodemografico_p6_4_m37 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "37", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m37
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "37"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m37

med_PerfilSociodemografico_p6_4_m38 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "38", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m38
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "38"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m38

med_PerfilSociodemografico_p6_4_m39 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "39", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m39
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "39"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m39

med_PerfilSociodemografico_p6_4_m44 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "44", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m44
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "44"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m44

med_PerfilSociodemografico_p6_4_m46 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "46", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m46
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "46"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m46

med_PerfilSociodemografico_p6_4_m50 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "50", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m50
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "50"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m50

med_PerfilSociodemografico_p6_4_m53 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "53", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m53
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "53"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m53

med_PerfilSociodemografico_p6_4_m57 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "57", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m57
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "57"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m57

med_PerfilSociodemografico_p6_4_m58 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "58", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m58
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "58"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m58

med_PerfilSociodemografico_p6_4_m59 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "59", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m59
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "59"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m59

med_PerfilSociodemografico_p6_4_m60 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "60", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m60
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "60"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m60

med_PerfilSociodemografico_p6_4_m61 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "61", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m61
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "61"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m61

med_PerfilSociodemografico_p6_4_m65 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "65", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m65
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "65"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m65

med_PerfilSociodemografico_p6_4_m68 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "68", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m68
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "68"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m68

med_PerfilSociodemografico_p6_4_m69 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "69", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m69
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "69"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m69

med_PerfilSociodemografico_p6_4_m70 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "70", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m70
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "70"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m70

med_PerfilSociodemografico_p6_4_m75 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "75", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m75
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "75"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m75

med_PerfilSociodemografico_p6_4_m81 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "81", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m81
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "81"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m81

med_PerfilSociodemografico_p6_4_m83 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "83", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m83
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "83"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m83

med_PerfilSociodemografico_p6_4_m84 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "84", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m84
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "84"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m84

med_PerfilSociodemografico_p6_4_m89 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "89", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m89
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "89"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m89

med_PerfilSociodemografico_p6_4_m91 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "91", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m91
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "91"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m91

med_PerfilSociodemografico_p6_4_m92 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "92", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m92
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "92"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m92

med_PerfilSociodemografico_p6_4_m93 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "93", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m93
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "93"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m93

med_PerfilSociodemografico_p6_4_m94 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "94", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m94
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "94"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m94

med_PerfilSociodemografico_p6_4_m95 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "95", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m95
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "95"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m95

med_PerfilSociodemografico_p6_4_m96 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "96", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m96
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "96"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m96

med_PerfilSociodemografico_p6_4_m99 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "99", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m99
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "99"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m99

med_PerfilSociodemografico_p6_4_m100 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "100", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m100
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "100"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m100

med_PerfilSociodemografico_p6_4_m103 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "103", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m103
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "103"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m103

med_PerfilSociodemografico_p6_4_m104 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "104", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m104
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "104"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m104

med_PerfilSociodemografico_p6_4_m108 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "108", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m108
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "108"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m108

med_PerfilSociodemografico_p6_4_m109 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "109", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m109
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "109"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m109

med_PerfilSociodemografico_p6_4_m112 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "112", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m112
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "112"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m112

med_PerfilSociodemografico_p6_4_m120 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "120", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m120
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "120"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m120

med_PerfilSociodemografico_p6_4_m121 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "121", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m121
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "121"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m121

med_PerfilSociodemografico_p6_4_m122 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "122", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m122
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "122"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m122

med_PerfilSociodemografico_p6_4_m125 <- median(PerfilSociodemografico[PerfilSociodemografico$mun == "125", "p6_4"], na.rm = T)
med_PerfilSociodemografico_p6_4_m125
PerfilSociodemografico[(is.na(PerfilSociodemografico$p6_4) & PerfilSociodemografico$mun == "125"), "p6_4"] <- med_PerfilSociodemografico_p6_4_m125



```

#### Chcear otra vez la base de datos

```{r}
head(PerfilSociodemografico)
tail(PerfilSociodemografico)
str(PerfilSociodemografico)
summary(PerfilSociodemografico)

PerfilSociodemografico[!complete.cases(PerfilSociodemografico),]

```


### Explorar base de datos Viajes

```{r}
head(Viajes)
tail(Viajes)
str(Viajes)
summary(Viajes)

Viajes$p5_15_15 <- as.numeric(Viajes$p5_15_15)
Viajes$p5_15_16 <- as.numeric(Viajes$p5_15_16)
Viajes$p5_15_17 <- as.numeric(Viajes$p5_15_17)
Viajes$p5_15_19 <- as.numeric(Viajes$p5_15_19)
Viajes$p5_15_20 <- as.numeric(Viajes$p5_15_20)
Viajes$p5_19 <- as.numeric(Viajes$p5_19)
Viajes$p5_21_1 <- as.numeric(Viajes$p5_21_1)
Viajes$p5_21_2 <- as.numeric(Viajes$p5_21_2)
Viajes$p5_23 <- as.numeric(Viajes$p5_23)
Viajes$p5_26 <- as.numeric(Viajes$p5_26)

str(Viajes)

Viajes[!complete.cases(Viajes),]
```

### Explorar base de datos Transporte

```{r}
head(Transporte)
tail(Transporte)
str(Transporte)
summary(Transporte)

Transporte$p5_16_1_1 <- as.numeric(Transporte$p5_16_1_1)
Transporte$p5_16_1_2 <- as.numeric(Transporte$p5_16_1_2)
Transporte$p5_16_2 <- as.numeric(Transporte$p5_16_2)
str(Transporte)

Transporte[!complete.cases(Transporte),]

```


#### En p5_16_2 que es la pregunta der cuanto gasto en el transporte que utilizo respondido en p5_14. Voy a sustituir los NAs con la mediana del gasto que incurren dependiendo del modo de transporte que usaron. Es decir saco la mediana del gasto que incurren los que contestaron que usaron el medio de transporte 14 en la pregunta p5_14 y sustituyo esa mediana dentro de los que tengan NA y usaron el medio de transporte 14 igual.

```{r}
str(Transporte)
```
##### Aqui vemos que p5_14 es un integer y lo necesitamos como factor para poder saber los distintos tipos de transporte.

```{r}
Transporte$p5_14 <- as.factor(Transporte$p5_14)

levels(Transporte$p5_14)
```

##### Hay 20 tipos de transporte

```{r}
med_Transporte_gasto_1 <- median(Transporte[Transporte$p5_14 == "1", "p5_16_2"], na.rm = T)
med_Transporte_gasto_1
```
##### La mediana es 0 entonces aqui mejor voy a usar la media. Aunque la media sea mas sensible con los outliers es mejor que poner que gastan 0 en el transporte que usan. Siento que puede ser un error que no gaste nada en su transporte.


```{r}
prom_Transporte_gasto_1 <- mean(Transporte[Transporte$p5_14 == "1", "p5_16_2"], na.rm = T)
prom_Transporte_gasto_1

Transporte[(is.na(Transporte$p5_16_2) & Transporte$p5_14 == "1"), "p5_16_2"] <- prom_Transporte_gasto_1
```

##### En los demas si voy a intentar que sea la mediana
```{r}
med_Transporte_gasto_2 <- median(Transporte[Transporte$p5_14 == "2", "p5_16_2"], na.rm = T)
med_Transporte_gasto_2
Transporte[(is.na(Transporte$p5_16_2) & Transporte$p5_14 == "2"), "p5_16_2"] <- med_Transporte_gasto_2

med_Transporte_gasto_3 <- median(Transporte[Transporte$p5_14 == "3", "p5_16_2"], na.rm = T)
med_Transporte_gasto_3
Transporte[(is.na(Transporte$p5_16_2) & Transporte$p5_14 == "3"), "p5_16_2"] <- med_Transporte_gasto_3

med_Transporte_gasto_4 <- median(Transporte[Transporte$p5_14 == "4", "p5_16_2"], na.rm = T)
med_Transporte_gasto_4
Transporte[(is.na(Transporte$p5_16_2) & Transporte$p5_14 == "4"), "p5_16_2"] <- med_Transporte_gasto_4
```


```{r}
med_Transporte_gasto_5 <- median(Transporte[Transporte$p5_14 == "5", "p5_16_2"], na.rm = T)
med_Transporte_gasto_5

```

##### Como es NA al final pongo la mediana de todos en el numero de transporte 5 porque significa que no hay ni un valor ahi.

```{r}

med_Transporte_gasto_6 <- median(Transporte[Transporte$p5_14 == "6", "p5_16_2"], na.rm = T)
med_Transporte_gasto_6
Transporte[(is.na(Transporte$p5_16_2) & Transporte$p5_14 == "6"), "p5_16_2"] <- med_Transporte_gasto_6

```

```{r}
med_Transporte_gasto_7 <- median(Transporte[Transporte$p5_14 == "7", "p5_16_2"], na.rm = T)
med_Transporte_gasto_7
```

##### Otra vez lo del cero

```{r}
prom_Transporte_gasto_7 <- mean(Transporte[Transporte$p5_14 == "7", "p5_16_2"], na.rm = T)
prom_Transporte_gasto_7

Transporte[(is.na(Transporte$p5_16_2) & Transporte$p5_14 == "7"), "p5_16_2"] <- prom_Transporte_gasto_7
```

```{r}

med_Transporte_gasto_8 <- median(Transporte[Transporte$p5_14 == "8", "p5_16_2"], na.rm = T)
med_Transporte_gasto_8
Transporte[(is.na(Transporte$p5_16_2) & Transporte$p5_14 == "8"), "p5_16_2"] <- med_Transporte_gasto_8

med_Transporte_gasto_9 <- median(Transporte[Transporte$p5_14 == "9", "p5_16_2"], na.rm = T)
med_Transporte_gasto_9

prom_Transporte_gasto_9 <- mean(Transporte[Transporte$p5_14 == "9", "p5_16_2"], na.rm = T)
prom_Transporte_gasto_9
Transporte[(is.na(Transporte$p5_16_2) & Transporte$p5_14 == "9"), "p5_16_2"] <- prom_Transporte_gasto_9
```
##### En el 9 quedo 0 de las dos formas seguro es transporte a pie o algo asi supongo.

```{r}
med_Transporte_gasto_10 <- median(Transporte[Transporte$p5_14 == "10", "p5_16_2"], na.rm = T)
med_Transporte_gasto_10

med_Transporte_gasto_11 <- median(Transporte[Transporte$p5_14 == "11", "p5_16_2"], na.rm = T)
med_Transporte_gasto_11

med_Transporte_gasto_12 <- median(Transporte[Transporte$p5_14 == "12", "p5_16_2"], na.rm = T)
med_Transporte_gasto_12

med_Transporte_gasto_13 <- median(Transporte[Transporte$p5_14 == "13", "p5_16_2"], na.rm = T)
med_Transporte_gasto_13

med_Transporte_gasto_15 <- median(Transporte[Transporte$p5_14 == "15", "p5_16_2"], na.rm = T)
med_Transporte_gasto_15
```
##### Otros NA

```{r}
med_Transporte_gasto_14 <- median(Transporte[Transporte$p5_14 == "14", "p5_16_2"], na.rm = T)
med_Transporte_gasto_14

prom_Transporte_gasto_14 <- mean(Transporte[Transporte$p5_14 == "14", "p5_16_2"], na.rm = T)
prom_Transporte_gasto_14

Transporte[(is.na(Transporte$p5_16_2) & Transporte$p5_14 == "14"), "p5_16_2"] <- med_Transporte_gasto_14

```

```{r}
med_Transporte_gasto_16 <- median(Transporte[Transporte$p5_14 == "16", "p5_16_2"], na.rm = T)
med_Transporte_gasto_16
Transporte[(is.na(Transporte$p5_16_2) & Transporte$p5_14 == "16"), "p5_16_2"] <- med_Transporte_gasto_16

med_Transporte_gasto_17 <- median(Transporte[Transporte$p5_14 == "17", "p5_16_2"], na.rm = T)
med_Transporte_gasto_17
Transporte[(is.na(Transporte$p5_16_2) & Transporte$p5_14 == "17"), "p5_16_2"] <- med_Transporte_gasto_17

med_Transporte_gasto_18 <- median(Transporte[Transporte$p5_14 == "18", "p5_16_2"], na.rm = T)
med_Transporte_gasto_18
Transporte[(is.na(Transporte$p5_16_2) & Transporte$p5_14 == "18"), "p5_16_2"] <- med_Transporte_gasto_18

med_Transporte_gasto_19 <- median(Transporte[Transporte$p5_14 == "19", "p5_16_2"], na.rm = T)
med_Transporte_gasto_19

prom_Transporte_gasto_19 <- mean(Transporte[Transporte$p5_14 == "19", "p5_16_2"], na.rm = T)
prom_Transporte_gasto_19

Transporte[(is.na(Transporte$p5_16_2) & Transporte$p5_14 == "19"), "p5_16_2"] <- prom_Transporte_gasto_19

med_Transporte_gasto_20 <- median(Transporte[Transporte$p5_14 == "20", "p5_16_2"], na.rm = T)
med_Transporte_gasto_20

prom_Transporte_gasto_20 <- mean(Transporte[Transporte$p5_14 == "20", "p5_16_2"], na.rm = T)
prom_Transporte_gasto_20

Transporte[(is.na(Transporte$p5_16_2) & Transporte$p5_14 == "20"), "p5_16_2"] <- prom_Transporte_gasto_20
```

##### Ahora los que tenian puros NA con la mediana o media general

```{r}
med_Transporte_gasto <- median(Transporte[,"p5_16_2"], na.rm = T)
med_Transporte_gasto

prom_Transporte_gasto <- mean(Transporte[,"p5_16_2"], na.rm = T)
prom_Transporte_gasto

Transporte[is.na(Transporte$p5_16_2),]

Transporte[is.na(Transporte$p5_16_2),"p5_16_2"] <- prom_Transporte_gasto

summary(Transporte)

Transporte[!complete.cases(Transporte),]

```

##### Las NAs que quedan de transporte son el codigo de estacion y esas yo creo que las podemos dejar vacias sin afectar el analisis.
