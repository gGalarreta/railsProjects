class TokenStudent < ApplicationRecord
   validates :token, presence: true
end
