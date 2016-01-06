class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :completed, :description, :list_id
end
