class Member 
  attr_reader :id, :name, :photo, :allies, :enemies
  
  def initialize(data)
    @id = data[:_id]
    @name = data[:name]
    @photo = data[:photoUrl]
    @allies = data[:allies]
    @enemies = data[:enemies]
  end
end