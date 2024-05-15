class CustomAttribute < ApplicationRecord
    belongs_to :attributable, polymorphic: true
end
  