class Game < ActiveRecord::Base
  attr_accessible :buyin, :casino_id, :prize, :variant_id
  belongs_to :casino
  belongs_to :variant

  def self.create_keys_names(array, key_1, key_2)
    result = {}
    id = 0
    array.each do |a|
      result[id] = {key_1 => a[0], key_2 => a[1]}
      id += 1
    end
    named_hash = result
  end
end
