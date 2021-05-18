class Payment < ApplicationRecord
    belongs_to :order
    enum status: {pending: 0, success: 1, fail: 2}
end
