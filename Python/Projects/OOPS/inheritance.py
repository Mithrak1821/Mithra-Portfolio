class person:
    def __init__(self,name,email):
                 self.name=name 
                 self.email=email 
                 

class student:
    def __init__(self,name,email,dept):
          super().__init__(name,email)
          self.dept=dept

class Teacher:
    def __init__(self,name,email,dept,subjects_handled):
          super().__init__(name,email,dept)
          self.subjects_handled=subjects_handled