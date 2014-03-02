event = Event.create title: 'Steel City Ruby 2014 RFP',
  blind_level: 0,
  info: 'this is just a seed file. :/'

personal_info = Blind.create event: event,
  level: 5,
  title: "Personal &amp; Contact Information",
  info: "Someone write something about personal info here.",
  position: 0

talk_info = Blind.create event: event,
  level: 1,
  title: "Talk Information",
  info: "Here's some info about your talk.",
  position: 1

balancing_info = Blind.create event: event,
  level: 2,
  title: "Balancing Information",
  info: "We prolly want to come up with a better name for that.",
  position: 2

make_life_easier = Blind.create event: event,
  level: 10, #yeah. . . not really part of the evaluation process
  title: "Help Us Out",
  info: "This information is not used for talk selection, but it will to make our lives easier if your proposal is accepted.",
  position: 3

position = -1
def position(reset = false)
  position = -1 if reset
  position = position + 1
end

Question.create blind: personal_info, label: "Name", kind: "text", position: position(true)
Question.create blind: personal_info, label: "Email Address", kind: "email", position: position
Question.create blind: personal_info, label: "Phone Number", kind: "tel", position: position
Question.create blind: personal_info, label: "Bio", kind: "textarea", position: position
Question.create blind: personal_info, label: "Websites", kind: "text", position: position
Question.create blind: personal_info, label: "Twitter", kind: "text", position: position

Question.create blind: make_life_easier, label: "URL to a headshot or avatar", kind: "text", position: position(true)
Question.create blind: make_life_easier, label: "T-shirt cut", kind: "radio", values: "Mens,Womens", position: position
Question.create blind: make_life_easier, label: "T-shirt size", kind: "radio", values: "XS,S,M,L,XL,2XL,3XL,4XL,5XL", position: position

Question.create blind: talk_info, label: "Talk Title", kind: "text", position: position(true)
Question.create blind: talk_info, label: "Talk Abstract", kind: "textarea", position: position
Question.create blind: talk_info, label: "Talk Focus", kind: "radio", values: "Technical,People,Both", position: position
Question.create blind: talk_info, label: "Intended Audience (technical level, background, etc)", kind: "text", position: position
Question.create blind: talk_info, label: "Why would this talk be a good fit for the Steel City Ruby audience?", kind: "textarea", position: position

Question.create blind: balancing_info, label: "Previous Conference Speaking Experience", kind: "textarea", position: position(true)
Question.create blind: balancing_info, label: "Years of Ruby Experience", kind: "text", position: position
Question.create blind: balancing_info, label: "Do you have any current or past connections to the Western PA area? If so, what?", kind: "textarea", position: position
Question.create blind: balancing_info, label: "At which other conferences has this talk been presented?", kind: "textarea", position: position

