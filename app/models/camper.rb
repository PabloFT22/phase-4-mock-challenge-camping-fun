class Camper < ApplicationRecord

    has_many :signups
    has_many :activities, through: :signups

    # Add validations to the Camper model:
    # must have a name
    # must have an age between 8 and 18

    validates :name, presence: true
    validates :age, numericality: { greater_than: 7, less_than: 19}


end
