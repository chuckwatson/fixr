class ShopService < ApplicationRecord
  belongs_to :shop
  belongs_to :service_item
end
