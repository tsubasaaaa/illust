json.array! @illustrations do |illustration|
  json.title         illustration.title
  json.text          illustration.text
  json.iamge         illustration.image.url
end