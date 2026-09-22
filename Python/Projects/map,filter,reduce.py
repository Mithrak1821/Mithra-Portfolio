#1. Add 5 marks to every student
# marks = [40,50,60,70]
# result = list(map(lambda x:x+5,marks))
# print(result)

#2. Increase every price by 10%
# prices=[100,200,300]
# result=list(map(lambda x:x*1.10,prices))
# print(result)

# syntax error
# prices=[100,200,300]
# result=list(map(lambda (x):x*1.10,prices))
# print(result)

# TypeError: int() argument must be a string, a bytes-like object or a real number, not 'list'
# prices=[100,200,300]
# result=list(map(lambda x:x*1.10,prices))
# print(int(result))


#3. find only even numbers
# numbers = [1,2,3,4,5,6]
# even=[]
# even=list(filter(lambda x:x%2==0,numbers))
# print (even)

#4.discounted by 10%
# prices = [100,200,300]
# discounted = list(map(lambda x:int(x*0.9),prices))
# print(discounted)

#5.increase every price by 10%
# prices=[100,200,300]
# result=list(map(lambda x:int(x*1.10),prices))
# print(result)

# #6.filter example-condition<500
# prices = [200,750,450,1000]
# result = list(filter(lambda x:x<500,prices))
# print(result)

