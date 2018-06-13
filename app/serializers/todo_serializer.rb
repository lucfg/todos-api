class TodoSerializer < ActiveModel::Serializer
	# Attributes to be serialized
  attributes :id, :title, :created_by, :created_at, :updated_at

  # Model association
  has_many :items
end
