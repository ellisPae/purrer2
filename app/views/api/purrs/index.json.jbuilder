json.array! @purrs do |purr|
  json.partial! 'api/purrs/purr', purr: purr
end

