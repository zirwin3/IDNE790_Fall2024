# -*- coding: utf-8 -*-
"""
Created on Thu Nov 21 12:34:16 2024

@author: irwin
"""

x = 11
# here, we're testing code blocks and indents:
"""
    this
is
      a 
                  multiline
                  comment
"""
if x == 11:
    print("x = 11")
    x = 100
    if x/2 > 5:  # testing what half of x is
        print("half of x is more than five")
    print("this is in the original code block")    
elif x == 12:
    print("x == 12")
else:
    print("X is something else")
    
#%%    
    
def myfunction(input1, input2):
    x = input1 + input2
    return x**2

print("the return value of myfunction is: ", myfunction(100, -1))
    
#%% tuple vs list

x = [1, 2, 3, 4, 0, -1, 1000]
#x(1)
print(x[0])
print(x[1])
print(x[-1])
x[2] = 0
#x[2:5] = [-1, -1, -1]
# x[2:5] = [-1]*3

x[2:5] = list(range(1, 6, 2))

y = (1, 2, 3, 4, 0, -1, 1000)
print("tuple:", y[0])
print("tuple:", y[0:4])
z = y[0:4]
y[0] = 1

#%%
# z = x+y
x = [0, -1, 2, 200, -1000]
y = [-10, 100, 2, 0, 0]
z = [0]*len(x)
for i in range(0,len(x)):
    z[i] = x[i] + y[i]
    #print("sum =", x[i] + y[i])
print("z = ", z)

#%%

# C = A + B
""" This function will NOT change the inputs """
def Union(A, B):
    #C = A + B
    C = A
    for i in B:
        C.append(i)
        
    return C


A = [1, 2, 3]
B = [4, 5, 6]
print(A)
print(Union(A, B))
print(A)

#%%

def UniqueUnion(A, B):
    C = [A[0]]
    for i in range(1, len(A)):
        if not A[i] in C:
            C.append(A[i])
            
    for i in range(0, len(B)):
        if not B[i] in C:
            C.append(B[i])
            
    return C

A = [1, 2, 6]
B = [2, 5, 6]
print(UniqueUnion(A, B))