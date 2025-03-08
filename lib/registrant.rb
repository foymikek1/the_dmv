class Registrant
  attr_reader :name, :age, :permit
  attr_accessor :liscence_data

  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @liscence_data = {:written=>false, :license=>false, :renewed=>false}
  end

  def permit?
    @permit
  end

  def earn_permit
    @permit = true
  end
end