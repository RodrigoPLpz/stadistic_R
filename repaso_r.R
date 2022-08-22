# getwd()
# setwd("E:/scidata/int_std/estadistica")
# ]dir()

pullIn_data("csv")
# online_retail <- read.csv("input/online_retail2.csv")
online_retail <- pullIn_data_csv("online_retail2","input",1)
View(online_retail)

head(online_retail,5)
tail(online_retail,5)

names(online_retail)
names(online_retail)[1] <- "Factura"
names(online_retail)

online_retail$Factura

str(online_retail)
nrow(online_retail)
ncol(online_retail)
dim(online_retail)


unique(online_retail$Country)
table(online_retail$Country)
sort(table(online_retail$Country))
sort(table(online_retail$Country), decreasing = TRUE)


dataframe_paises <- as.data.frame(table(online_retail$Country))

names(dataframe_paises) <- c("Pais","Frecuencia")

dataframe_paises$fre_por <- round(dataframe_paises$Frecuencia * 100 / nrow(online_retail),2)

dataframe_paises


nvo_df <- data.frame(col1 = c(1,6,8,-2),
                     col2=c("Luis","Hugo","Jose","Juan"),
                     color = c('Rojo',"Verde","Verde","Rojo"))
nvo_df

write.csv(nvo_df,"output/nvo_df.csv",row.names = FALSE)
# online_retail[filas,columnas]
online_retail[100:500,]
online_retail[c(1,5,1000),]

online_retail[,c('Factura','Price')]
online_retail[c(1,5,1000),c(2,5,7)]
online_retail[,c(2,5,7)]

online_retail[online_retail$Country=='France',]

online_retail[online_retail$Price < 0,]
online_retail[online_retail$Price < 0,] <- 0
online_retail[online_retail$Price < 0,]

View(online_retail[online_retail$Country=='France',-c(2,4)])
tbl_francia_sin_col <- online_retail[online_retail$Country=='France',-c(2,4)]
View(tbl_francia_sin_col)

summary(online_retail)
summary(online_retail$Quantity)


# Agregar una columna al data frame de la lámina C01.2 de tal manera que indique TRUE si el país del cliente es Brasil
# Y FALSE en caso contrario

online_retail$Brazil <- ifelse(online_retail$Country == "Brazil",TRUE,FALSE)

online_retail$Brasileiro <- ifelse(online_retail$Country == "Brazil",'Yes','No')

write.csv(online_retail,"output/countrys.csv", row.names = FALSE)


Luis <- 32
Sara <- 25
Omar <- 21
Miguel <- 12
Raul <- 2

Luis < 32
Luis > 32
Luis <= 32
Luis == 32
Luis != 32


# Luis es menor que 40 y Omar es mayor o igual a 10
Luis < 40 & Omar >= 10
# Miguel es mayor que 40 y Luis es menor que 40
Miguel > 15 | Luis < 40
# Raul es 2 y Sara es menor que 10
Raul == 2 & Sara < 10
# Raul es 2 y Sara es menor que 10, o Miguel es diferente de 15

(Raul == 2 & Sara < 10) | Miguel != 15
# Añadir una columna que indique "EXTREMO" si los precios están por debajo del primer cuantil y por arriba del tercer cuantil,
# y que indique "USUAL" en caso contrario. ¿Cuántos hay de cada tipo?
# no es posible que un numero sea menor que 1.25 y mayor 4.15 la preposicion es O
online_retail$price_quantil = ifelse((online_retail$Price < summary(online_retail$Price)[2]) | 
                                       (online_retail$Price > summary(online_retail$Price)[5]),'EXTREMO',"USUAL")
ncol(online_retail)
online_retail = online_retail[,-c(11)]
online_retail 

table(online_retail$price_quantil)
nrow(online_retail)

# Añadir una columna que indique "BAJO" si las cantidades son menores o iguales que el primer cuantil; "MEDIO" si las cantidades
# se ubican entre el primer cuantil y menores o iguales que el tercero; y "ALTO" si las cantidades sobrepasan el tercer cuantil
online_retail$Quantity_range = ifelse(online_retail$Quantity <= summary(online_retail$Quantity)[2],'BAJO',
                                      ifelse(online_retail$Quantity > summary(online_retail$Quantity)[2] &
                                               online_retail$Quantity<= summary(online_retail$Quantity)[5] ,'MEDIO',"ALTO"))

online_retail
