class Person < ApplicationRecord
    validates :name, :house, presence: true         # validation    (make sure to add annotate)

    belongs_to :house,                              # associatoin
        primary_key: :id,
        foreign_key: :house_id,
        class_name: :House
end