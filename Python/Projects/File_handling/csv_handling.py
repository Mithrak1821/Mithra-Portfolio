import csv

# with open(r"C:\Users\mithr\OneDrive\ANUDIP Training\Mithra K (batch 3)\Python\Projects\File_handling\data.csv","a",newline="")as file:
    # reader=csv.reader(file)
    # for row in reader:
    #     print(row)
    # print(file)
    # reader=csv.DictReader(file)
    # for row in reader:
    #     print(row["Dept"])

    # writer=csv.writer(file)   
    # writer.writerow(["Sujitha","CSE"]) 

# To write multiple rows
# with open(r"C:\Users\mithr\OneDrive\ANUDIP Training\Mithra K (batch 3)\Python\Projects\File_handling\data.csv","a",newline="")as file:
#     writer=csv.writer(file)
#     writer.writerows([["Jai", "Mech"],["Ganesh","Mech"]])
# Using dict writer
with open(r"C:\Users\mithr\OneDrive\ANUDIP Training\Mithra K (batch 3)\Python\Projects\File_handling\data.csv","a",newline="")as file:
    header_rows=["Name","Dept"]
    writer=csv.DictWriter(file,fieldnames=header_rows)
    writer.writeheader()
    writer.writerow({"Name":"Pavithra","Dept":"CSE"})

