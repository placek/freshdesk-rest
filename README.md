# freshdesk-rest

[![Build Status](https://travis-ci.org/placek/freshdesk-rest.svg?branch=master)](https://travis-ci.org/placek/freshdesk-rest)

## Requirements
- Create a read-only API key in Freshdesk
- Set an ENV var with `FRESHDESK_API_KEY`
- Set an ENV var with `FRESHDESK_DOMAIN`

## DISCLAIMER
### This is still a BETA!
Some of the methods signatures could change. I aim to keep always backward compatibility, but until the first major version (1.x.x) is released, it's still in beta.

Keep in mind that Phraseapp do not recommend to user the lists to retrieve all the items but to use the "#locale_download" instead. The limits of how many items per page are supported, has not been tested.

## Configuration
```ruby
Freshdesk::Rest.configure do |config|
  config.api_key = ENV['FRESHDESK_API_KEY']
  config.domain = ENV['FRESHDESK_DOMAIN']
end

```

## Usage
Get the api client using the factory
```ruby
api = Freshdesk::Rest::Factory.api
```

### List of contacts
```ruby
resource = Freshdesk::Rest::Factory.contact_resource
resource.list.each do |p|
  puts "#{c[:name]} #{c[:email]} #{c[:updated_at]}"
end
```

### List of contacts filtered by a filed
```ruby
resource = Freshdesk::Rest::Factory.contact_resource
resource.list(params: { unique_external_id: '1234567890' }).each do |p|
  puts "#{c[:name]} #{c[:email]}"
end
```

### Contact
```ruby
resource = Freshdesk::Rest::Factory.contact_resource
resource.get(id: '1234567890').tap do |c|
  puts "#{c[:name]} #{c[:email]}"
end
```

### Create contact
```ruby
resource = Freshdesk::Rest::Factory.contact_resource
resource.post(data: { name: 'Paweł Placzyński', email: 'placek@example.com' }).tap do |c|
  puts "#{c[:name]} #{c[:email]}"
end
```

### Update contact
```ruby
resource = Freshdesk::Rest::Factory.contact_resource
resource.put(id: 1234567890, data: { email: 'other+email@example.com' }).tap do |c|
  puts "#{c[:name]} #{c[:email]}"
end
```

### Soft delete contact
```ruby
resource = Freshdesk::Rest::Factory.contact_resource
resource.delete(id: 1234567890)
```

## Freshdesk Api reference
https://developers.freshdesk.com/api
