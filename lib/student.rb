class Student
  attr_accessor :name, :grade
  attr_reader :id 
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  def initialize(name:, grade:, id: nil)
    @name = name 
    @grade = grade 
    @id = id 
  end 
  
  def self.create_table
    DB[:conn].execute(
      "CREATE TABLE STUDENTS(id integer PRIMARY KEY, name TEXT, grade integer);")
  end 
  
  def self.drop_table
  end
end
