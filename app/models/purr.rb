# == Schema Information
#
# Table name: purrs
#
#  id               :bigint           not null, primary key
#  content          :text             not null
#  user_id          :integer          not null
#  original_purr_id :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Purr < ApplicationRecord
    validates :user_id, presence: true
    validates :content, presence: true,  length: { maximum: 280 }

    belongs_to :user

    has_many :likes

    has_many :likers,
        through: :likes,
        source: :user

    belongs_to :original_purr,
        class_name: :Purr,
        optional: true

    has_many :replies,
        class_name: :Purr,
        foreign_key: :original_purr_id

    has_many :repurrs,
        class_name: :Purr,
        foreign_key: :original_purr_id

    has_many :mentions,
        class_name: :Purr,
        foreign_key: :original_purr_id

    # def repurr 
    #     Purr.find_by(original_purr_id: id)
    #         .select { |p| p.content.includes(content) }
    # end

    


end
