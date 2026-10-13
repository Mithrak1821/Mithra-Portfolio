# try:
#     age=int(input("Enter age:"))
#     print(age)

# except ValueError:
#     print("please enter data in numbers")

#input=20; output=20
#input=twenty; output=ValueError: invalid literal for int() with base 10: 'twenty'

#file not found
# try:
#     with open(r"student.txt","r") as file:
#         file.read()
# except FileNotFoundError:
#     print("file does not exist. create file")

#permission error. #icacls "C:\Users\mithr\OneDrive\ANUDIP Training\Mithra K (batch 3)\Python\Projects\Exceptions\exc.csv"/deny "$env:USERNAME`:R"
# try:
#     with open(r"C:\Users\mithr\OneDrive\ANUDIP Training\Mithra K (batch 3)\Python\Projects\Exceptions\exc.csv","r") as file:
#         print(file.read())
# except PermissionError:
#     print("Read only access.permission denied")

# File error:
# File not found
# Permission error
# FileExists error - when file is already exist and you try to create new file it shows this error
# IsADirectory error - tried to open directory as a file

# # When we dont know what is the error so we can use just except

# try:
#     age=int(input("Enter age: "))
#     print(age)
# except:
#     print("Please enter a age in numbers")

# # else - when the try is success the else block will be executed or else. When the try is failed then else bock will not be executed
# try:
#     age=int(input("Enter age: "))

# except ValueError:
#     print("Please enter a age in numbers")

# else:
#     print("Please enter a valid number")

# # finally- It executes always
# try:
#     age=int(input("Enter age: "))
#     print(age)

# except:
#     print("Please enter a age in numbers")

# finally:
#     print("Success")

# using both else and except
# try:
#     att = float(input("Enter attendance:"))
#     if 0 <= att <= 100:
#         print(att)
#     else:
#         print("Invalid attendance")
# except ValueError:
#     print("enter attendance in number")


# To run the prgm continuously used while true
# while True:
#     try:
#         att = float(input("Enter attendance:"))
#         if not 0 <= att <= 100:
#             print("kindly enter attendance between 0-100")
#         else:
#             print("attendance",att)
#     except ValueError:
#         print("Invalid attendance")

#To stop the prgm used break