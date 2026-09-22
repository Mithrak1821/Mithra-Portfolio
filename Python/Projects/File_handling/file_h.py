# ct=3
# while ct>=0:
#     std=input("Enter your name:")
#     ct-=1
# file=open(r"C:\Users\mithr\OneDrive\ANUDIP Training\Mithra K (batch 3)\Python\Projects\File_handling\students.txt","r")
# print(file.read())

# with open(r"C:\Users\mithr\OneDrive\ANUDIP Training\Mithra K (batch 3)\Python\Projects\File_handling\students.txt","r") as file:
#     content=file.read()
#     print(content)

with open(r"C:\Users\mithr\OneDrive\ANUDIP Training\Mithra K (batch 3)\Python\Projects\File_handling\students.txt","r") as file:
    file.write("sujitha")
    content=file.read()
    print(content)    
