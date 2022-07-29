#Operadores Racionales
#  >   MAYOR QUE
#  >   MENOR QUE 
#  >=  MAYOR E IGUAL QUE
#  <=  MENOR E IGUAL QUE
#  !=  DIFERENTE QUE
#  ==  IGUAL QUE

#not = Resta de 1 y 0 => True - False 
#and = multiplicacion de 1 y 0 => True * False
#or = suma de 1 y 0 => True + False

#Operadores Logicos

print("Operador and")
print(True and True) #True
print(True and False) #False
print(False and True) #False
print(False and False) #False
print(1 * 1) #1
print(1 * 0) #0
print(0 * 1) #0
print(0 * 0) #0

#or
print("Operador or")
print(True or True) #True
print(True or False) #True
print(False or True) #True 
print(False or False) #False

print(1 + 1) #1
print(1 + 0) #1
print(0 + 1) #1
print(0 + 0) #0

#not
print("Operador not")
#print(False not True) #False
#print(True not False) #True
print(0 - 1)
print(1 - 0)
print(not True)
print(not False)


#Operadores de Asignacion
#   += suma en asignacion
#   -= Resta en asignacion
#   *= multiplicacion en asignacion
#   /= divicion en asignacion
#   **= potencia en asignacion
#   %= modulo en asignacion

a = 0
a += 5 # ahora a vale 5
a -= 2 # ahora a vale 3
a *= 6 # ahora a vale 18
a /= 9 # ahora a vale 2
a **= 2 # ahora a vale 4
a %= 2
print(a)