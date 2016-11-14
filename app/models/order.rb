# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  asker_id   :integer
#  poster_id  :integer
#

class Order < ApplicationRecord
	include AASM
	belongs_to :asker, :class_name => "Post"
  belongs_to :poster, :class_name => "Post"


	aasm do
		state :order_matched, initial: true
		state :order_met
		state :order_cancelled

		event :metMatch do
			transitions from: :order_matched, to: :order_met
		end

		event :cancel_order do
			transitions from: :order_matched, to: :order_cancelled
		end

		event :revive_order do
			transitions from: :order_cancelled, to: :order_matched
		end
	end

end
