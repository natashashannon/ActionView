class Food < ActiveRecord::Base
validate :name_included

  def name_included
    validates_presence_of :name
  end
end
  
    def self.search(query)
      where("name like ?", "%#{query}%") 
    end

