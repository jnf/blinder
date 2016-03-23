# Core Event & associated Blinds
event = Event.create title: 'Sample Conference CFP (edit db/seeds.rb)',
  blind_level: 0,
  human_key: "Sample",
  slug: "sample",
  active: true,
  info: File.read('db/texts/event_info.md')

personal_info = Blind.create event: event,
  level: 5,
  title: "Personal &amp; Contact Information",
  info: "Your identifying information is not available to the selection committee until the last round of evaluation. We will never share or publish any of your information without your explicit permission. <strong>Demographic information is optional.</strong> We understand that not everyone will want to share this information. We will only use what you share with us to ensure that we create a representative and inclusive lineup.",
  position: 0

talk_info = Blind.create event: event,
  level: 1,
  title: "Talk Information",
  info: "The information in this section is the primary data used during proposal evaluation and selection. Please do not include identifying information in this section.",
  position: 1

balancing_info = Blind.create event: event,
  level: 2,
  title: "Balancing Information",
  info: "This information is not given to the selection committee until a late round in the selection process. It is used to provide contextual information about proposals and provides additional differentiation between similarly strong proposals.",
  position: 2

speaker_accomodations = Blind.create event: event,
  level: 10,
  title: "Speaker Accomodations",
  info: "Speakers will receive a complimentary ticket to the conference. As speakers ourselves, we understand the expense that speakers often incur. Unfortunately, we have limited ability to provide travel or hotel accommodations. Please, don't let that stop you from proposing a session. It is important that we be able to know all the great content we might miss so that we can highlight this fact to the sponsor and attendee communities.<br /><br />If your proposal is selected and travel expenses would prevent you from attending, we would like to work with you to help you attend the conference. Answering this optional question will help us get a better sense of the impact travel and housing costs have on speakers, and will not be used in our selection process.",
  position: 3

make_life_easier = Blind.create event: event,
  level: 10,
  title: "Making Life Easier",
  info: "If your proposal is selected, there are a few pieces of information we need to properly celebrate/publicise your talk. These items are optional, but they really do make our lives easier. :)",
  position: 4

position = -1
def position(reset = false)
  position = -1 if reset
  position = position + 1
end

consent_label = <<-CONSENT
Given the sensitive nature of many of our presentations, you may choose for your talk/presentation to not be recorded or distributed.
Do you consent to this conference recording and then distributing on the internet your talk/presentation?
CONSENT

# Questions for the Blinds!
Question.create blind: personal_info, required: true, label: "Name", kind: "text", position: position(true)
Question.create blind: personal_info, required: true, label: "Email Address", kind: "email", position: position
Question.create blind: personal_info, required: true, label: "Phone Number", kind: "tel", position: position
Question.create blind: personal_info, required: true, label: consent_label, kind: "radio", values: "Yes,No", position: position, group: "recording_consent"
Question.create blind: personal_info, required: false, label: "Pronouns", kind: "text", position: position
Question.create blind: personal_info, required: false, label: "Age", kind: "text", position: position
Question.create blind: personal_info, required: false, label: "Gender", kind: "text", position: position
Question.create blind: personal_info, required: false, label: "Race/Ethnicity", kind: "text", position: position
Question.create blind: personal_info, required: false, label: "Twitter", kind: "text", position: position
Question.create blind: personal_info, required: false, label: "Websites", kind: "text", position: position
Question.create blind: personal_info, required: false, label: "Anything else you'd like us to know?", kind: "textarea", position: position


Question.create blind: talk_info, required: true, label: "Talk Title", kind: "text", position: position(true)
Question.create blind: talk_info, required: true, label: "How long is your presentation (in minutes; 10-40 is average)?", kind: "text", position: position
Question.create blind: talk_info, required: true, label: "Talk Abstract", kind: "textarea", position: position
Question.create blind: talk_info, required: true, label: "Who's your ideal audience?", kind: "textarea", position: position
Question.create blind: talk_info, required: true, label: "Why are you excited to talk about this?", kind: "textarea", position: position

Question.create blind: make_life_easier, required: true, label: "T-shirt cut", kind: "radio", values: "Boxy,Fitted", position: position, group: "shirt_cut"
Question.create blind: make_life_easier, required: true, label: "T-shirt size", kind: "radio", values: "XS,S,M,L,XL,2XL,3XL,4XL,5XL", position: position, group: "shirt_size"
Question.create blind: make_life_easier, required: true, label: "URL to a headshot or avatar", kind: "text", position: position(true)

Question.create blind: balancing_info, required: false, label: "Previous Speaking Experience", kind: "textarea", position: position(true)
Question.create blind: balancing_info, required: false, label: "Have you presented on this topic at other events? If so, where and when?", kind: "textarea", position: position
Question.create blind: balancing_info, required: false, label: "Tell us about your experience with open source.", kind: "textarea", position: position
Question.create blind: balancing_info, required: false, label: "Tell us about your involvement with your communities.", kind: "textarea", position: position

Question.create blind: speaker_accomodations, required: false, label: "Will travel and lodging make attending this conference financially difficult?", kind: "text", position: position
# User records for members of the selection committee

# Admin users
admins = [
  { uid: 11111,  name: 'You' },
]

admins.each do |admin|
  User.create uid: admin[:uid], name: admin[:name], role: 'admin', provider: 'github'
end

# Review users
reviewers = [
  { uid: 22222,  name: 'Someone Else' }
]

reviewers.each do |reviewer|
  User.create uid: reviewer[:uid], name: reviewer[:name], role: 'reviewer', provider: 'github'
end
