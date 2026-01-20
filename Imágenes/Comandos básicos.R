library(tidyverse)
library(tidymodels)

#--------------------------------------------------------------------------------------------------------------
#1. Comandos básicos

x = c(1,3,2,5) #se usa para concatenar/ se unen entre sí
x
y = c(1,4,3)
y
g = c(9,2,0,3)
g

length(x) #te da la longitud de los valores dentro de la función
length(y)

x+y #si los valores de cada variable no tienen la misma longitud no se pueden sumar
x+g

ls() #permite ver una lista de todos los objetos, datos y funciones guardadas
rm(y) #borra cualquier objeto, dato y/o función que no se quiera utilizar
rm(list = ls()) #reitera todos los objetos al mismo tiempo
ls()

z = matrix(data = c(1,2,3,4), nrow = 2, ncol= 2) #para elaborar una matriz se utiliza los datos (las entradas en la matriz), el número de filas y el número de columnas
z
matrix(z) #crea la matriz de números

z = matrix(c(1,2,3,4), 2, 2) #se puede generar la matriz sin  data=, nrow=, y ncol= en el comando matrix() 
matrix(z)

matrix (data=c(1,2,3,4) , nrow=2, ncol =2,byrow =TRUE) #Se puede utilizar la opción byrow=TRUE para rellenar la matriz en el orden de las filas.

sqrt(z) #devuelve la raíz cuadrada de cada elemento de un vector o matriz
z^2 #eleva cada elemento de x a la potencia 2; cualquier potencia es posible, incluyendo las potencias fraccionarias o negativas

x= rnorm(50) #genera un vector de variables normales aleatorias, con el primer argumento n el tamaño de la muestra. Cada vez que llamemos a esta función, obtendremos una respuesta diferente
y = x+rnorm(50, mean= 50, sd =.1) #creamos dos conjuntos de números correlacionados, x e y
cor(x,y) #usamos la función cor() para calcular la correlación entre las variables

#Por defecto, rnorm() crea variables aleatorias normales estándar con una media de 0 y una desviación estándar de 1. 
#Sin embargo, la media y la desviación estándar pueden ser alteradas usando los argumentos mean y sd, como se ilustra arriba.

set.seed(1303) #reproduce un mismo conjunto de números aleatorios
rnorm(50)

set.seed(3)
y = rnorm(100)
mean(y) #obtiene la media de un vector de números
var(y) #obtiene la varianza de un vector de números
sqrt(var(y)) #obtiene la raíz cuadrada de un vector de números
sd(y)#obtiene la desviación estándar de un vector de números

#--------------------------------------------------------------------------------------------------------------
#2. Gráficas

x=rnorm (100)
y=rnorm (100)
plot(x,y) #produce un diagrama de dispersión de los números en x frente a los números en y

plot(x,y,xlab="Este es el eje x",ylab="Este es el eje y",
     main="Plot de X vs Y") #Con xlab e ylab se obtendrá una etiqueta en el eje x e y

pdf ("Figure.pdf") #crea un pdf
plot(x,y,col ="green")
dev.off () #Indica a R que hemos terminado de crear el plot

x = seq (1 ,10) #seq() es usada para crear una secuencia de números
x

x = 1:10
x

x = seq(0 ,1 ,length =10)
x

x = seq(-pi ,pi ,length =50) #hace una secuencia de 50 números que están igualmente espaciados entre el valor pi y el valor pi
x

y = x
f= outer(x,y,function (x,y)cos(y)/(1+x^2))
contour (x,y,f) #produce un gráfico de contorno para representar datos tridimensionales; es como un mapa topográfico
contour (x,y,f,nlevels =45, add=T) 
#requiere tres argumentos:
#1)Un vector de los valores x (la primera dimensión),
#2)Un vector de los valores y (la segunda dimensión), y
#3)Una matriz cuyos elementos corresponden al valor z (la tercera dimensión) para cada par de coordenadas (x,y).

fa = (f-t(f))/2
contour (x,y,fa,nlevels =15)

image(x,y,fa)#funciona de la misma manera que contour(), excepto que produce un gráfico codificado por colores cuyos colores dependen del valor de z (Es un mapa de calor)

persp(x,y,fa) #gráfico de un plano tridimensional
persp(x,y,fa ,theta =30)
persp(x,y,fa ,theta =30, phi =20)
persp(x,y,fa ,theta =30, phi =70)
persp(x,y,fa ,theta =30, phi =40)

#--------------------------------------------------------------------------------------------------------------
#2.1 Gráficas con GGplot

x=rnorm (100)
y=rnorm (100)

data = data_frame(x,y)
ggplot(data = data, aes(x,y))+ geom_point()

data = data_frame(x,y)
ggplot(data = data, aes(x,y))+ geom_point()+ 
  xlab("Este es el eje x")+ylab("Este es el eje y")+ggtitle("Plot de X vs Y")


x = seq(-pi ,pi ,length =50) 
y = x

data = data_frame(x,y)
ggplot(data = data, aes(x=x, y=y))+geom_density_2d()

data = data_frame(x,y)
ggplot(data = data, aes(x=x, y=y))+geom_density_2d_filled()

#--------------------------------------------------------------------------------------------------------------
#3. Indexación de datos

A = matrix (1:16 ,4 ,4)
A

A[2,3] #Selecciona un elemento de la matriz (fila,columna)
A[c(1,3) ,c(2,4) ] #Selecciona filas y columnas de la matriz al mismo tiempo a partir de los vectores como índices [c(fila), c(columna)]

A[1:3 ,2:4] #selecciona un intervalo de vectores (inicio:fin) de filas y columnas
A[1:2 ,] #selecciona todos los valores de las filas 1 y 2
A[ ,1:2] #seleccionta todos los valores de las columnas 1 y 2
A[1,]
A[-c(1,3) ,]#El uso de un signo negativo - en el índice le dice a R que mantenga todas las filas o columnas excepto las indicadas en el índice
A[-c(1,3) ,-c(1,3,4)]

dim(A) #da como resultado el número de filas seguido por el número de columnas de una matriz dada

#--------------------------------------------------------------------------------------------------------------
#4. Cargar datos

auto = force(mtcars) #cargar datos de carros en R
auto
head(auto) #regresa las primeras o últimas partes de un vector, matriz, tabla, función o data frame.
dim(auto) #regresa la dimensión de un objeto (en este caso de la base de datos )

#--------------------------------------------------------------------------------------------------------------
#5. Resúmenes gráficos y números adicionales

plot(auto$cyl, auto$mpg ) #genera una gráfica de las variables de la base de datos de auto

attach(auto) #le dice a R que haga que las variables de este marco de datos estén disponibles por nombre
plot(cyl,mpg)

cylinders = as.factor(cyl) #convierte  las variables cuantitativas en variables cualitativas.
plot(cylinders,mpg) #se hace un boxplot debido a que la variable x es categórica
plot(cylinders,mpg, col="red") #se cambia de color el boxplot a rojo
plot(cylinders , mpg , col ="red", varwidth =T) #cambia el ancho del boxplot al hacerlo más delgado
plot(cylinders , mpg , col ="red", varwidth =T,horizontal =T) #cambia la orientación del boxplot de vertical a horizontal
plot(cylinders , mpg , col ="red", varwidth =T, xlab=" cylinders ",
     ylab ="MPG ") #cambia los títulos de los ejes


hist(mpg) #genera un histograma de la variable mpg
hist(mpg ,col =2) #cambia el color del histograma
hist(mpg ,col =2, breaks =15) #divide el histograma en 15 barras

#crea una matriz de diagramas de dispersión, es decir, un diagrama de dispersión para cada par de variables de un determinado subconjunto de datos
pairs(~ mpg + disp + hp + wt + qsec, auto) 

plot(hp,mpg)
identify(hp,mpg, Valiant) 
# identify proporciona un método interactivo útil para identificar el valor de una determinada variable para los puntos de un gráfico, 
# pasamos tres argumentos para identificar(): la variable del eje x, la variable del eje y y la variable cuyos valores queremos ver impresos para cada punto.

summary(auto) #produce un resumen numérico de cada variable de un determinado conjunto de datos
summary(mpg)

#--------------------------------------------------------------------------------------------------------------
#5.1 Resúmenes gráficos y números adicionales con GGplot

data = data_frame(cyl,mpg)
ggplot(data = data, aes(cyl,mpg))+ geom_point()

data = data_frame(cylinders,mpg) #con la transformación de variable que realizamos anteriormente, se generan los boxplots
ggplot(data = data, aes(cylinders,mpg))+ geom_boxplot()
ggplot(data = data, aes(cylinders,mpg))+ geom_boxplot(fill = "red") #cambia el color de las cajas de un boxplot
ggplot(data = data, aes(cylinders,mpg))+ geom_boxplot(fill = "red", varwidth = T) #adelgaza el ancho de las cajas de un boxplot
ggplot(data = data, aes(cylinders,mpg))+ geom_boxplot(fill = "red", varwidth = T)+coord_flip() #cambia de vertical a horizontal los boxplots
ggplot(data = data, aes(cylinders,mpg))+ geom_boxplot(fill = "red", varwidth = T)+labs(x="Cylinders", y="Mpg") #cambia el título de los ejes

ggplot(data = data, aes(mpg))+geom_histogram(bins= 5, color= "black") #genera un histograma de la variable mpg
ggplot(data = data, aes(mpg))+geom_histogram(bins= 5, color= "black",fill= "red" ) #cambia el color del histograma
ggplot(data = data, aes(mpg))+geom_histogram(bins= 15, color= "black",fill= "red" ) #divide el histograma en 15 barras

pairs(~ mpg + disp + hp + wt + qsec, auto) #matriz de diagramas de dispersión

ggplot(data = data, aes(hp,mpg))+ geom_point() #diagrama de dispersión de variables hp y mpg

ggplot(data = data, aes(hp,mpg, Valiant))+ geom_point() #diagrama de dispersión de una determinada variable

