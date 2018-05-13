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
    sql = <<-SQL
    CREATE TABLE students(id integer PRIMARY KEY, name TEXT, grade integer)
    SQL
    DB[:conn].execute(sql)
  end 
  
  def self.drop_table
    DB[:conn].execute("DROP TABLE students;")
  end
  
  def self.save
    sql = <<-SQL
    INSERT INTO students(name, grade) VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.grade)
    DB[:conn].execute("SELECT last_insert_rowid() ")
  end 
end
