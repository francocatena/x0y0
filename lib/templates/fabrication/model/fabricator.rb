Fabricator(<%= class_name.match(/::/) ? "'#{class_name}'" : ":#{singular_name}" %>) do
<% attributes.each do |attribute| -%>
  <%- random = case attribute.type.to_s -%>
    <%- when 'string' then attribute.name.match(/name/).present? ?
      'Faker::Name.name' : ( 
        attribute.name.match(/email/).present? ? 'Faker::Internet.email' : 'Faker::Lorem.sentence'
      ) -%>
    <%- when 'text' then 'Faker::Lorem.paragraph' -%>
    <%- when 'date' then 'Date.today' -%>
    <%- when 'datetime' then 'Time.now' -%>
    <%- when *['decimal', 'float'] then '0.0' -%>
    <%- when 'integer' then '0' -%>
    <%- else  attribute.type -%>
  <%- end -%>
  <%= "#{attribute.name} { #{random} }" %>
<% end -%>
end
