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

```{r}
setwd("~/")

library(readr)
Hogar <- read_csv("thogar_eod2017/conjunto_de_datos/thogar.csv")
Vivienda <- read_csv("tvivienda_eod2017/conjunto_de_datos/tvivienda.csv")
PerfilSociodemografico <- read_csv("tsdem_eod2017/conjunto_de_datos/tsdem.csv")
Viajes <- read_csv("tviaje_eod2017/conjunto_de_datos/tviaje.csv")
Transporte <- read_csv("ttransporte_eod2017/conjunto_de_datos/ttransporte.csv")

```


### Explorar bases de datos Hogar
```{r}
head(Hogar)
tail(Hogar)
str(Hogar)
summary(Hogar)
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
