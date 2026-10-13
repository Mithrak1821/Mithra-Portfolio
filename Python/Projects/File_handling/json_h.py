import json

# # to load and display data
# with open(r"C:\Users\mithr\OneDrive\ANUDIP Training\Mithra K (batch 3)\Python\Projects\File_handling\std_data.json","r") as j_file:
#    student=json.load(j_file)
#    print(student)

stds={
    1:{
        
    }
}
with open(r"C:\Users\mithr\OneDrive\ANUDIP Training\Mithra K (batch 3)\Python\Projects\File_handling\std_data.json","a") as json_h:

    student=json.dump(stds,json_h,indent=2)
    print(student)
