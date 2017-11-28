source 'https://supermarket.chef.io'

metadata

group :integration do
  cookbook 'elasticsearch2_test', path: './test/fixtures/cookbooks/elasticsearch2_test'

  # not a strict dependency, but necessary for TK testing
  cookbook 'java'
  cookbook 'curl'
end
