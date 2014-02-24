event = Event.create title: 'Steel City Ruby 2014 RFP',
  blind_level: 0,
  info: 'this is just a seed file. :/'

4.times do |index|
  Blind.create event: event,
    title: "Blind Level #{index}",
    info: "this would be special data for level #{index}",
    level: index
end