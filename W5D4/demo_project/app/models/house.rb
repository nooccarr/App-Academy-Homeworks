class House < ApplicationRecord
    validates :address, presence: true          # validation (make sure to add annotate)

    has_many :residents,                        # association
        primary_key: :id,
        foreign_key: :house_id,
        class_name: :Person
end
