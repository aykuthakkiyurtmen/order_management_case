class FavoriteSerializer
  include FastJsonapi::ObjectSerializer

  attributes :likeable_type
end
