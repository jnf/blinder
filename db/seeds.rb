event = Event.create title: 'Steel City Ruby 2014 RFP',
  blind_level: 0,
  info: 'this is just a seed file. :/'

personal_info = Blind.create event: event,
  level: 5,
  title: "Personal &amp; Contact Information",
  info: "Someone write something about personal info here."

talk_info = Blind.create event: event,
  level: 1,
  title: "Talk Information",
  info: "Here's some info about your talk."

balancing_info = Blind.create event: event,
  level: 2,
  title: "Balancing Information",
  info: "We prolly want to come up with a better name for that."

make_life_easier = Blind.create event: event,
  level: 10, #yeah. . . not really part of the evaluation process
  title: "Help Us Out",
  info: "This information is not used for talk selection, but it will to make our lives easier if you're accepted."

Question.create blind: personal_info, label: "Name", kind: "text"
Question.create blind: personal_info, label: "Email Address", kind: "email"
Question.create blind: personal_info, label: "Phone Number", kind: "tel"
Question.create blind: personal_info, label: "Bio", kind: "textarea"
Question.create blind: personal_info, label: "Websites", kind: "text"
Question.create blind: personal_info, label: "Twitter", kind: "text"

Question.create blind: make_life_easier, label: "URL to a headshot or avatar", kind: "text"
Question.create blind: make_life_easier, label: "T-shirt cut", kind: "text"
Question.create blind: make_life_easier, label: "T-shirt size", kind: "text"

Question.create blind: talk_info, label: "Talk Title", kind: "text"
Question.create blind: talk_info, label: "Talk Abstract", kind: "textarea"
Question.create blind: talk_info, label: "Talk Focus", kind: "radio", values: "Technical,People,Both"
Question.create blind: talk_info, label: "Intended Audience (technical level, background, etc)", kind: "text"
Question.create blind: talk_info, label: "Why would this talk be a good fit for the Steel City Ruby audience?", kind: "textarea"

Question.create blind: balancing_info, label: "Previous Conference Speaking Experience", kind: "textarea"
Question.create blind: balancing_info, label: "Years of Ruby Experience", kind: "text"
Question.create blind: balancing_info, label: "Do you have any current or past connections to the Western PA area? If so, what?", kind: "textarea"
Question.create blind: balancing_info, label: "At which other conferences has this talk been presented?", kind: "textarea"

