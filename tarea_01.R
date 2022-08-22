pullIn_data('csv')
cars <- pullIn_data_csv("cars_est_int","input",1)

# 1.-¿Cuántas filas tiene?
nrow(cars) # <- 428
# 2.-¿Cuántas columnas tiene?
ncol(cars) # <- 19

# 3.- ¿Cuáles son los diferentes valores de la columna de número de cilindros (cylenders)?
table(cars$cylenders) 
  
# 4.- ¿Cuál es el valor promedio de los caballos de fuerza (horsepower)? Sugerencia: Recuerda la función summary()
mean(cars$horsepower) # <- 210
summary(cars$horsepower)

# 5.- ¿Cuál es el valor máximo de los caballos de fuerza?
max(cars$horsepower) # <- 500

# 6.-¿Cuál es el auto más costoso (dealer cost)?

cars[cars$Dealer_Cost==max(cars$Dealer_Cost),c('name')] #<- "Porsche 911 GT2 2dr"

# 7.- Cambia el nombre de la columna name por car_name.
names(cars)[1] <- "car_name"
names(cars)

# 8.- Crea un nuevo dataframe formado por las columnas del nombre del
# automóvil y su precio. Llama car_pricing a esta nueva tabla.
cars_2 <- cars[,c('car_name','Price')]
head(cars_2,5)

# 9.- Añade una columna llamada category que indique BAJO si el precio
# es menor a 20,000; que indique MODERADO si el precio es mayor o
# igual a 20,000 pero menor que 35,000; y que indique ALTO si el precio
# es mayor que 35,000.
cars$category <- ifelse(cars$Price<20000,"BAJO",ifelse(cars$Price>=20000 & cars$Price <=35000,"MODERADO","ALTO"))
head(cars[,c('Price','category')],10)


# 10.- ¿Cuántos automóviles son de categoría baja, moderada e intermedia?
table(cars$category)

