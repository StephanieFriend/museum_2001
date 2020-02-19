class Museum

  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    patron.interests.map do |interest|
      @exhibits.find_all do |exhibit|
        exhibit.name == interest
      end
    end.flatten
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    exhibit_interest = {}
    @patrons.find_all do |patron|
      patron.interests == @exhibits.each do |exhibit|
        exhibit.name
        if exhibit_interest.include?(exhibit) && patron.interests == exhibit.name
          exhibit_interest[exhibit] = exhibit_interest[exhibit] << patron
        else
          exhibit_interest[exhibit] = [patron]
        end
      end
    end
    exhibit_interest
  end
end