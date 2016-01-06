class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :completed, :list_id
end
