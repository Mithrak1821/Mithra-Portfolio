class student:
    def __init__(self,name,id,dept,marks):
        self.name=name
        self.id=id
        self.dept=dept
        self.marks=marks
        self.att=0

    def display(self):
        return f"Name:{self.name}\n ID:{self.id} \n Department:{self.dept} \n Marks:{self.marks} \n Attendance:{self.att}"

    def average(self):
        return f"Average:{sum(self.marks)//len(self.marks)}"


    
 
        
    
std1=student("Arun","CS101","CSE",[89,90,89])
std2=student("Varun","IT101","IT",[90,99,89])
print(std1.display())
print(std1.average()) 

