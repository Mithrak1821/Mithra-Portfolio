class student:
    def __init__(self,name,attendance):
       self.name=name 
       #protect
       
       self._attendance=attendance
       #0-100

    def attendance(self,value):
        if 0<=value<=100:
            self._attendance=value
        else:
            raise ValueError("Enter valid Attendance Ranging from 0 to 100")
       #when needed,display(getter)

    def attendance(self):
        return self._attendance
    
    def display(self):
        return f"student name:{self.name}\n Attendance"

std1=student("Mithra",900)
print(std1.attendance())


    