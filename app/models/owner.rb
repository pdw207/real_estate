class Owner < ActiveRecord::Base
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :buildings

  def full_name
    "#{first_name} #{last_name}"
  end

  def delete_buildings
    self.buildings.each do |building|
      building.owner_id = nil
    end
  end
end
