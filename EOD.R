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
Vivienda[!complete.cases(Vivienda),]
```

### Explorar base de datos PerfilSociodemografico

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
Viajes[!complete.cases(Viajes),]
```

### Explorar base de datos Transporte

```{r}
head(Transporte)
tail(Transporte)
str(Transporte)
summary(Transporte)
Transporte[!complete.cases(Transporte),]

```

