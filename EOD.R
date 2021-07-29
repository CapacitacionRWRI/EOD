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

```


```{r}
PerfilSociodemografico$sexo <- as.factor(PerfilSociodemografico$sexo)
str(PerfilSociodemografico)
summary(PerfilSociodemografico)

x <- PerfilSociodemografico$edad
x

PerfilSociodemografico$mun <- as.factor(PerfilSociodemografico$mun)
levels(PerfilSociodemografico$mun)

#sum(x <= 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 2)
#sum(x <= 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 2)
#sum(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 2)
#sum(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 2)
```


#### Municipio 2 Hombres
```{r}
Menor18H_M2 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 2))

Entre18y35H_M2 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 2 ))

Entre35y65H_M2 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 2 ))

Mayor65H_M2 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 2))
```

#### Vector municipio 2 hombres
```{r}
VM2H <- cbind(Menor18H_M2, Entre18y35H_M2, Entre35y65H_M2, Mayor65H_M2)
```


#### Municipio 2 Mujeres
```{r}
Menor18M_M2 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 2))

Entre18y35M_M2 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 2 ))

Entre35y65M_M2 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 2 ))

Mayor65M_M2 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 2))
```

#### Vector Municipio 2 Mujeres
```{r}
VM2M <- cbind(Menor18M_M2, Entre18y35M_M2, Entre35y65M_M2, Mayor65M_M2)
```


#### Matriz municipio 2

```{r}
Municipio_2 <- rbind(VM2H, VM2M)

colnames(Municipio_2) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_2) <- c("Hombre","Mujer")

Municipio_2

```




#### Municipio 3
```{r}
Menor18H_M3 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 3))

Entre18y35H_M3 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 3 ))

Entre35y65H_M3 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 3 ))

Mayor65H_M3 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 3))

VM3H <- cbind(Menor18H_M3, Entre18y35H_M3, Entre35y65H_M3, Mayor65H_M3)

Menor18M_M3 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 3))

Entre18y35M_M3 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 3))

Entre35y65M_M3 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 3))

Mayor65M_M3 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 3))

VM3M <- cbind(Menor18M_M3, Entre18y35M_M3, Entre35y65M_M3, Mayor65M_M3)

Municipio_3 <- rbind(VM3H, VM3M)

colnames(Municipio_3) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_3) <- c("Hombre","Mujer")

Municipio_3

```


#### Municipio 4
```{r}
Menor18H_M4 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 4))

Entre18y35H_M4 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 4))

Entre35y65H_M4 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 4))

Mayor65H_M4 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 4))

VM4H <- cbind(Menor18H_M4, Entre18y35H_M4, Entre35y65H_M4, Mayor65H_M4)

Menor18M_M4 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 4))

Entre18y35M_M4 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 4))

Entre35y65M_M4 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 4))

Mayor65M_M4 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 4))

VM4M <- cbind(Menor18M_M4, Entre18y35M_M4, Entre35y65M_M4, Mayor65M_M4)

Municipio_4 <- rbind(VM4H, VM4M)

colnames(Municipio_4) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_4) <- c("Hombre","Mujer")

Municipio_4

```


#### Municipio 5
```{r}
Menor18H_M5 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 5))

Entre18y35H_M5 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 5))

Entre35y65H_M5 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 5))

Mayor65H_M5 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 5))

VM5H <- cbind(Menor18H_M5, Entre18y35H_M5, Entre35y65H_M5, Mayor65H_M5)

Menor18M_M5 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 5))

Entre18y35M_M5 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 5))

Entre35y65M_M5 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 5))

Mayor65M_M5 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 5))

VM5M <- cbind(Menor18M_M5, Entre18y35M_M5, Entre35y65M_M5, Mayor65M_M5)

Municipio_5 <- rbind(VM5H, VM5M)

colnames(Municipio_5) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_5) <- c("Hombre","Mujer")

Municipio_5

```


#### Municipio 6
```{r}
Menor18H_M6 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 6))

Entre18y35H_M6 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 6))

Entre35y65H_M6 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 6))

Mayor65H_M6 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 6))

VM6H <- cbind(Menor18H_M6, Entre18y35H_M6, Entre35y65H_M6, Mayor65H_M6)

Menor18M_M6 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 6))

Entre18y35M_M6 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 6))

Entre35y65M_M6 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 6))

Mayor65M_M6 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 6))

VM6M <- cbind(Menor18M_M6, Entre18y35M_M6, Entre35y65M_M6, Mayor65M_M6)

Municipio_6 <- rbind(VM6H, VM6M)

colnames(Municipio_6) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_6) <- c("Hombre","Mujer")

Municipio_6

```

#### Municipio 7
```{r}
Menor18H_M7 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 7))

Entre18y35H_M7 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 7))

Entre35y65H_M7 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 7))

Mayor65H_M7 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 7))

VM7H <- cbind(Menor18H_M7, Entre18y35H_M7, Entre35y65H_M7, Mayor65H_M7)

Menor18M_M7 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 7))

Entre18y35M_M7 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 7))

Entre35y65M_M7 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 7))

Mayor65M_M7 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 7))

VM7M <- cbind(Menor18M_M7, Entre18y35M_M7, Entre35y65M_M7, Mayor65M_M7)

Municipio_7 <- rbind(VM7H, VM7M)

colnames(Municipio_7) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_7) <- c("Hombre","Mujer")

Municipio_7

```


#### Municipio 8
```{r}
Menor18H_M8 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 8))

Entre18y35H_M8 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 8))

Entre35y65H_M8 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 8))

Mayor65H_M8 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 8))

VM8H <- cbind(Menor18H_M8, Entre18y35H_M8, Entre35y65H_M8, Mayor65H_M8)

Menor18M_M8 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 8))

Entre18y35M_M8 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 8))

Entre35y65M_M8 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 8))

Mayor65M_M8 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 8))

VM8M <- cbind(Menor18M_M8, Entre18y35M_M8, Entre35y65M_M8, Mayor65M_M8)

Municipio_8 <- rbind(VM8H, VM8M)

colnames(Municipio_8) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_8) <- c("Hombre","Mujer")

Municipio_8

```


#### Municipio 9
```{r}
Menor18H_M9 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 9))

Entre18y35H_M9 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 9))

Entre35y65H_M9 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 9))

Mayor65H_M9 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 9))

VM9H <- cbind(Menor18H_M9, Entre18y35H_M9, Entre35y65H_M9, Mayor65H_M9)

Menor18M_M9 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 9))

Entre18y35M_M9 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 9))

Entre35y65M_M9 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 9))

Mayor65M_M9 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 9))

VM9M <- cbind(Menor18M_M9, Entre18y35M_M9, Entre35y65M_M9, Mayor65M_M9)

Municipio_9 <- rbind(VM9H, VM9M)

colnames(Municipio_9) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_9) <- c("Hombre","Mujer")

Municipio_9

```


#### Municipio 10
```{r}
Menor18H_M10 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 10))

Entre18y35H_M10 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 10))

Entre35y65H_M10 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 10))

Mayor65H_M10 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 10))

VM10H <- cbind(Menor18H_M10, Entre18y35H_M10, Entre35y65H_M10, Mayor65H_M10)

Menor18M_M10 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 10))

Entre18y35M_M10 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 10))

Entre35y65M_M10 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 10))

Mayor65M_M10 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 10))

VM10M <- cbind(Menor18M_M10, Entre18y35M_M10, Entre35y65M_M10, Mayor65M_M10)

Municipio_10 <- rbind(VM10H, VM10M)

colnames(Municipio_10) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_10) <- c("Hombre","Mujer")

Municipio_10

```

```{r}
levels(PerfilSociodemografico$mun)
```

#### Municipio 11
```{r}
Menor18H_M11 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 11))

Entre18y35H_M11 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 11))

Entre35y65H_M11 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 11))

Mayor65H_M11 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 11))

VM11H <- cbind(Menor18H_M11, Entre18y35H_M11, Entre35y65H_M11, Mayor65H_M11)

Menor18M_M11 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 11))

Entre18y35M_M11 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 11))

Entre35y65M_M11 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 11))

Mayor65M_M11 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 11))

VM11M <- cbind(Menor18M_M11, Entre18y35M_M11, Entre35y65M_M11, Mayor65M_M11)

Municipio_11 <- rbind(VM11H, VM11M)

colnames(Municipio_11) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_11) <- c("Hombre","Mujer")

Municipio_11

```


#### Municipio 12
```{r}
Menor18H_M12 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 12))

Entre18y35H_M12 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 12))

Entre35y65H_M12 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 12))

Mayor65H_M12 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 12))

VM12H <- cbind(Menor18H_M12, Entre18y35H_M12, Entre35y65H_M12, Mayor65H_M12)

Menor18M_M12 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 12))

Entre18y35M_M12 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 12))

Entre35y65M_M12 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 12))

Mayor65M_M12 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 12))

VM12M <- cbind(Menor18M_M12, Entre18y35M_M12, Entre35y65M_M12, Mayor65M_M12)

Municipio_12 <- rbind(VM12H, VM12M)

colnames(Municipio_12) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_12) <- c("Hombre","Mujer")

Municipio_12

```


#### Municipio 13
```{r}
Menor18H_M13 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 13))

Entre18y35H_M13 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 13))

Entre35y65H_M13 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 13))

Mayor65H_M13 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 13))

VM13H <- cbind(Menor18H_M13, Entre18y35H_M13, Entre35y65H_M13, Mayor65H_M13)

Menor18M_M13 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 13))

Entre18y35M_M13 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 13))

Entre35y65M_M13 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 13))

Mayor65M_M13 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 13))

VM13M <- cbind(Menor18M_M13, Entre18y35M_M13, Entre35y65M_M13, Mayor65M_M13)

Municipio_13 <- rbind(VM13H, VM13M)

colnames(Municipio_13) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_13) <- c("Hombre","Mujer")

Municipio_13

```


#### Municipio 14
```{r}
Menor18H_M14 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 14))

Entre18y35H_M14 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 14))

Entre35y65H_M14 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 14))

Mayor65H_M14 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 14))

VM14H <- cbind(Menor18H_M14, Entre18y35H_M14, Entre35y65H_M14, Mayor65H_M14)

Menor18M_M14 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 14))

Entre18y35M_M14 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 14))

Entre35y65M_M14 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 14))

Mayor65M_M14 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 14))

VM14M <- cbind(Menor18M_M14, Entre18y35M_M14, Entre35y65M_M14, Mayor65M_M14)

Municipio_14 <- rbind(VM14H, VM14M)

colnames(Municipio_14) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_14) <- c("Hombre","Mujer")

Municipio_14

```

#### Municipio 15
```{r}
Menor18H_M15 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 15))

Entre18y35H_M15 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 15))

Entre35y65H_M15 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 15))

Mayor65H_M15 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 15))

VM15H <- cbind(Menor18H_M15, Entre18y35H_M15, Entre35y65H_M15, Mayor65H_M15)

Menor18M_M15 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 15))

Entre18y35M_M15 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 15))

Entre35y65M_M15 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 15))

Mayor65M_M15 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 15))

VM15M <- cbind(Menor18M_M15, Entre18y35M_M15, Entre35y65M_M15, Mayor65M_M15)

Municipio_15 <- rbind(VM15H, VM15M)

colnames(Municipio_15) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_15) <- c("Hombre","Mujer")

Municipio_15

```


#### Municipio 16
```{r}
Menor18H_M16 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 16))

Entre18y35H_M16 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 16))

Entre35y65H_M16 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 16))

Mayor65H_M16 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 16))

VM16H <- cbind(Menor18H_M16, Entre18y35H_M16, Entre35y65H_M16, Mayor65H_M16)

Menor18M_M16 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 16))

Entre18y35M_M16 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 16))

Entre35y65M_M16 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 16))

Mayor65M_M16 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 16))

VM16M <- cbind(Menor18M_M16, Entre18y35M_M16, Entre35y65M_M16, Mayor65M_M16)

Municipio_16 <- rbind(VM16H, VM16M)

colnames(Municipio_16) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_16) <- c("Hombre","Mujer")

Municipio_16

```


#### Municipio 17
```{r}
Menor18H_M17 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 17))

Entre18y35H_M17 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 17))

Entre35y65H_M17 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 17))

Mayor65H_M17 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 17))

VM17H <- cbind(Menor18H_M17, Entre18y35H_M17, Entre35y65H_M17, Mayor65H_M17)

Menor18M_M17 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 17))

Entre18y35M_M17 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 17))

Entre35y65M_M17 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 17))

Mayor65M_M17 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 17))

VM17M <- cbind(Menor18M_M17, Entre18y35M_M17, Entre35y65M_M17, Mayor65M_M17)

Municipio_17 <- rbind(VM17H, VM17M)

colnames(Municipio_17) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_17) <- c("Hombre","Mujer")

Municipio_17

```


#### Municipio 20
```{r}
Menor18H_M20 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 20))

Entre18y35H_M20 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 20))

Entre35y65H_M20 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 20))

Mayor65H_M20 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 20))

VM20H <- cbind(Menor18H_M20, Entre18y35H_M20, Entre35y65H_M20, Mayor65H_M20)

Menor18M_M20 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 20))

Entre18y35M_M20 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 20))

Entre35y65M_M20 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 20))

Mayor65M_M20 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 20))

VM20M <- cbind(Menor18M_M20, Entre18y35M_M20, Entre35y65M_M20, Mayor65M_M20)

Municipio_20 <- rbind(VM20H, VM20M)

colnames(Municipio_20) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_20) <- c("Hombre","Mujer")

Municipio_20

```


#### Municipio 22
```{r}
Menor18H_M22 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 22))

Entre18y35H_M22 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 22))

Entre35y65H_M22 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 22))

Mayor65H_M22 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 22))

VM22H <- cbind(Menor18H_M22, Entre18y35H_M22, Entre35y65H_M22, Mayor65H_M22)

Menor18M_M22 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 22))

Entre18y35M_M22 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 22))

Entre35y65M_M22 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 22))

Mayor65M_M22 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 22))

VM22M <- cbind(Menor18M_M22, Entre18y35M_M22, Entre35y65M_M22, Mayor65M_M22)

Municipio_22 <- rbind(VM22H, VM22M)

colnames(Municipio_22) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_22) <- c("Hombre","Mujer")

Municipio_22
levels(PerfilSociodemografico$mun)
```


#### Municipio 23
```{r}
Menor18H_M23 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 23))

Entre18y35H_M23 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 23))

Entre35y65H_M23 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 23))

Mayor65H_M23 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 23))

VM23H <- cbind(Menor18H_M23, Entre18y35H_M23, Entre35y65H_M23, Mayor65H_M23)

Menor18M_M23 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 23))

Entre18y35M_M23 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 23))

Entre35y65M_M23 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 23))

Mayor65M_M23 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 23))

VM23M <- cbind(Menor18M_M23, Entre18y35M_M23, Entre35y65M_M23, Mayor65M_M23)

Municipio_23 <- rbind(VM23H, VM23M)

colnames(Municipio_23) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_23) <- c("Hombre","Mujer")

Municipio_23

```


#### Municipio 24
```{r}
Menor18H_M24 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 24))

Entre18y35H_M24 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 24))

Entre35y65H_M24 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 24))

Mayor65H_M24 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 24))

VM24H <- cbind(Menor18H_M24, Entre18y35H_M24, Entre35y65H_M24, Mayor65H_M24)

Menor18M_M24 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 24))

Entre18y35M_M24 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 24))

Entre35y65M_M24 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 24))

Mayor65M_M24 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 24))

VM24M <- cbind(Menor18M_M24, Entre18y35M_M24, Entre35y65M_M24, Mayor65M_M24)

Municipio_24 <- rbind(VM24H, VM24M)

colnames(Municipio_24) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_24) <- c("Hombre","Mujer")

Municipio_24

```


#### Municipio 25
```{r}
Menor18H_M25 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 25))

Entre18y35H_M25 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 25))

Entre35y65H_M25 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 25))

Mayor65H_M25 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 25))

VM25H <- cbind(Menor18H_M25, Entre18y35H_M25, Entre35y65H_M25, Mayor65H_M25)

Menor18M_M25 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 25))

Entre18y35M_M25 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 25))

Entre35y65M_M25 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 25))

Mayor65M_M25 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 25))

VM25M <- cbind(Menor18M_M25, Entre18y35M_M25, Entre35y65M_M25, Mayor65M_M25)

Municipio_25 <- rbind(VM25H, VM25M)

colnames(Municipio_25) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_25) <- c("Hombre","Mujer")

Municipio_25
levels(PerfilSociodemografico$mun)
```

#### Municipio 28
```{r}
Menor18H_M28 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 28))

Entre18y35H_M28 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 28))

Entre35y65H_M28 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 28))

Mayor65H_M28 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 28))

VM28H <- cbind(Menor18H_M28, Entre18y35H_M28, Entre35y65H_M28, Mayor65H_M28)

Menor18M_M28 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 28))

Entre18y35M_M28 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 28))

Entre35y65M_M28 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 28))

Mayor65M_M28 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 28))

VM28M <- cbind(Menor18M_M28, Entre18y35M_M28, Entre35y65M_M28, Mayor65M_M28)

Municipio_28 <- rbind(VM28H, VM28M)

colnames(Municipio_28) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_28) <- c("Hombre","Mujer")

Municipio_28

```


#### Municipio 29
```{r}
Menor18H_M29 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 29))

Entre18y35H_M29 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 29))

Entre35y65H_M29 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 29))

Mayor65H_M29 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 29))

VM29H <- cbind(Menor18H_M29, Entre18y35H_M29, Entre35y65H_M29, Mayor65H_M29)

Menor18M_M29 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 29))

Entre18y35M_M29 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 29))

Entre35y65M_M29 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 29))

Mayor65M_M29 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 29))

VM29M <- cbind(Menor18M_M29, Entre18y35M_M29, Entre35y65M_M29, Mayor65M_M29)

Municipio_29 <- rbind(VM29H, VM29M)

colnames(Municipio_29) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_29) <- c("Hombre","Mujer")

Municipio_29

```


#### Municipio 30
```{r}
Menor18H_M30 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 30))

Entre18y35H_M30 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 30))

Entre35y65H_M30 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 30))

Mayor65H_M30 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 30))

VM30H <- cbind(Menor18H_M30, Entre18y35H_M30, Entre35y65H_M30, Mayor65H_M30)

Menor18M_M30 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 30))

Entre18y35M_M30 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 30))

Entre35y65M_M30 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 30))

Mayor65M_M30 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 30))

VM30M <- cbind(Menor18M_M30, Entre18y35M_M30, Entre35y65M_M30, Mayor65M_M30)

Municipio_30 <- rbind(VM30H, VM30M)

colnames(Municipio_30) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_30) <- c("Hombre","Mujer")

Municipio_30

```


#### Municipio 31
```{r}
Menor18H_M31 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 31))

Entre18y35H_M31 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 31))

Entre35y65H_M31 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 31))

Mayor65H_M31 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 31))

VM31H <- cbind(Menor18H_M31, Entre18y35H_M31, Entre35y65H_M31, Mayor65H_M31)

Menor18M_M31 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 31))

Entre18y35M_M31 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 31))

Entre35y65M_M31 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 31))

Mayor65M_M31 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 31))

VM31M <- cbind(Menor18M_M31, Entre18y35M_M31, Entre35y65M_M31, Mayor65M_M31)

Municipio_31 <- rbind(VM31H, VM31M)

colnames(Municipio_31) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_31) <- c("Hombre","Mujer")

Municipio_31

```

```{r}
levels(PerfilSociodemografico$mun)
```

#### Municipio 33
```{r}
Menor18H_M33 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 33))

Entre18y35H_M33 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 33))

Entre35y65H_M33 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 33))

Mayor65H_M33 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 33))

VM33H <- cbind(Menor18H_M33, Entre18y35H_M33, Entre35y65H_M33, Mayor65H_M33)

Menor18M_M33 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 33))

Entre18y35M_M33 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 33))

Entre35y65M_M33 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 33))

Mayor65M_M33 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 33))

VM33M <- cbind(Menor18M_M33, Entre18y35M_M33, Entre35y65M_M33, Mayor65M_M33)

Municipio_33 <- rbind(VM33H, VM33M)

colnames(Municipio_33) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_33) <- c("Hombre","Mujer")

Municipio_33

```


#### Municipio 34
```{r}
Menor18H_M34 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 34))

Entre18y35H_M34 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 34))

Entre35y65H_M34 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 34))

Mayor65H_M34 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 34))

VM34H <- cbind(Menor18H_M34, Entre18y35H_M34, Entre35y65H_M34, Mayor65H_M34)

Menor18M_M34 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 34))

Entre18y35M_M34 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 34))

Entre35y65M_M34 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 34))

Mayor65M_M34 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 34))

VM34M <- cbind(Menor18M_M34, Entre18y35M_M34, Entre35y65M_M34, Mayor65M_M34)

Municipio_34 <- rbind(VM34H, VM34M)

colnames(Municipio_34) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_34) <- c("Hombre","Mujer")

Municipio_34

```


#### Municipio 35
```{r}
Menor18H_M35 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 35))

Entre18y35H_M35 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 35))

Entre35y65H_M35 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 35))

Mayor65H_M35 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 35))

VM35H <- cbind(Menor18H_M35, Entre18y35H_M35, Entre35y65H_M35, Mayor65H_M35)

Menor18M_M35 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 35))

Entre18y35M_M35 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 35))

Entre35y65M_M35 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 35))

Mayor65M_M35 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 35))

VM35M <- cbind(Menor18M_M35, Entre18y35M_M35, Entre35y65M_M35, Mayor65M_M35)

Municipio_35 <- rbind(VM35H, VM35M)

colnames(Municipio_35) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_35) <- c("Hombre","Mujer")

Municipio_35

```


#### Municipio 36
```{r}
Menor18H_M36 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 36))

Entre18y35H_M36 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 36))

Entre35y65H_M36 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 36))

Mayor65H_M36 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 36))

VM36H <- cbind(Menor18H_M36, Entre18y35H_M36, Entre35y65H_M36, Mayor65H_M36)

Menor18M_M36 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 36))

Entre18y35M_M36 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 36))

Entre35y65M_M36 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 36))

Mayor65M_M36 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 36))

VM36M <- cbind(Menor18M_M36, Entre18y35M_M36, Entre35y65M_M36, Mayor65M_M36)

Municipio_36 <- rbind(VM36H, VM36M)

colnames(Municipio_36) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_36) <- c("Hombre","Mujer")

Municipio_36

```

#### Municipio 37
```{r}
Menor18H_M37 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 37))

Entre18y35H_M37 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 37))

Entre35y65H_M37 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 37))

Mayor65H_M37 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 37))

VM37H <- cbind(Menor18H_M37, Entre18y35H_M37, Entre35y65H_M37, Mayor65H_M37)

Menor18M_M37 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 37))

Entre18y35M_M37 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 37))

Entre35y65M_M37 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 37))

Mayor65M_M37 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 37))

VM37M <- cbind(Menor18M_M37, Entre18y35M_M37, Entre35y65M_M37, Mayor65M_M37)

Municipio_37 <- rbind(VM37H, VM37M)

colnames(Municipio_37) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_37) <- c("Hombre","Mujer")

Municipio_37

```


#### Municipio 38
```{r}
Menor18H_M38 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 38))

Entre18y35H_M38 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 38))

Entre35y65H_M38 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 38))

Mayor65H_M38 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 38))

VM38H <- cbind(Menor18H_M38, Entre18y35H_M38, Entre35y65H_M38, Mayor65H_M38)

Menor18M_M38 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 38))

Entre18y35M_M38 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 38))

Entre35y65M_M38 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 38))

Mayor65M_M38 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 38))

VM38M <- cbind(Menor18M_M38, Entre18y35M_M38, Entre35y65M_M38, Mayor65M_M38)

Municipio_38 <- rbind(VM38H, VM38M)

colnames(Municipio_38) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_38) <- c("Hombre","Mujer")

Municipio_38

```


#### Municipio 39
```{r}
Menor18H_M39 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 39))

Entre18y35H_M39 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 39))

Entre35y65H_M39 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 39))

Mayor65H_M39 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 39))

VM39H <- cbind(Menor18H_M39, Entre18y35H_M39, Entre35y65H_M39, Mayor65H_M39)

Menor18M_M39 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 39))

Entre18y35M_M39 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 39))

Entre35y65M_M39 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 39))

Mayor65M_M39 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 39))

VM39M <- cbind(Menor18M_M39, Entre18y35M_M39, Entre35y65M_M39, Mayor65M_M39)

Municipio_39 <- rbind(VM39H, VM39M)

colnames(Municipio_39) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_39) <- c("Hombre","Mujer")

Municipio_39
levels(PerfilSociodemografico$mun)
```


#### Municipio 44
```{r}
Menor18H_M44 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 44))

Entre18y35H_M44 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 44))

Entre35y65H_M44 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 44))

Mayor65H_M44 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 44))

VM44H <- cbind(Menor18H_M44, Entre18y35H_M44, Entre35y65H_M44, Mayor65H_M44)

Menor18M_M44 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 44))

Entre18y35M_M44 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 44))

Entre35y65M_M44 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 44))

Mayor65M_M44 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 44))

VM44M <- cbind(Menor18M_M44, Entre18y35M_M44, Entre35y65M_M44, Mayor65M_M44)

Municipio_44 <- rbind(VM44H, VM44M)

colnames(Municipio_44) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_44) <- c("Hombre","Mujer")

Municipio_44
levels(PerfilSociodemografico$mun)
```


#### Municipio 46
```{r}
Menor18H_M46 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 46))

Entre18y35H_M46 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 46))

Entre35y65H_M46 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 46))

Mayor65H_M46 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 46))

VM46H <- cbind(Menor18H_M46, Entre18y35H_M46, Entre35y65H_M46, Mayor65H_M46)

Menor18M_M46 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 46))

Entre18y35M_M46 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 46))

Entre35y65M_M46 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 46))

Mayor65M_M46 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 46))

VM46M <- cbind(Menor18M_M46, Entre18y35M_M46, Entre35y65M_M46, Mayor65M_M46)

Municipio_46 <- rbind(VM46H, VM46M)

colnames(Municipio_46) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_46) <- c("Hombre","Mujer")

Municipio_46

```


#### Municipio 50
```{r}
Menor18H_M50 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 50))

Entre18y35H_M50 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 50))

Entre35y65H_M50 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 50))

Mayor65H_M50 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 50))

VM50H <- cbind(Menor18H_M50, Entre18y35H_M50, Entre35y65H_M50, Mayor65H_M50)

Menor18M_M50 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 50))

Entre18y35M_M50 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 50))

Entre35y65M_M50 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 50))

Mayor65M_M50 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 50))

VM50M <- cbind(Menor18M_M50, Entre18y35M_M50, Entre35y65M_M50, Mayor65M_M50)

Municipio_50 <- rbind(VM50H, VM50M)

colnames(Municipio_50) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_50) <- c("Hombre","Mujer")

Municipio_50

```


#### Municipio 53
```{r}
Menor18H_M53 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 53))

Entre18y35H_M53 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 53))

Entre35y65H_M53 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 53))

Mayor65H_M53 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 53))

VM53H <- cbind(Menor18H_M53, Entre18y35H_M53, Entre35y65H_M53, Mayor65H_M53)

Menor18M_M53 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 53))

Entre18y35M_M53 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 53))

Entre35y65M_M53 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 53))

Mayor65M_M53 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 53))

VM53M <- cbind(Menor18M_M53, Entre18y35M_M53, Entre35y65M_M53, Mayor65M_M53)

Municipio_53 <- rbind(VM53H, VM53M)

colnames(Municipio_53) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_53) <- c("Hombre","Mujer")

Municipio_53

```


#### Municipio 57
```{r}
Menor18H_M57 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 57))

Entre18y35H_M57 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 57))

Entre35y65H_M57 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 57))

Mayor65H_M57 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 57))

VM57H <- cbind(Menor18H_M57, Entre18y35H_M57, Entre35y65H_M57, Mayor65H_M57)

Menor18M_M57 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 57))

Entre18y35M_M57 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 57))

Entre35y65M_M57 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 57))

Mayor65M_M57 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 57))

VM57M <- cbind(Menor18M_M57, Entre18y35M_M57, Entre35y65M_M57, Mayor65M_M57)

Municipio_57 <- rbind(VM57H, VM57M)

colnames(Municipio_57) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_57) <- c("Hombre","Mujer")

Municipio_57

```

#### Municipio 58
```{r}
Menor18H_M58 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 58))

Entre18y35H_M58 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 58))

Entre35y65H_M58 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 58))

Mayor65H_M58 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 58))

VM58H <- cbind(Menor18H_M58, Entre18y35H_M58, Entre35y65H_M58, Mayor65H_M58)

Menor18M_M58 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 58))

Entre18y35M_M58 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 58))

Entre35y65M_M58 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 58))

Mayor65M_M58 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 58))

VM58M <- cbind(Menor18M_M58, Entre18y35M_M58, Entre35y65M_M58, Mayor65M_M58)

Municipio_58 <- rbind(VM58H, VM58M)

colnames(Municipio_58) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_58) <- c("Hombre","Mujer")

Municipio_58

```


#### Municipio 59
```{r}
Menor18H_M59 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 59))

Entre18y35H_M59 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 59))

Entre35y65H_M59 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 59))

Mayor65H_M59 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 59))

VM59H <- cbind(Menor18H_M59, Entre18y35H_M59, Entre35y65H_M59, Mayor65H_M59)

Menor18M_M59 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 59))

Entre18y35M_M59 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 59))

Entre35y65M_M59 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 59))

Mayor65M_M59 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 59))

VM59M <- cbind(Menor18M_M59, Entre18y35M_M59, Entre35y65M_M59, Mayor65M_M59)

Municipio_59 <- rbind(VM59H, VM59M)

colnames(Municipio_59) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_59) <- c("Hombre","Mujer")

Municipio_59

```


#### Municipio 60
```{r}
Menor18H_M60 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 60))

Entre18y35H_M60 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 60))

Entre35y65H_M60 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 60))

Mayor65H_M60 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 60))

VM60H <- cbind(Menor18H_M60, Entre18y35H_M60, Entre35y65H_M60, Mayor65H_M60)

Menor18M_M60 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 60))

Entre18y35M_M60 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 60))

Entre35y65M_M60 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 60))

Mayor65M_M60 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 60))

VM60M <- cbind(Menor18M_M60, Entre18y35M_M60, Entre35y65M_M60, Mayor65M_M60)

Municipio_60 <- rbind(VM60H, VM60M)

colnames(Municipio_60) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_60) <- c("Hombre","Mujer")

Municipio_60

```


#### Municipio 61
```{r}
Menor18H_M61 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 61))

Entre18y35H_M61 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 61))

Entre35y65H_M61 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 61))

Mayor65H_M61 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 61))

VM61H <- cbind(Menor18H_M61, Entre18y35H_M61, Entre35y65H_M61, Mayor65H_M61)

Menor18M_M61 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 61))

Entre18y35M_M61 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 61))

Entre35y65M_M61 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 61))

Mayor65M_M61 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 61))

VM61M <- cbind(Menor18M_M61, Entre18y35M_M61, Entre35y65M_M61, Mayor65M_M61)

Municipio_61 <- rbind(VM61H, VM61M)

colnames(Municipio_61) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_61) <- c("Hombre","Mujer")

Municipio_61

```

```{r}
levels(PerfilSociodemografico$mun)
```

#### Municipio 65
```{r}
Menor18H_M65 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 65))

Entre18y35H_M65 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 65))

Entre35y65H_M65 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 65))

Mayor65H_M65 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 65))

VM65H <- cbind(Menor18H_M65, Entre18y35H_M65, Entre35y65H_M65, Mayor65H_M65)

Menor18M_M65 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 65))

Entre18y35M_M65 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 65))

Entre35y65M_M65 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 65))

Mayor65M_M65 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 65))

VM65M <- cbind(Menor18M_M65, Entre18y35M_M65, Entre35y65M_M65, Mayor65M_M65)

Municipio_65 <- rbind(VM65H, VM65M)

colnames(Municipio_65) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_65) <- c("Hombre","Mujer")

Municipio_65

```


#### Municipio 68
```{r}
Menor18H_M68 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 68))

Entre18y35H_M68 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 68))

Entre35y65H_M68 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 68))

Mayor65H_M68 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 68))

VM68H <- cbind(Menor18H_M68, Entre18y35H_M68, Entre35y65H_M68, Mayor65H_M68)

Menor18M_M68 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 68))

Entre18y35M_M68 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 68))

Entre35y65M_M68 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 68))

Mayor65M_M68 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 68))

VM68M <- cbind(Menor18M_M68, Entre18y35M_M68, Entre35y65M_M68, Mayor65M_M68)

Municipio_68 <- rbind(VM68H, VM68M)

colnames(Municipio_68) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_68) <- c("Hombre","Mujer")

Municipio_68

```


#### Municipio 69
```{r}
Menor18H_M69 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 69))

Entre18y35H_M69 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 69))

Entre35y65H_M69 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 69))

Mayor65H_M69 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 69))

VM69H <- cbind(Menor18H_M69, Entre18y35H_M69, Entre35y65H_M69, Mayor65H_M69)

Menor18M_M69 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 69))

Entre18y35M_M69 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 69))

Entre35y65M_M69 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 69))

Mayor65M_M69 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 69))

VM69M <- cbind(Menor18M_M69, Entre18y35M_M69, Entre35y65M_M69, Mayor65M_M69)

Municipio_69 <- rbind(VM69H, VM69M)

colnames(Municipio_69) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_69) <- c("Hombre","Mujer")

Municipio_69

```


#### Municipio 70
```{r}
Menor18H_M70 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 70))

Entre18y35H_M70 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 70))

Entre35y65H_M70 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 70))

Mayor65H_M70 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 70))

VM70H <- cbind(Menor18H_M70, Entre18y35H_M70, Entre35y65H_M70, Mayor65H_M70)

Menor18M_M70 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 70))

Entre18y35M_M70 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 70))

Entre35y65M_M70 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 70))

Mayor65M_M70 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 70))

VM70M <- cbind(Menor18M_M70, Entre18y35M_M70, Entre35y65M_M70, Mayor65M_M70)

Municipio_70 <- rbind(VM70H, VM70M)

colnames(Municipio_70) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_70) <- c("Hombre","Mujer")

Municipio_70

```

#### Municipio 75
```{r}
Menor18H_M75 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 75))

Entre18y35H_M75 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 75))

Entre35y65H_M75 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 75))

Mayor65H_M75 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 75))

VM75H <- cbind(Menor18H_M75, Entre18y35H_M75, Entre35y65H_M75, Mayor65H_M75)

Menor18M_M75 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 75))

Entre18y35M_M75 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 75))

Entre35y65M_M75 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 75))

Mayor65M_M75 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 75))

VM75M <- cbind(Menor18M_M75, Entre18y35M_M75, Entre35y65M_M75, Mayor65M_M75)

Municipio_75 <- rbind(VM75H, VM75M)

colnames(Municipio_75) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_75) <- c("Hombre","Mujer")

Municipio_75

```


#### Municipio 81
```{r}
Menor18H_M81 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 81))

Entre18y35H_M81 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 81))

Entre35y65H_M81 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 81))

Mayor65H_M81 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 81))

VM81H <- cbind(Menor18H_M81, Entre18y35H_M81, Entre35y65H_M81, Mayor65H_M81)

Menor18M_M81 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 81))

Entre18y35M_M81 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 81))

Entre35y65M_M81 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 81))

Mayor65M_M81 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 81))

VM81M <- cbind(Menor18M_M81, Entre18y35M_M81, Entre35y65M_M81, Mayor65M_M81)

Municipio_81 <- rbind(VM81H, VM81M)

colnames(Municipio_81) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_81) <- c("Hombre","Mujer")

Municipio_81

```


#### Municipio 83
```{r}
Menor18H_M83 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 83))

Entre18y35H_M83 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 83))

Entre35y65H_M83 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 83))

Mayor65H_M83 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 83))

VM83H <- cbind(Menor18H_M83, Entre18y35H_M83, Entre35y65H_M83, Mayor65H_M83)

Menor18M_M83 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 83))

Entre18y35M_M83 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 83))

Entre35y65M_M83 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 83))

Mayor65M_M83 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 83))

VM83M <- cbind(Menor18M_M83, Entre18y35M_M83, Entre35y65M_M83, Mayor65M_M83)

Municipio_83 <- rbind(VM83H, VM83M)

colnames(Municipio_83) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_83) <- c("Hombre","Mujer")

Municipio_83

```


#### Municipio 84
```{r}
Menor18H_M84 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 84))

Entre18y35H_M84 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 84))

Entre35y65H_M84 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 84))

Mayor65H_M84 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 84))

VM84H <- cbind(Menor18H_M84, Entre18y35H_M84, Entre35y65H_M84, Mayor65H_M84)

Menor18M_M84 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 84))

Entre18y35M_M84 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 84))

Entre35y65M_M84 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 84))

Mayor65M_M84 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 84))

VM84M <- cbind(Menor18M_M84, Entre18y35M_M84, Entre35y65M_M84, Mayor65M_M84)

Municipio_84 <- rbind(VM84H, VM84M)

colnames(Municipio_84) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_84) <- c("Hombre","Mujer")

Municipio_84

```


#### Municipio 89
```{r}
Menor18H_M89 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 89))

Entre18y35H_M89 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 89))

Entre35y65H_M89 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 89))

Mayor65H_M89 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 89))

VM89H <- cbind(Menor18H_M89, Entre18y35H_M89, Entre35y65H_M89, Mayor65H_M89)

Menor18M_M89 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 89))

Entre18y35M_M89 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 89))

Entre35y65M_M89 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 89))

Mayor65M_M89 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 89))

VM89M <- cbind(Menor18M_M89, Entre18y35M_M89, Entre35y65M_M89, Mayor65M_M89)

Municipio_89 <- rbind(VM89H, VM89M)

colnames(Municipio_89) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_89) <- c("Hombre","Mujer")

Municipio_89

```


#### Municipio 91
```{r}
Menor18H_M91 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 91))

Entre18y35H_M91 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 91))

Entre35y65H_M91 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 91))

Mayor65H_M91 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 91))

VM91H <- cbind(Menor18H_M91, Entre18y35H_M91, Entre35y65H_M91, Mayor65H_M91)

Menor18M_M91 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 91))

Entre18y35M_M91 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 91))

Entre35y65M_M91 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 91))

Mayor65M_M91 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 91))

VM91M <- cbind(Menor18M_M91, Entre18y35M_M91, Entre35y65M_M91, Mayor65M_M91)

Municipio_91 <- rbind(VM91H, VM91M)

colnames(Municipio_91) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_91) <- c("Hombre","Mujer")

Municipio_91

```


#### Municipio 92
```{r}
Menor18H_M92 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 92))

Entre18y35H_M92 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 92))

Entre35y65H_M92 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 92))

Mayor65H_M92 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 92))

VM92H <- cbind(Menor18H_M92, Entre18y35H_M92, Entre35y65H_M92, Mayor65H_M92)

Menor18M_M92 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 92))

Entre18y35M_M92 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 92))

Entre35y65M_M92 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 92))

Mayor65M_M92 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 92))

VM92M <- cbind(Menor18M_M92, Entre18y35M_M92, Entre35y65M_M92, Mayor65M_M92)

Municipio_92 <- rbind(VM92H, VM92M)

colnames(Municipio_92) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_92) <- c("Hombre","Mujer")

Municipio_92

```


#### Municipio 93
```{r}
Menor18H_M93 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 93))

Entre18y35H_M93 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 93))

Entre35y65H_M93 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 93))

Mayor65H_M93 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 93))

VM93H <- cbind(Menor18H_M93, Entre18y35H_M93, Entre35y65H_M93, Mayor65H_M93)

Menor18M_M93 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 93))

Entre18y35M_M93 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 93))

Entre35y65M_M93 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 93))

Mayor65M_M93 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 93))

VM93M <- cbind(Menor18M_M93, Entre18y35M_M93, Entre35y65M_M93, Mayor65M_M93)

Municipio_93 <- rbind(VM93H, VM93M)

colnames(Municipio_93) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_93) <- c("Hombre","Mujer")

Municipio_93

```

#### Municipio 94
```{r}
Menor18H_M94 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 94))

Entre18y35H_M94 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 94))

Entre35y65H_M94 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 94))

Mayor65H_M94 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 94))

VM94H <- cbind(Menor18H_M94, Entre18y35H_M94, Entre35y65H_M94, Mayor65H_M94)

Menor18M_M94 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 94))

Entre18y35M_M94 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 94))

Entre35y65M_M94 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 94))

Mayor65M_M94 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 94))

VM94M <- cbind(Menor18M_M94, Entre18y35M_M94, Entre35y65M_M94, Mayor65M_M94)

Municipio_94 <- rbind(VM94H, VM94M)

colnames(Municipio_94) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_94) <- c("Hombre","Mujer")

Municipio_94

```


#### Municipio 95
```{r}
Menor18H_M95 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 95))

Entre18y35H_M95 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 95))

Entre35y65H_M95 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 95))

Mayor65H_M95 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 95))

VM95H <- cbind(Menor18H_M95, Entre18y35H_M95, Entre35y65H_M95, Mayor65H_M95)

Menor18M_M95 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 95))

Entre18y35M_M95 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 95))

Entre35y65M_M95 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 95))

Mayor65M_M95 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 95))

VM95M <- cbind(Menor18M_M95, Entre18y35M_M95, Entre35y65M_M95, Mayor65M_M95)

Municipio_95 <- rbind(VM95H, VM95M)

colnames(Municipio_95) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_95) <- c("Hombre","Mujer")

Municipio_95

```


#### Municipio 96
```{r}
Menor18H_M96 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 96))

Entre18y35H_M96 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 96))

Entre35y65H_M96 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 96))

Mayor65H_M96 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 96))

VM96H <- cbind(Menor18H_M96, Entre18y35H_M96, Entre35y65H_M96, Mayor65H_M96)

Menor18M_M96 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 96))

Entre18y35M_M96 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 96))

Entre35y65M_M96 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 96))

Mayor65M_M96 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 96))

VM96M <- cbind(Menor18M_M96, Entre18y35M_M96, Entre35y65M_M96, Mayor65M_M96)

Municipio_96 <- rbind(VM96H, VM96M)

colnames(Municipio_96) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_96) <- c("Hombre","Mujer")

Municipio_96

```
```{r}
levels(PerfilSociodemografico$mun)
```


#### Municipio 99
```{r}
Menor18H_M99 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 99))

Entre18y35H_M99 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 99))

Entre35y65H_M99 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 99))

Mayor65H_M99 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 99))

VM99H <- cbind(Menor18H_M99, Entre18y35H_M99, Entre35y65H_M99, Mayor65H_M99)

Menor18M_M99 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 99))

Entre18y35M_M99 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 99))

Entre35y65M_M99 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 99))

Mayor65M_M99 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 99))

VM99M <- cbind(Menor18M_M99, Entre18y35M_M99, Entre35y65M_M99, Mayor65M_M99)

Municipio_99 <- rbind(VM99H, VM99M)

colnames(Municipio_99) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_99) <- c("Hombre","Mujer")

Municipio_99

```


#### Municipio 100
```{r}
Menor18H_M100 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 100))

Entre18y35H_M100 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 100))

Entre35y65H_M100 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 100))

Mayor65H_M100 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 100))

VM100H <- cbind(Menor18H_M100, Entre18y35H_M100, Entre35y65H_M100, Mayor65H_M100)

Menor18M_M100 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 100))

Entre18y35M_M100 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 100))

Entre35y65M_M100 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 100))

Mayor65M_M100 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 100))

VM100M <- cbind(Menor18M_M100, Entre18y35M_M100, Entre35y65M_M100, Mayor65M_M100)

Municipio_100 <- rbind(VM100H, VM100M)

colnames(Municipio_100) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_100) <- c("Hombre","Mujer")

Municipio_100

```


#### Municipio 103
```{r}
Menor18H_M103 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 103))

Entre18y35H_M103 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 103))

Entre35y65H_M103 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 103))

Mayor65H_M103 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 103))

VM103H <- cbind(Menor18H_M103, Entre18y35H_M103, Entre35y65H_M103, Mayor65H_M103)

Menor18M_M103 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 103))

Entre18y35M_M103 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 103))

Entre35y65M_M103 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 103))

Mayor65M_M103 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 103))

VM103M <- cbind(Menor18M_M103, Entre18y35M_M103, Entre35y65M_M103, Mayor65M_M103)

Municipio_103 <- rbind(VM103H, VM103M)

colnames(Municipio_103) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_103) <- c("Hombre","Mujer")

Municipio_103

```


#### Municipio 104
```{r}
Menor18H_M104 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 104))

Entre18y35H_M104 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 104))

Entre35y65H_M104 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 104))

Mayor65H_M104 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 104))

VM104H <- cbind(Menor18H_M104, Entre18y35H_M104, Entre35y65H_M104, Mayor65H_M104)

Menor18M_M104 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 104))

Entre18y35M_M104 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 104))

Entre35y65M_M104 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 104))

Mayor65M_M104 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 104))

VM104M <- cbind(Menor18M_M104, Entre18y35M_M104, Entre35y65M_M104, Mayor65M_M104)

Municipio_104 <- rbind(VM104H, VM104M)

colnames(Municipio_104) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_104) <- c("Hombre","Mujer")

Municipio_104

```


#### Municipio 108
```{r}
Menor18H_M108 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 108))

Entre18y35H_M108 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 108))

Entre35y65H_M108 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 108))

Mayor65H_M108 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 108))

VM108H <- cbind(Menor18H_M108, Entre18y35H_M108, Entre35y65H_M108, Mayor65H_M108)

Menor18M_M108 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 108))

Entre18y35M_M108 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 108))

Entre35y65M_M108 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 108))

Mayor65M_M108 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 108))

VM108M <- cbind(Menor18M_M108, Entre18y35M_M108, Entre35y65M_M108, Mayor65M_M108)

Municipio_108 <- rbind(VM108H, VM108M)

colnames(Municipio_108) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_108) <- c("Hombre","Mujer")

Municipio_108

```

#### Municipio 109
```{r}
Menor18H_M109 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 109))

Entre18y35H_M109 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 109))

Entre35y65H_M109 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 109))

Mayor65H_M109 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 109))

VM109H <- cbind(Menor18H_M109, Entre18y35H_M109, Entre35y65H_M109, Mayor65H_M109)

Menor18M_M109 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 109))

Entre18y35M_M109 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 109))

Entre35y65M_M109 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 109))

Mayor65M_M109 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 109))

VM109M <- cbind(Menor18M_M109, Entre18y35M_M109, Entre35y65M_M109, Mayor65M_M109)

Municipio_109 <- rbind(VM109H, VM109M)

colnames(Municipio_109) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_109) <- c("Hombre","Mujer")

Municipio_109

```


#### Municipio 112
```{r}
Menor18H_M112 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 112))

Entre18y35H_M112 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 112))

Entre35y65H_M112 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 112))

Mayor65H_M112 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 112))

VM112H <- cbind(Menor18H_M112, Entre18y35H_M112, Entre35y65H_M112, Mayor65H_M112)

Menor18M_M112 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 112))

Entre18y35M_M112 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 112))

Entre35y65M_M112 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 112))

Mayor65M_M112 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 112))

VM112M <- cbind(Menor18M_M112, Entre18y35M_M112, Entre35y65M_M112, Mayor65M_M112)

Municipio_112 <- rbind(VM112H, VM112M)

colnames(Municipio_112) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_112) <- c("Hombre","Mujer")

Municipio_112

```

#### Municipio 120
```{r}
Menor18H_M120 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 120))

Entre18y35H_M120 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 120))

Entre35y65H_M120 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 120))

Mayor65H_M120 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 120))

VM120H <- cbind(Menor18H_M120, Entre18y35H_M120, Entre35y65H_M120, Mayor65H_M120)

Menor18M_M120 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 120))

Entre18y35M_M120 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 120))

Entre35y65M_M120 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 120))

Mayor65M_M120 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 120))

VM120M <- cbind(Menor18M_M120, Entre18y35M_M120, Entre35y65M_M120, Mayor65M_M120)

Municipio_120 <- rbind(VM120H, VM120M)

colnames(Municipio_120) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_120) <- c("Hombre","Mujer")

Municipio_120

```


#### Municipio 121
```{r}
Menor18H_M121 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 121))

Entre18y35H_M121 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 121))

Entre35y65H_M121 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 121))

Mayor65H_M121 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 121))

VM121H <- cbind(Menor18H_M121, Entre18y35H_M121, Entre35y65H_M121, Mayor65H_M121)

Menor18M_M121 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 121))

Entre18y35M_M121 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 121))

Entre35y65M_M121 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 121))

Mayor65M_M121 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 121))

VM121M <- cbind(Menor18M_M121, Entre18y35M_M121, Entre35y65M_M121, Mayor65M_M121)

Municipio_121 <- rbind(VM121H, VM121M)

colnames(Municipio_121) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_121) <- c("Hombre","Mujer")

Municipio_121

```


#### Municipio 122
```{r}
Menor18H_M122 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 122))

Entre18y35H_M122 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 122))

Entre35y65H_M122 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 122))

Mayor65H_M122 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 122))

VM122H <- cbind(Menor18H_M122, Entre18y35H_M122, Entre35y65H_M122, Mayor65H_M122)

Menor18M_M122 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 122))

Entre18y35M_M122 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 122))

Entre35y65M_M122 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 122))

Mayor65M_M122 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 122))

VM122M <- cbind(Menor18M_M122, Entre18y35M_M122, Entre35y65M_M122, Mayor65M_M122)

Municipio_122 <- rbind(VM122H, VM122M)

colnames(Municipio_122) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_122) <- c("Hombre","Mujer")

Municipio_122

```

#### Municipio 125
```{r}
Menor18H_M125 <- length(which(x < 18 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 125))

Entre18y35H_M125 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 125))

Entre35y65H_M125 <- length(which(x >=35 & x <=65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 125))

Mayor65H_M125 <- length(which(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 125))

VM125H <- cbind(Menor18H_M125, Entre18y35H_M125, Entre35y65H_M125, Mayor65H_M125)

Menor18M_M125 <- length(which(x < 18 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 125))

Entre18y35M_M125 <- length(which(x >=18 & x <=35 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 125))

Entre35y65M_M125 <- length(which(x >35 & x <=65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 125))

Mayor65M_M125 <- length(which(x > 65 & PerfilSociodemografico$sexo == 2 & PerfilSociodemografico$mun == 125))

VM125M <- cbind(Menor18M_M125, Entre18y35M_M125, Entre35y65M_M125, Mayor65M_M125)

Municipio_125 <- rbind(VM125H, VM125M)

colnames(Municipio_125) <- c("<18", "[18,35]", "(35,65]", ">65")
rownames(Municipio_125) <- c("Hombre","Mujer")

Municipio_125

```

```{r}
levels(PerfilSociodemografico$mun)

validez_edades <- list(Municipio2 = Municipio_2, Municipio3 = Municipio_3, Municipio4 = Municipio_4, Municipio5 = Municipio_5, Municipio6 = Municipio_6, Municipio7 = Municipio_7, Municipio8 = Municipio_8, Municipio9 = Municipio_9, Municipio10 = Municipio_10, Municipi11 = Municipio_11, Municipio12 = Municipio_12, Municipio13 = Municipio_13, Municipio14 = Municipio_14, Municipio15 = Municipio_15, Municipio16 = Municipio_16, Municipio17 = Municipio_17, Municipio20 = Municipio_20, Municipio22 = Municipio_22, Municipio23 = Municipio_23, Municipio24 = Municipio_24, Municipio25 = Municipio_25, Municipio28 = Municipio_28, Municipio29 = Municipio_29, Municipio30 = Municipio_30, Municipio31 = Municipio_31, Municipio33 = Municipio_33, Municipio34 = Municipio_34, Municipio35 = Municipio_35, Municipio36 = Municipio_36, Municipio37 = Municipio_37, Municipio38 = Municipio_38, Municipio39 = Municipio_39, Municipio44 = Municipio_44, Municipio46 = Municipio_46, Municipio50 = Municipio_50, Municipio53 = Municipio_53, Municipio57 = Municipio_57, Municipio58 = Municipio_58, Municipio59 = Municipio_59, Municipio60 = Municipio_60, Municipio65 = Municipio_65, Municipio68 = Municipio_68, Municipio69 = Municipio_69, Municipio70 = Municipio_70, Municipio75 = Municipio_75, Municipio81 = Municipio_81, Municipio83 = Municipio_83, Municipio84 = Municipio_84, Municipio89 = Municipio_89, Municipio91 = Municipio_91, Municipio92 = Municipio_92, Municipio93 = Municipio_93, Municipio94 = Municipio_94, Municipio95 = Municipio_95, Municipio96 = Municipio_96, Municipio99 = Municipio_99, Municipio100 = Municipio_100, Municipio103 = Municipio_103, Municipio104 = Municipio_104, Municipio108 = Municipio_108, Municipio109 = Municipio_109, Municipio112 = Municipio_112, Municipio120 = Municipio_120, Municipio121 = Municipio_121, Municipio122 = Municipio_122, Municipio125 = Municipio_125)

validez_edades

```







#### Brainstorming para acortar el codigo, todavia no se me ocurre nada!
```{r}
#z <- levels(PerfilSociodemografico$mun)
#sapply(PerfilSociodemografico, function(z) sum(x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == z))

#sapply(PerfilSociodemografico, "+",x > 65 & PerfilSociodemografico$sexo == 1 & PerfilSociodemografico$mun == 2) ????? chance con funcion function(z)...

#z <- levels(PerfilSociodemografico$mun)
#sapply(PerfilSociodemografico$edad, function(z) sum(x > 65 & PerfilSociodemografico$sexo == 1))
```








```{r}
PerfilSociodemografico[!complete.cases(PerfilSociodemografico),]

### Voy a sustituir por medianas

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

#### Todos los p5_15_algo voy a sustituir con medias dependiendo de la edad <18, 18-35, 35-65, >65. 

```{r}
med_auto_1 <- median(Viajes[Viajes$edad < 18, "p5_15_01"], na.rm = T)
med_auto_1
```
##### Aunque en este caso como los menores de edad no manejan voy a suponer que los que no contestaron es por esa razon => 0.

```{r}
Viajes[(is.na(Viajes$p5_15_01) & Viajes$edad < 18), "p5_15_01"] <- 0

```

```{r}
med_auto_2 <- median(Viajes[Viajes$edad >= 18 & Viajes$edad <= 35, "p5_15_01"], na.rm = T)
med_auto_2


Viajes[(is.na(Viajes$p5_15_01) & Viajes$edad >= 18 & Viajes$edad <= 35), "p5_15_01"] <- med_auto_2
```

```{r}
med_auto_3 <- median(Viajes[Viajes$edad >= 35 & Viajes$edad <= 65, "p5_15_01"], na.rm = T)
med_auto_3
       
Viajes[(is.na(Viajes$p5_15_01) & Viajes$edad > 35 & Viajes$edad <= 65), "p5_15_01"] <- med_auto_3
```

```{r}
med_auto_4 <- median(Viajes[Viajes$edad > 65, "p5_15_01"], na.rm = T)
med_auto_4
       
Viajes[(is.na(Viajes$p5_15_01) & Viajes$edad > 65), "p5_15_01"] <- med_auto_4

```



```{r}
med_Micro_1 <- median(Viajes[Viajes$edad < 18, "p5_15_02"], na.rm = T)
med_Micro_1
Viajes[(is.na(Viajes$p5_15_02) & Viajes$edad < 18), "p5_15_02"] <- med_Micro_1
```

```{r}
med_Micro_2 <- median(Viajes[Viajes$edad >= 18 & Viajes$edad <= 35, "p5_15_02"], na.rm = T)
med_Micro_2


Viajes[(is.na(Viajes$p5_15_02) & Viajes$edad >= 18 & Viajes$edad <= 35), "p5_15_02"] <- med_Micro_2
```

```{r}
med_Micro_3 <- median(Viajes[Viajes$edad >= 35 & Viajes$edad <= 65, "p5_15_02"], na.rm = T)
med_Micro_3
       
Viajes[(is.na(Viajes$p5_15_02) & Viajes$edad > 35 & Viajes$edad <= 65), "p5_15_02"] <- med_Micro_3
```

```{r}
med_Micro_4 <- median(Viajes[Viajes$edad > 65, "p5_15_02"], na.rm = T)
med_Micro_4
       
Viajes[(is.na(Viajes$p5_15_02) & Viajes$edad > 65), "p5_15_02"] <- med_Micro_4

```

#### Todos los p5_15_algo voy a sustituir con medias dependiendo de la edad <18, 18-35, 35-65, >65. 

```{r}
med_TaxiApp_1 <- median(Viajes[Viajes$edad < 18, "p5_15_03"], na.rm = T)
med_TaxiApp_1

Viajes[(is.na(Viajes$p5_15_03) & Viajes$edad < 18), "p5_15_03"] <- med_TaxiApp_1

```


```{r}
med_TaxiApp_2 <- median(Viajes[Viajes$edad >= 18 & Viajes$edad <= 35, "p5_15_03"], na.rm = T)
med_TaxiApp_2


Viajes[(is.na(Viajes$p5_15_03) & Viajes$edad >= 18 & Viajes$edad <= 35), "p5_15_03"] <- med_TaxiApp_2
```

```{r}
med_TaxiApp_3 <- median(Viajes[Viajes$edad >= 35 & Viajes$edad <= 65, "p5_15_03"], na.rm = T)
med_TaxiApp_3
       
Viajes[(is.na(Viajes$p5_15_03) & Viajes$edad > 35 & Viajes$edad <= 65), "p5_15_03"] <- med_TaxiApp_3
```

```{r}
med_TaxiApp_4 <- median(Viajes[Viajes$edad > 65, "p5_15_03"], na.rm = T)
med_TaxiApp_4
       
Viajes[(is.na(Viajes$p5_15_03) & Viajes$edad > 65), "p5_15_03"] <- med_TaxiApp_4

```



```{r}
med_TaxiSitio_1 <- median(Viajes[Viajes$edad < 18, "p5_15_04"], na.rm = T)
med_TaxiSitio_1
Viajes[(is.na(Viajes$p5_15_04) & Viajes$edad < 18), "p5_15_04"] <- med_TaxiSitio_1
```

```{r}
med_TaxiSitio_2 <- median(Viajes[Viajes$edad >= 18 & Viajes$edad <= 35, "p5_15_04"], na.rm = T)
med_TaxiSitio_2


Viajes[(is.na(Viajes$p5_15_04) & Viajes$edad >= 18 & Viajes$edad <= 35), "p5_15_04"] <- med_TaxiSitio_2
```

```{r}
med_TaxiSitio_3 <- median(Viajes[Viajes$edad >= 35 & Viajes$edad <= 65, "p5_15_04"], na.rm = T)
med_TaxiSitio_3
       
Viajes[(is.na(Viajes$p5_15_04) & Viajes$edad > 35 & Viajes$edad <= 65), "p5_15_04"] <- med_TaxiSitio_3
```

```{r}
med_TaxiSitio_4 <- median(Viajes[Viajes$edad > 65, "p5_15_04"], na.rm = T)
med_TaxiSitio_4
       
Viajes[(is.na(Viajes$p5_15_04) & Viajes$edad > 65), "p5_15_04"] <- med_TaxiSitio_4

```




```{r}
med_Metro_1 <- median(Viajes[Viajes$edad < 18, "p5_15_05"], na.rm = T)
med_Metro_1
Viajes[(is.na(Viajes$p5_15_05) & Viajes$edad < 18), "p5_15_05"] <- med_Metro_1
```

```{r}
med_Metro_2 <- median(Viajes[Viajes$edad >= 18 & Viajes$edad <= 35, "p5_15_05"], na.rm = T)
med_Metro_2


Viajes[(is.na(Viajes$p5_15_05) & Viajes$edad >= 18 & Viajes$edad <= 35), "p5_15_05"] <- med_Metro_2
```

```{r}
med_Metro_3 <- median(Viajes[Viajes$edad >= 35 & Viajes$edad <= 65, "p5_15_05"], na.rm = T)
med_Metro_3
       
Viajes[(is.na(Viajes$p5_15_05) & Viajes$edad > 35 & Viajes$edad <= 65), "p5_15_05"] <- med_Metro_3
```

```{r}
med_Metro_4 <- median(Viajes[Viajes$edad > 65, "p5_15_05"], na.rm = T)
med_Metro_4
       
Viajes[(is.na(Viajes$p5_15_05) & Viajes$edad > 65), "p5_15_05"] <- med_Metro_4

```




```{r}
med_RTP_1 <- median(Viajes[Viajes$edad < 18, "p5_15_06"], na.rm = T)
med_RTP_1
Viajes[(is.na(Viajes$p5_15_06) & Viajes$edad < 18), "p5_15_06"] <- med_RTP_1
```

```{r}
med_RTP_2 <- median(Viajes[Viajes$edad >= 18 & Viajes$edad <= 35, "p5_15_06"], na.rm = T)
med_RTP_2


Viajes[(is.na(Viajes$p5_15_06) & Viajes$edad >= 18 & Viajes$edad <= 35), "p5_15_06"] <- med_RTP_2
```

```{r}
med_RTP_3 <- median(Viajes[Viajes$edad >= 35 & Viajes$edad <= 65, "p5_15_06"], na.rm = T)
med_RTP_3
       
Viajes[(is.na(Viajes$p5_15_06) & Viajes$edad > 35 & Viajes$edad <= 65), "p5_15_06"] <- med_RTP_3
```

```{r}
med_RTP_4 <- median(Viajes[Viajes$edad > 65, "p5_15_06"], na.rm = T)
med_RTP_4
       
Viajes[(is.na(Viajes$p5_15_06) & Viajes$edad > 65), "p5_15_06"] <- med_RTP_4

```




```{r}
med_bici_1 <- median(Viajes[Viajes$edad < 18, "p5_15_07"], na.rm = T)
med_bici_1
Viajes[(is.na(Viajes$p5_15_07) & Viajes$edad < 18), "p5_15_07"] <- med_bici_1
```

```{r}
med_bici_2 <- median(Viajes[Viajes$edad >= 18 & Viajes$edad <= 35, "p5_15_07"], na.rm = T)
med_bici_2


Viajes[(is.na(Viajes$p5_15_07) & Viajes$edad >= 18 & Viajes$edad <= 35), "p5_15_07"] <- med_bici_2
```

```{r}
med_bici_3 <- median(Viajes[Viajes$edad >= 35 & Viajes$edad <= 65, "p5_15_07"], na.rm = T)
med_bici_3
       
Viajes[(is.na(Viajes$p5_15_07) & Viajes$edad > 35 & Viajes$edad <= 65), "p5_15_07"] <- med_bici_3
```

```{r}
med_bici_4 <- median(Viajes[Viajes$edad > 65, "p5_15_07"], na.rm = T)
med_bici_4
       
Viajes[(is.na(Viajes$p5_15_07) & Viajes$edad > 65), "p5_15_07"] <- med_bici_4

```





```{r}
med_bus_1 <- median(Viajes[Viajes$edad < 18, "p5_15_08"], na.rm = T)
med_bus_1
Viajes[(is.na(Viajes$p5_15_08) & Viajes$edad < 18), "p5_15_08"] <- med_bus_1
```

```{r}
med_bus_2 <- median(Viajes[Viajes$edad >= 18 & Viajes$edad <= 35, "p5_15_08"], na.rm = T)
med_bus_2


Viajes[(is.na(Viajes$p5_15_08) & Viajes$edad >= 18 & Viajes$edad <= 35), "p5_15_08"] <- med_bus_2
```

```{r}
med_bus_3 <- median(Viajes[Viajes$edad >= 35 & Viajes$edad <= 65, "p5_15_08"], na.rm = T)
med_bus_3
       
Viajes[(is.na(Viajes$p5_15_08) & Viajes$edad > 35 & Viajes$edad <= 65), "p5_15_08"] <- med_bus_3
```

```{r}
med_bus_4 <- median(Viajes[Viajes$edad > 65, "p5_15_08"], na.rm = T)
med_bus_4
       
Viajes[(is.na(Viajes$p5_15_08) & Viajes$edad > 65), "p5_15_08"] <- med_bus_4

```



```{r}
med_moto_1 <- median(Viajes[Viajes$edad < 18, "p5_15_09"], na.rm = T)
med_moto_1
Viajes[(is.na(Viajes$p5_15_09) & Viajes$edad < 18), "p5_15_09"] <- med_moto_1
```

```{r}
med_moto_2 <- median(Viajes[Viajes$edad >= 18 & Viajes$edad <= 35, "p5_15_09"], na.rm = T)
med_moto_2


Viajes[(is.na(Viajes$p5_15_09) & Viajes$edad >= 18 & Viajes$edad <= 35), "p5_15_09"] <- med_moto_2
```

```{r}
med_moto_3 <- median(Viajes[Viajes$edad >= 35 & Viajes$edad <= 65, "p5_15_09"], na.rm = T)
med_moto_3
       
Viajes[(is.na(Viajes$p5_15_09) & Viajes$edad > 35 & Viajes$edad <= 65), "p5_15_09"] <- med_moto_3
```

```{r}
med_moto_4 <- median(Viajes[Viajes$edad > 65, "p5_15_09"], na.rm = T)
med_moto_4
       
Viajes[(is.na(Viajes$p5_15_09) & Viajes$edad > 65), "p5_15_09"] <- med_moto_4

```




```{r}
med_Trole_1 <- median(Viajes[Viajes$edad < 18, "p5_15_10"], na.rm = T)
med_Trole_1
Viajes[(is.na(Viajes$p5_15_10) & Viajes$edad < 18), "p5_15_10"] <- med_Trole_1
```

```{r}
med_Trole_2 <- median(Viajes[Viajes$edad >= 18 & Viajes$edad <= 35, "p5_15_10"], na.rm = T)
med_Trole_2


Viajes[(is.na(Viajes$p5_15_10) & Viajes$edad >= 18 & Viajes$edad <= 35), "p5_15_10"] <- med_Trole_2
```

```{r}
med_Trole_3 <- median(Viajes[Viajes$edad >= 35 & Viajes$edad <= 65, "p5_15_10"], na.rm = T)
med_Trole_3
       
Viajes[(is.na(Viajes$p5_15_10) & Viajes$edad > 35 & Viajes$edad <= 65), "p5_15_10"] <- med_Trole_3
```

```{r}
med_Trole_4 <- median(Viajes[Viajes$edad > 65, "p5_15_10"], na.rm = T)
med_Trole_4
       
Viajes[(is.na(Viajes$p5_15_10) & Viajes$edad > 65), "p5_15_10"] <- med_Trole_4

```




```{r}
med_MMEXI_1 <- median(Viajes[Viajes$edad < 18, "p5_15_11"], na.rm = T)
med_MMEXI_1
Viajes[(is.na(Viajes$p5_15_11) & Viajes$edad < 18), "p5_15_11"] <- med_MMEXI_1
```

```{r}
med_MMEXI_2 <- median(Viajes[Viajes$edad >= 18 & Viajes$edad <= 35, "p5_15_11"], na.rm = T)
med_MMEXI_2


Viajes[(is.na(Viajes$p5_15_11) & Viajes$edad >= 18 & Viajes$edad <= 35), "p5_15_11"] <- med_MMEXI_2
```

```{r}
med_MMEXI_3 <- median(Viajes[Viajes$edad >= 35 & Viajes$edad <= 65, "p5_15_11"], na.rm = T)
med_MMEXI_3
       
Viajes[(is.na(Viajes$p5_15_11) & Viajes$edad > 35 & Viajes$edad <= 65), "p5_15_11"] <- med_MMEXI_3
```

```{r}
med_MMEXI_4 <- median(Viajes[Viajes$edad > 65, "p5_15_11"], na.rm = T)
med_MMEXI_4
       
Viajes[(is.na(Viajes$p5_15_11) & Viajes$edad > 65), "p5_15_11"] <- med_MMEXI_4

```


```{r}
med_Ligero_1 <- median(Viajes[Viajes$edad < 18, "p5_15_12"], na.rm = T)
med_Ligero_1
Viajes[(is.na(Viajes$p5_15_12) & Viajes$edad < 18), "p5_15_12"] <- med_Ligero_1
```

```{r}
med_Ligero_2 <- median(Viajes[Viajes$edad >= 18 & Viajes$edad <= 35, "p5_15_12"], na.rm = T)
med_Ligero_2


Viajes[(is.na(Viajes$p5_15_12) & Viajes$edad >= 18 & Viajes$edad <= 35), "p5_15_12"] <- med_Ligero_2
```

```{r}
med_Ligero_3 <- median(Viajes[Viajes$edad >= 35 & Viajes$edad <= 65, "p5_15_12"], na.rm = T)
med_Ligero_3
       
Viajes[(is.na(Viajes$p5_15_12) & Viajes$edad > 35 & Viajes$edad <= 65), "p5_15_12"] <- med_Ligero_3
```

```{r}
med_Ligero_4 <- median(Viajes[Viajes$edad > 65, "p5_15_12"], na.rm = T)
med_Ligero_4
       
Viajes[(is.na(Viajes$p5_15_12) & Viajes$edad > 65), "p5_15_12"] <- med_Ligero_4

```


```{r}
med_Suburbano_1 <- median(Viajes[Viajes$edad < 18, "p5_15_13"], na.rm = T)
med_Suburbano_1
Viajes[(is.na(Viajes$p5_15_13) & Viajes$edad < 18), "p5_15_13"] <- med_Suburbano_1
```

```{r}
med_Suburbano_2 <- median(Viajes[Viajes$edad >= 18 & Viajes$edad <= 35, "p5_15_13"], na.rm = T)
med_Suburbano_2


Viajes[(is.na(Viajes$p5_15_13) & Viajes$edad >= 18 & Viajes$edad <= 35), "p5_15_13"] <- med_Suburbano_2
```

```{r}
med_Suburbano_3 <- median(Viajes[Viajes$edad >= 35 & Viajes$edad <= 65, "p5_15_13"], na.rm = T)
med_Suburbano_3
       
Viajes[(is.na(Viajes$p5_15_13) & Viajes$edad > 35 & Viajes$edad <= 65), "p5_15_13"] <- med_Suburbano_3
```

```{r}
med_Suburbano_4 <- median(Viajes[Viajes$edad > 65, "p5_15_13"], na.rm = T)
med_Suburbano_4
       
Viajes[(is.na(Viajes$p5_15_13) & Viajes$edad > 65), "p5_15_13"] <- med_Suburbano_4

```


```{r}
med_Caminar_1 <- median(Viajes[Viajes$edad < 18, "p5_15_14"], na.rm = T)
med_Caminar_1
Viajes[(is.na(Viajes$p5_15_14) & Viajes$edad < 18), "p5_15_14"] <- med_Caminar_1
```

```{r}
med_Caminar_2 <- median(Viajes[Viajes$edad >= 18 & Viajes$edad <= 35, "p5_15_14"], na.rm = T)
med_Caminar_2


Viajes[(is.na(Viajes$p5_15_14) & Viajes$edad >= 18 & Viajes$edad <= 35), "p5_15_14"] <- med_Caminar_2
```

```{r}
med_Caminar_3 <- median(Viajes[Viajes$edad >= 35 & Viajes$edad <= 65, "p5_15_14"], na.rm = T)
med_Caminar_3
       
Viajes[(is.na(Viajes$p5_15_14) & Viajes$edad > 35 & Viajes$edad <= 65), "p5_15_14"] <- med_Caminar_3
```

```{r}
med_Caminar_4 <- median(Viajes[Viajes$edad > 65, "p5_15_14"], na.rm = T)
med_Caminar_4
       
Viajes[(is.na(Viajes$p5_15_14) & Viajes$edad > 65), "p5_15_14"] <- med_Caminar_4

```




```{r}
med_Mexicable_1 <- median(Viajes[Viajes$edad < 18, "p5_15_15"], na.rm = T)
med_Mexicable_1
Viajes[(is.na(Viajes$p5_15_15) & Viajes$edad < 18), "p5_15_15"] <- med_Mexicable_1
```

```{r}
med_Mexicable_2 <- median(Viajes[Viajes$edad >= 18 & Viajes$edad <= 35, "p5_15_15"], na.rm = T)
med_Mexicable_2


Viajes[(is.na(Viajes$p5_15_15) & Viajes$edad >= 18 & Viajes$edad <= 35), "p5_15_15"] <- med_Mexicable_2
```

```{r}
med_Mexicable_3 <- median(Viajes[Viajes$edad >= 35 & Viajes$edad <= 65, "p5_15_15"], na.rm = T)
med_Mexicable_3
       
Viajes[(is.na(Viajes$p5_15_15) & Viajes$edad > 35 & Viajes$edad <= 65), "p5_15_15"] <- med_Mexicable_3
```

```{r}
med_Mexicable_4 <- median(Viajes[Viajes$edad > 65, "p5_15_15"], na.rm = T)
med_Mexicable_4
       
Viajes[(is.na(Viajes$p5_15_15) & Viajes$edad > 65), "p5_15_15"] <- med_Mexicable_4

```


```{r}
med_Bicitaxi_1 <- median(Viajes[Viajes$edad < 18, "p5_15_16"], na.rm = T)
med_Bicitaxi_1
Viajes[(is.na(Viajes$p5_15_16) & Viajes$edad < 18), "p5_15_16"] <- med_Bicitaxi_1
```

```{r}
med_Bicitaxi_2 <- median(Viajes[Viajes$edad >= 18 & Viajes$edad <= 35, "p5_15_16"], na.rm = T)
med_Bicitaxi_2


Viajes[(is.na(Viajes$p5_15_16) & Viajes$edad >= 18 & Viajes$edad <= 35), "p5_15_16"] <- med_Bicitaxi_2
```

```{r}
med_Bicitaxi_3 <- median(Viajes[Viajes$edad >= 35 & Viajes$edad <= 65, "p5_15_16"], na.rm = T)
med_Bicitaxi_3
       
Viajes[(is.na(Viajes$p5_15_16) & Viajes$edad > 35 & Viajes$edad <= 65), "p5_15_16"] <- med_Bicitaxi_3
```

```{r}
med_Bicitaxi_4 <- median(Viajes[Viajes$edad > 65, "p5_15_16"], na.rm = T)
med_Bicitaxi_4
       
Viajes[(is.na(Viajes$p5_15_16) & Viajes$edad > 65), "p5_15_16"] <- med_Bicitaxi_4

```


```{r}
med_Mototaxi_1 <- median(Viajes[Viajes$edad < 18, "p5_15_17"], na.rm = T)
med_Mototaxi_1
Viajes[(is.na(Viajes$p5_15_17) & Viajes$edad < 18), "p5_15_17"] <- med_Mototaxi_1
```

```{r}
med_Mototaxi_2 <- median(Viajes[Viajes$edad >= 18 & Viajes$edad <= 35, "p5_15_17"], na.rm = T)
med_Mototaxi_2


Viajes[(is.na(Viajes$p5_15_17) & Viajes$edad >= 18 & Viajes$edad <= 35), "p5_15_17"] <- med_Mototaxi_2
```

```{r}
med_Mototaxi_3 <- median(Viajes[Viajes$edad >= 35 & Viajes$edad <= 65, "p5_15_17"], na.rm = T)
med_Mototaxi_3
       
Viajes[(is.na(Viajes$p5_15_17) & Viajes$edad > 35 & Viajes$edad <= 65), "p5_15_17"] <- med_Mototaxi_3
```

```{r}
med_Mototaxi_4 <- median(Viajes[Viajes$edad > 65, "p5_15_17"], na.rm = T)
med_Mototaxi_4
       
Viajes[(is.na(Viajes$p5_15_17) & Viajes$edad > 65), "p5_15_17"] <- med_Mototaxi_4

```


```{r}
med_Escolar_1 <- median(Viajes[Viajes$edad < 18, "p5_15_18"], na.rm = T)
med_Escolar_1
Viajes[(is.na(Viajes$p5_15_18) & Viajes$edad < 18), "p5_15_18"] <- med_Escolar_1
```

```{r}
med_Escolar_2 <- median(Viajes[Viajes$edad >= 18 & Viajes$edad <= 35, "p5_15_18"], na.rm = T)
med_Escolar_2


Viajes[(is.na(Viajes$p5_15_18) & Viajes$edad >= 18 & Viajes$edad <= 35), "p5_15_18"] <- med_Escolar_2
```

```{r}
med_Escolar_3 <- median(Viajes[Viajes$edad >= 35 & Viajes$edad <= 65, "p5_15_18"], na.rm = T)
med_Escolar_3
       
Viajes[(is.na(Viajes$p5_15_18) & Viajes$edad > 35 & Viajes$edad <= 65), "p5_15_18"] <- med_Escolar_3
```

```{r}
med_Escolar_4 <- median(Viajes[Viajes$edad > 65, "p5_15_18"], na.rm = T)
med_Escolar_4
       
Viajes[(is.na(Viajes$p5_15_18) & Viajes$edad > 65), "p5_15_18"] <- med_Escolar_4

```


```{r}
med_Personal_1 <- median(Viajes[Viajes$edad < 18, "p5_15_19"], na.rm = T)
med_Personal_1
Viajes[(is.na(Viajes$p5_15_19) & Viajes$edad < 18), "p5_15_19"] <- med_Personal_1
```

```{r}
med_Personal_2 <- median(Viajes[Viajes$edad >= 18 & Viajes$edad <= 35, "p5_15_19"], na.rm = T)
med_Personal_2


Viajes[(is.na(Viajes$p5_15_19) & Viajes$edad >= 18 & Viajes$edad <= 35), "p5_15_19"] <- med_Personal_2
```

```{r}
med_Personal_3 <- median(Viajes[Viajes$edad >= 35 & Viajes$edad <= 65, "p5_15_19"], na.rm = T)
med_Personal_3
       
Viajes[(is.na(Viajes$p5_15_19) & Viajes$edad > 35 & Viajes$edad <= 65), "p5_15_19"] <- med_Personal_3
```

```{r}
med_Personal_4 <- median(Viajes[Viajes$edad > 65, "p5_15_19"], na.rm = T)
med_Personal_4
       
Viajes[(is.na(Viajes$p5_15_19) & Viajes$edad > 65), "p5_15_19"] <- med_Personal_4

```


```{r}
med_Otro_1 <- median(Viajes[Viajes$edad < 18, "p5_15_20"], na.rm = T)
med_Otro_1
Viajes[(is.na(Viajes$p5_15_20) & Viajes$edad < 18), "p5_15_20"] <- med_Otro_1
```

```{r}
med_Otro_2 <- median(Viajes[Viajes$edad >= 18 & Viajes$edad <= 35, "p5_15_20"], na.rm = T)
med_Otro_2


Viajes[(is.na(Viajes$p5_15_20) & Viajes$edad >= 18 & Viajes$edad <= 35), "p5_15_20"] <- med_Otro_2
```

```{r}
med_Otro_3 <- median(Viajes[Viajes$edad >= 35 & Viajes$edad <= 65, "p5_15_20"], na.rm = T)
med_Otro_3
       
Viajes[(is.na(Viajes$p5_15_20) & Viajes$edad > 35 & Viajes$edad <= 65), "p5_15_20"] <- med_Otro_3
```

```{r}
med_Otro_4 <- median(Viajes[Viajes$edad > 65, "p5_15_20"], na.rm = T)
med_Otro_4
       
Viajes[(is.na(Viajes$p5_15_20) & Viajes$edad > 65), "p5_15_20"] <- med_Otro_4

```


##### Para medianas de cuantas personas lo hago por tipo de transporte

```{r}
str(Viajes)

med_Personas_1 <- median(Viajes[Viajes$p5_14_01 == 1, "p5_19"], na.rm = T)
med_Personas_1
Viajes[(is.na(Viajes$p5_19) & Viajes$p5_14_01 == 1), "p5_19"] <- med_Personas_1
```

```{r}
med_Personas_2 <- median(Viajes[Viajes$p5_14_02 == 1, "p5_19"], na.rm = T)
med_Personas_2

Viajes[(is.na(Viajes$p5_19) & Viajes$p5_14_02 == 1), "p5_19"] <- med_Personas_2
```

```{r}
med_Personas_3 <- median(Viajes[Viajes$p5_14_03 == 1, "p5_19"], na.rm = T)
med_Personas_3

Viajes[(is.na(Viajes$p5_19) & Viajes$p5_14_03 == 1), "p5_19"] <- med_Personas_3
```

```{r}
med_Personas_4 <- median(Viajes[Viajes$p5_14_04 == 1, "p5_19"], na.rm = T)
med_Personas_4

Viajes[(is.na(Viajes$p5_19) & Viajes$p5_14_04 == 1), "p5_19"] <- med_Personas_4
```

```{r}
med_Personas_5 <- median(Viajes[Viajes$p5_14_05 == 1, "p5_19"], na.rm = T)
med_Personas_5

Viajes[(is.na(Viajes$p5_19) & Viajes$p5_14_05 == 1), "p5_19"] <- med_Personas_5
```

```{r}
med_Personas_6 <- median(Viajes[Viajes$p5_14_06 == 1, "p5_19"], na.rm = T)
med_Personas_6

Viajes[(is.na(Viajes$p5_19) & Viajes$p5_14_06 == 1), "p5_19"] <- med_Personas_6
```

```{r}
med_Personas_7 <- median(Viajes[Viajes$p5_14_07 == 1, "p5_19"], na.rm = T)
med_Personas_7

Viajes[(is.na(Viajes$p5_19) & Viajes$p5_14_07 == 1), "p5_19"] <- med_Personas_7
```

```{r}
med_Personas_8 <- median(Viajes[Viajes$p5_14_08 == 1, "p5_19"], na.rm = T)
med_Personas_8

Viajes[(is.na(Viajes$p5_19) & Viajes$p5_14_08 == 1), "p5_19"] <- med_Personas_8
```

```{r}
med_Personas_9 <- median(Viajes[Viajes$p5_14_09 == 1, "p5_19"], na.rm = T)
med_Personas_9

Viajes[(is.na(Viajes$p5_19) & Viajes$p5_14_09 == 1), "p5_19"] <- med_Personas_9
```

```{r}
med_Personas_10 <- median(Viajes[Viajes$p5_14_10 == 1, "p5_19"], na.rm = T)
med_Personas_10

Viajes[(is.na(Viajes$p5_19) & Viajes$p5_14_10 == 1), "p5_19"] <- med_Personas_10
```

```{r}
med_Personas_11 <- median(Viajes[Viajes$p5_14_11 == 1, "p5_19"], na.rm = T)
med_Personas_11

Viajes[(is.na(Viajes$p5_19) & Viajes$p5_14_11 == 1), "p5_19"] <- med_Personas_11
```

```{r}
med_Personas_12 <- median(Viajes[Viajes$p5_14_12 == 1, "p5_19"], na.rm = T)
med_Personas_12

Viajes[(is.na(Viajes$p5_19) & Viajes$p5_14_12 == 1), "p5_19"] <- med_Personas_12
```

```{r}
med_Personas_13 <- median(Viajes[Viajes$p5_14_13 == 1, "p5_19"], na.rm = T)
med_Personas_13

Viajes[(is.na(Viajes$p5_19) & Viajes$p5_14_13 == 1), "p5_19"] <- med_Personas_13
```

```{r}
med_Personas_14 <- median(Viajes[Viajes$p5_14_14 == 1, "p5_19"], na.rm = T)
med_Personas_14

Viajes[(is.na(Viajes$p5_19) & Viajes$p5_14_14 == 1), "p5_19"] <- med_Personas_14
```

```{r}
med_Personas_15 <- median(Viajes[Viajes$p5_14_15 == 1, "p5_19"], na.rm = T)
med_Personas_15

Viajes[(is.na(Viajes$p5_19) & Viajes$p5_14_15 == 1), "p5_19"] <- med_Personas_15
```

```{r}
med_Personas_16 <- median(Viajes[Viajes$p5_14_16 == 1, "p5_19"], na.rm = T)
med_Personas_16

Viajes[(is.na(Viajes$p5_19) & Viajes$p5_14_16 == 1), "p5_19"] <- med_Personas_16
```

```{r}
med_Personas_17 <- median(Viajes[Viajes$p5_14_17 == 1, "p5_19"], na.rm = T)
med_Personas_17

Viajes[(is.na(Viajes$p5_19) & Viajes$p5_14_17 == 1), "p5_19"] <- med_Personas_17
```

```{r}
med_Personas_18 <- median(Viajes[Viajes$p5_14_18 == 1, "p5_19"], na.rm = T)
med_Personas_18

Viajes[(is.na(Viajes$p5_19) & Viajes$p5_14_18 == 1), "p5_19"] <- med_Personas_18
```

```{r}
med_Personas_19 <- median(Viajes[Viajes$p5_14_19 == 1, "p5_19"], na.rm = T)
med_Personas_19

Viajes[(is.na(Viajes$p5_19) & Viajes$p5_14_19 == 1), "p5_19"] <- med_Personas_19
```

```{r}
med_Personas_20 <- median(Viajes[Viajes$p5_14_20 == 1, "p5_19"], na.rm = T)
med_Personas_20

Viajes[(is.na(Viajes$p5_19) & Viajes$p5_14_20 == 1), "p5_19"] <- med_Personas_20
```


```{r}
Viajes[!complete.cases(Viajes),]
str(Viajes)
summary(Viajes)

```

#### De las que se puede hacer algo faltan: p5_21_1, p5_21_2, p5_23.

##### Para la p5_21_1 voy a hacer la mediana de solo los que condujeron

```{r}

med_estacionar <- median(Viajes[Viajes$p5_18 == 1, "p5_21_1"], na.rm = T)
med_estacionar

# Viajes[(is.na(Viajes$p5_21_1) & Viajes$p5_18 == 1), "p5_21_1"] <- med_estacionar  
# Quien sabe porque no me sirve este

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

