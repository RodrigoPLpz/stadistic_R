# Sesión 04

pullIn_data("csv")
# online_retail <- read.csv("input/online_retail2.csv")
online_retail <- pullIn_data_csv("online_retail2","input",1)

names(online_retail)

# Medidas de tendencia central
# Valores promedio (media aritmetica)
# Obteniendo el valor promedio
mean(online_retail$Price)

otro_data <- data.frame(col1=c(1,5,2,8,9,NA,15,0),
                        col2=c(2001:2007,0),
                        col3=letters[1:8])
otro_data
otro_data$col2[otro_data$col2 != 0]
mean(otro_data$col2[otro_data$col2 != 0])


# Aplicando promedio a una columan con valores NA  <-  un "NA"
mean(otro_data$col1) 

# Aplicando promedio a una columan con valores NA  pero se especificando un atributo
# que especifique que no tome en cuenta NA <-  numero (promedio) 
mean(otro_data$col1, na.rm=TRUE) 

# Aplicando promedio a una columna con valores string <- no se puede aplicar promedio
mean(otro_data$col3)

# Sacar el promedio de cada una de als columnas de un dataframe
colMeans(otro_data[,1:2],na.rm=TRUE)

# Medidas de partición
datos <- otro_data$col1[!is.na(otro_data$col1 )]
datos
# Mediana 
sort(datos)
median(datos)

median(online_retail$Price,na.rm=TRUE)
# Que valores son mas pequeños o iguales que 2.1
table(online_retail$Price<=2.1)
# Se esperaría que estuviera balanceado pero no, hay una diferencia de 50k

# Quartiles

summary(online_retail$Price)
quantile(online_retail$Price)
quantile(online_retail$Price, probs = seq(0,1,0.25))
# Percentiles (diez partes)
quantile(online_retail$Price, probs = seq(0,1,0.1))
# Percentiles (cien partes)
quantile(online_retail$Price, probs = seq(0,1,0.01))


# Moda . En R no hay función que calcule la moda por lo qeu se aplica un table y un max o sort para verificar
# el valor que más veces se repite
sort(table(online_retail$Country),decreasing = TRUE)
max(table(online_retail$Country))
which(table(online_retail$Country) == max(table(online_retail$Country)))

install.packages("modeest",dep=TRUE)
library(modeest)
mfv(c("a","a","b","b","a","c","b","b"))


# Rango. Es la distancia entre los valroes extremos
# rango bajo los valores se parecen mucho.
# rango alto muchas varicion en los datos. Hay que verifica los valores atipicos
max(online_retail$Price)-min(online_retail$Price)

# Desviación intercuartil. Que tanto se desvian lsod atos del 50 porciento de los datos
# Si la medidana de desviación es pequeña, tu representante de tendencia central es bueno
IQR(online_retail$Price) #(rango intercuantilico)
median(online_retail$Price)


