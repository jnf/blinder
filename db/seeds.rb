# Core Event & associated Blinds
event = Event.create title: 'Open Source & Feelings 2015 CFP',
  blind_level: 0,
  human_key: "OSF",
  slug: "OSF2016",
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
  info: "Speakers will receive a complimentary ticket to Open Source & Feelings. As speakers ourselves, we understand the expense that speakers often incur. Unfortunately, we have limited ability to provide travel or hotel accommodations. Please, don't let that stop you from proposing a session. It is important that we be able to know all the great content we might miss so that we can highlight this fact to the sponsor and attendee communities.<br /><br />If your proposal is selected and travel expenses would prevent you from attending, we would like to work with you to help you attend the conference. Answering this optional question will help us get a better sense of the impact travel and housing costs have on speakers, and will not be used in our selection process.",
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
Do you consent to OS&F recording and then distributing on the internet your talk/presentation at OS&F 2016?
CONSENT

# Questions for the Blinds!
Question.create blind: personal_info, required: true, label: "Name", kind: "text", position: position(true)
Question.create blind: personal_info, required: true, label: "Email Address", kind: "email", position: position
Question.create blind: personal_info, required: true, label: "Phone Number", kind: "tel", position: position
Question.create blind: personal_info, required: true, label: consent_label, kind: "radio", values: "Yes,No", position: position, group: "recording_consent"
Question.create blind: personal_info, required: false, label: "Preferred Pronouns", kind: "text", position: position
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
Question.create blind: talk_info, required: true, label: "Why are you excited to talk about this at Open Source & Feelings?", kind: "textarea", position: position

Question.create blind: make_life_easier, required: true, label: "T-shirt cut", kind: "radio", values: "Boxy,Fitted", position: position, group: "shirt_cut"
Question.create blind: make_life_easier, required: true, label: "T-shirt size", kind: "radio", values: "XS,S,M,L,XL,2XL,3XL,4XL,5XL", position: position, group: "shirt_size"
Question.create blind: make_life_easier, required: true, label: "URL to a headshot or avatar", kind: "text", position: position(true)

Question.create blind: balancing_info, required: false, label: "Previous Speaking Experience", kind: "textarea", position: position(true)
Question.create blind: balancing_info, required: false, label: "Have you presented on this topic at other events? If so, where and when?", kind: "textarea", position: position
Question.create blind: balancing_info, required: false, label: "Tell us about your experience with open source.", kind: "textarea", position: position
Question.create blind: balancing_info, required: false, label: "Tell us about your involvement with your communities.", kind: "textarea", position: position

Question.create blind: speaker_accomodations, required: false, label: "Will travel and lodging make attending Open Source & Feelings financially difficult?", kind: "text", position: position
# User records for members of the selection committee

# Admin users
admins = [
  { uid: 27784,  name: '<3Jeremy!' },
  { uid: 257689, name: 'Kerri' }
]

admins.each do |admin|
  User.create uid: admin[:uid], name: admin[:name], role: 'admin', provider: 'github'
end

# Review users
reviewers = [
  { uid: 193874,  name: 'Carol Nichols' }
]

reviewers.each do |reviewer|
  User.create uid: reviewer[:uid], name: reviewer[:name], role: 'reviewer', provider: 'github'
end


#let's seed some dummy proposals
# 8.times do |index|
#   Proposal.create id: index + 1, event_id: event.id
# end

#and we'll do the same with responses,
# responses = [
#   { :id => 1, :proposal_id => 1, :question_id => 10, :value => "Jeremy's Awesome Talk" },
#   { :id => 2, :proposal_id => 1, :question_id => 11, :value => "Technical" },
#   { :id => 3, :proposal_id => 1, :question_id => 12, :value => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc fringilla feugiat neque, ac blandit ante auctor vel. Sed et enim ac felis aliquet auctor. Sed bibendum, nunc ac bibendum adipiscing, tortor ante varius nulla, et dignissim odio lacus ac sem. Phasellus eleifend turpis et erat ultrices aliquet. Vivamus a ante et ipsum tempor consequat. Pellentesque congue venenatis mi quis aliquam. Vivamus nec sapien eget odio tempus viverra. Integer adipiscing ornare aliquet. Curabitur nec ipsum tellus. In diam nulla, ultrices vel lorem dignissim, molestie pretium lectus. Fusce et nulla ligula. Pellentesque et diam quis justo mollis iaculis." },
#   { :id => 4, :proposal_id => 1, :question_id => 13, :value => "Sed id sollicitudin augue, quis consequat erat. Vestibulum hendrerit at augue elementum sodales. Fusce posuere tempor faucibus. Pellentesque dapibus tincidunt blandit. Phasellus ut tellus sed lorem dapibus interdum vitae tincidunt dui. Ut dictum tempor mattis. Aliquam in congue mauris, fermentum ultricies eros. Morbi facilisis a erat ac tempor. Vivamus tempus lorem vel imperdiet tincidunt.\n\nEtiam gravida consectetur urna, in pharetra neque consequat in. Integer ultricies congue cursus. Nulla facilisi. Phasellus tristique erat mi, eget accumsan nulla ornare ac. Aliquam erat volutpat. Proin rutrum nibh eget elit dictum, id elementum nulla iaculis. Donec porta viverra mauris. Ut vel ultrices erat. Maecenas pharetra vehicula magna, ut cursus felis iaculis vel. Integer eget lorem at felis tempus accumsan. Vivamus lectus mi, ultricies auctor turpis sit amet, mollis vestibulum velit. Donec sem libero, aliquet quis augue vitae, facilisis tristique lectus. Praesent tincidunt semper nisi et porta." },
#   { :id => 5, :proposal_id => 1, :question_id => 14, :value => "Aliquam eget nulla in nulla viverra ornare in ut lorem. Quisque ac sollicitudin sapien. Nunc id odio ut dolor auctor ullamcorper ac eu urna. Quisque facilisis lorem ut lectus viverra, et blandit nisi lobortis. In ultricies ultricies dolor at tempor. In in purus non nulla rutrum aliquet id at massa. Vestibulum ullamcorper tellus nisi." },
#   { :id => 6, :proposal_id => 1, :question_id => 15, :value => "Sed vel dapibus ligula. Etiam massa magna, auctor at lorem ullamcorper, facilisis sollicitudin diam. Integer mollis ante quis libero cursus mollis." },
#   { :id => 7, :proposal_id => 1, :question_id => 16, :value => "10" },
#   { :id => 8, :proposal_id => 1, :question_id => 17, :value => "Pellentesque eget ante vitae enim vehicula porttitor non non sapien. Cras quis pellentesque magna. Aliquam nec magna mollis erat accumsan dictum et eget metus. Aliquam justo libero, sollicitudin vitae pretium non, placerat vitae nisi. Pellentesque vel sapien ut mauris egestas porta. Sed lacinia odio eget condimentum dictum. Aliquam at sagittis sem. Cras sit amet eros ornare, porttitor est quis, auctor dui. Vestibulum ut sagittis sapien. Donec a justo quis magna gravida aliquam. Donec eget odio dolor." },
#   { :id => 9, :proposal_id => 1, :question_id => 18, :value => "Pellentesque eget ante vitae enim vehicula porttitor non non sapien. Cras quis pellentesque magna. Aliquam nec magna mollis erat accumsan dictum et eget metus. " },
#   { :id => 10, :proposal_id => 1, :question_id => 7, :value => "Mens" },
#   { :id => 11, :proposal_id => 1, :question_id => 8, :value => "2XL" },
#   { :id => 12, :proposal_id => 1, :question_id => 9, :value => "https://pbs.twimg.com/profile_images/378800000755957933/b1d5d828e5dc42a926b87f2e9a6f7f6d.jpeg" },
#   { :id => 13, :proposal_id => 1, :question_id => 1, :value => "Jeremy!" },
#   { :id => 14, :proposal_id => 1, :question_id => 2, :value => "3f0c7897@opayq.com" },
#   { :id => 15, :proposal_id => 1, :question_id => 3, :value => "no phones pls" },
#   { :id => 16, :proposal_id => 1, :question_id => 4, :value => "Jeremy is rad. Like, really rad." },
#   { :id => 17, :proposal_id => 1, :question_id => 5, :value => "" },
#   { :id => 18, :proposal_id => 1, :question_id => 6, :value => "_jnf" },
#   { :id => 19, :proposal_id => 2, :question_id => 10, :value => "Second Fake Proposal" },
#   { :id => 20, :proposal_id => 2, :question_id => 11, :value => "Technical" },
#   { :id => 21, :proposal_id => 2, :question_id => 12, :value => "hi" },
#   { :id => 22, :proposal_id => 2, :question_id => 13, :value => "yo" },
#   { :id => 23, :proposal_id => 2, :question_id => 14, :value => "because" },
#   { :id => 24, :proposal_id => 2, :question_id => 15, :value => "n/a" },
#   { :id => 25, :proposal_id => 2, :question_id => 16, :value => "12343" },
#   { :id => 26, :proposal_id => 2, :question_id => 17, :value => "center of the universe" },
#   { :id => 27, :proposal_id => 2, :question_id => 18, :value => "hi" },
#   { :id => 28, :proposal_id => 2, :question_id => 7, :value => "Womens" },
#   { :id => 29, :proposal_id => 2, :question_id => 8, :value => "XS" },
#   { :id => 30, :proposal_id => 2, :question_id => 9, :value => "hi" },
#   { :id => 31, :proposal_id => 2, :question_id => 1, :value => "Carol Nichols" },
#   { :id => 32, :proposal_id => 2, :question_id => 2, :value => "carol.nichols@gmail.com" },
#   { :id => 33, :proposal_id => 2, :question_id => 3, :value => "nope" },
#   { :id => 34, :proposal_id => 2, :question_id => 4, :value => "hi" },
#   { :id => 35, :proposal_id => 2, :question_id => 5, :value => "hi" },
#   { :id => 36, :proposal_id => 2, :question_id => 6, :value => "h" },
#   { :id => 37, :proposal_id => 3, :question_id => 10, :value => "wiggle waggle woddle" },
#   { :id => 38, :proposal_id => 3, :question_id => 11, :value => "Hybrid/Other" },
#   { :id => 39, :proposal_id => 3, :question_id => 12, :value => "People who like to dance" },
#   { :id => 40, :proposal_id => 3, :question_id => 13, :value => "Bananas in pajamas" },
#   { :id => 41, :proposal_id => 3, :question_id => 14, :value => "'I HATE AMERICA' IN SEEJEES VOICE" },
#   { :id => 42, :proposal_id => 3, :question_id => 15, :value => "Sooo many electrolytes" },
#   { :id => 43, :proposal_id => 3, :question_id => 16, :value => "do you want that in big decimal or int?" },
#   { :id => 44, :proposal_id => 3, :question_id => 17, :value => "Does a cow have utters?" },
#   { :id => 45, :proposal_id => 3, :question_id => 18, :value => "That one drunk night around a fire." },
#   { :id => 46, :proposal_id => 3, :question_id => 7, :value => "Mens" },
#   { :id => 47, :proposal_id => 3, :question_id => 8, :value => "2XL" },
#   { :id => 48, :proposal_id => 3, :question_id => 9, :value => "www.placekitten.com/g/200/400" },
#   { :id => 49, :proposal_id => 3, :question_id => 1, :value => "take a guess" },
#   { :id => 50, :proposal_id => 3, :question_id => 2, :value => "thanksobama@pgh.sexy" },
#   { :id => 51, :proposal_id => 3, :question_id => 3, :value => "1800873221" },
#   { :id => 52, :proposal_id => 3, :question_id => 4, :value => "Can I get a what what?!" },
#   { :id => 53, :proposal_id => 3, :question_id => 5, :value => "www.hampsterdance.com" },
#   { :id => 54, :proposal_id => 3, :question_id => 6, :value => "@shitnoonesays" },
#   { :id => 55, :proposal_id => 4, :question_id => 10, :value => "Cats cats, cats. :),--select * from users,;" },
#   { :id => 56, :proposal_id => 4, :question_id => 11, :value => "Hybrid/Other" },
#   { :id => 57, :proposal_id => 4, :question_id => 12, :value => "Things are cool" },
#   { :id => 58, :proposal_id => 4, :question_id => 13, :value => "Abstracts are really neat" },
#   { :id => 59, :proposal_id => 4, :question_id => 14, :value => "because it's awesome " },
#   { :id => 60, :proposal_id => 4, :question_id => 15, :value => "" },
#   { :id => 61, :proposal_id => 4, :question_id => 16, :value => "173737" },
#   { :id => 62, :proposal_id => 4, :question_id => 17, :value => "Nope " },
#   { :id => 63, :proposal_id => 4, :question_id => 18, :value => "Catconf" },
#   { :id => 64, :proposal_id => 4, :question_id => 7, :value => "Womens" },
#   { :id => 65, :proposal_id => 4, :question_id => 8, :value => "5XL" },
#   { :id => 66, :proposal_id => 4, :question_id => 9, :value => "httphshsjssj" },
#   { :id => 67, :proposal_id => 4, :question_id => 1, :value => "catty mcgee" },
#   { :id => 68, :proposal_id => 4, :question_id => 2, :value => "c@c.com" },
#   { :id => 69, :proposal_id => 4, :question_id => 3, :value => "3197376191" },
#   { :id => 70, :proposal_id => 4, :question_id => 4, :value => "Zdhehfhfj" },
#   { :id => 71, :proposal_id => 4, :question_id => 5, :value => "test" },
#   { :id => 72, :proposal_id => 4, :question_id => 6, :value => "" },
#   { :id => 73, :proposal_id => 5, :question_id => 10, :value => "Does my .equals work?" },
#   { :id => 74, :proposal_id => 5, :question_id => 11, :value => "Technical" },
#   { :id => 75, :proposal_id => 5, :question_id => 12, :value => "Mid to high level technical. Of special interest to Clojure programmers or Java programmers. A background in Java or Clojure is not required." },
#   { :id => 76, :proposal_id => 5, :question_id => 13, :value => "How do you have confidence that your custom equals and hashCode methods are working?\n\nThis talk walks through a real world scenario of using property testing for Java classes using clojure.test.check." },
#   { :id => 77, :proposal_id => 5, :question_id => 14, :value => "Um, not so much." },
#   { :id => 78, :proposal_id => 5, :question_id => 15, :value => "Have given three lightning talks at Pittsburgh Ruby. Have led several swarm coding at Pittsburgh Clojure, including closing bugs the high profile Clojure project, Leiningen. Have presented a take off of Chris Ford' Function Composition talk at Pittsburgh Clojure." },
#   { :id => 79, :proposal_id => 5, :question_id => 16, :value => "four" },
#   { :id => 80, :proposal_id => 5, :question_id => 17, :value => "I came to Pittsburgh to attend Carnegie Mellon as an undergrad and never left." },
#   { :id => 81, :proposal_id => 5, :question_id => 18, :value => "Not yet. Maybe Pittsburgh Tech Fest." },
#   { :id => 82, :proposal_id => 5, :question_id => 7, :value => "Mens" },
#   { :id => 83, :proposal_id => 5, :question_id => 8, :value => "M" },
#   { :id => 84, :proposal_id => 5, :question_id => 9, :value => "Gravatar URL here..." },
#   { :id => 85, :proposal_id => 5, :question_id => 1, :value => "Bruce Adams" },
#   { :id => 86, :proposal_id => 5, :question_id => 2, :value => "bruce.adams@acm.org" },
#   { :id => 87, :proposal_id => 5, :question_id => 3, :value => "+1-412-708-3300" },
#   { :id => 88, :proposal_id => 5, :question_id => 4, :value => "Writing about myself is HARD!\n\nBut, editing, I suppose I really should say _something_ here." },
#   { :id => 89, :proposal_id => 5, :question_id => 5, :value => "https://github.com/bruceadams" },
#   { :id => 90, :proposal_id => 5, :question_id => 6, :value => "Bruce_Adams" },
#   { :id => 91, :proposal_id => 6, :question_id => 10, :value => "Jean talks about interesting stuff like <b>bold tags</b>" },
#   { :id => 92, :proposal_id => 6, :question_id => 11, :value => "People/Process" },
#   { :id => 93, :proposal_id => 6, :question_id => 12, :value => "I am hoping that no one will hear this talk.\n\n\nIt is my belief that I will paste the HTML of this page into the next field, and then leave out the field after that." },
#   { :id => 94, :proposal_id => 6, :question_id => 13, :value => "Putting the entire HTML of the page here caused problems." },
#   { :id => 95, :proposal_id => 6, :question_id => 14, :value => "And I got a nice error about leaving this blank later." },
#   { :id => 96, :proposal_id => 6, :question_id => 15, :value => "When I change a field, it seems to float to the bottom of its section." },
#   { :id => 97, :proposal_id => 6, :question_id => 16, :value => "some. A few. " },
#   { :id => 98, :proposal_id => 6, :question_id => 17, :value => "yeah, totally. I live here.\nalso my child lives here." },
#   { :id => 99, :proposal_id => 6, :question_id => 18, :value => "" },
#   { :id => 100, :proposal_id => 6, :question_id => 7, :value => "Womens" },
#   { :id => 101, :proposal_id => 6, :question_id => 8, :value => "L" },
#   { :id => 102, :proposal_id => 6, :question_id => 9, :value => "http://static.giantbomb.com/uploads/original/1/17172/1419618-unicorn2.jpg" },
#   { :id => 103, :proposal_id => 6, :question_id => 1, :value => "Jean Lange" },
#   { :id => 104, :proposal_id => 6, :question_id => 2, :value => "jean.f.lange@gmail.com" },
#   { :id => 105, :proposal_id => 6, :question_id => 3, :value => "I do not wish to provide this." },
#   { :id => 106, :proposal_id => 6, :question_id => 4, :value => "I am jean. Can I fill this in later?" },
#   { :id => 107, :proposal_id => 6, :question_id => 5, :value => "" },
#   { :id => 108, :proposal_id => 6, :question_id => 6, :value => "" },
#   { :id => 109, :proposal_id => 7, :question_id => 10, :value => "Marylou Test!" },
#   { :id => 110, :proposal_id => 7, :question_id => 11, :value => "Hybrid/Other" },
#   { :id => 111, :proposal_id => 7, :question_id => 12, :value => "Alllllllll the cats" },
#   { :id => 112, :proposal_id => 7, :question_id => 13, :value => "Meow Meow Meow" },
#   { :id => 113, :proposal_id => 7, :question_id => 14, :value => "Gorbypuff" },
#   { :id => 114, :proposal_id => 7, :question_id => 15, :value => "n/a" },
#   { :id => 115, :proposal_id => 7, :question_id => 16, :value => "74832091823941" },
#   { :id => 116, :proposal_id => 7, :question_id => 17, :value => "Stillers" },
#   { :id => 117, :proposal_id => 7, :question_id => 18, :value => "n/a" },
#   { :id => 118, :proposal_id => 7, :question_id => 7, :value => "Womens" },
#   { :id => 119, :proposal_id => 7, :question_id => 8, :value => "XS" },
#   { :id => 120, :proposal_id => 7, :question_id => 9, :value => "http://i.imgur.com/aAY28.png" },
#   { :id => 121, :proposal_id => 7, :question_id => 1, :value => "ML" },
#   { :id => 122, :proposal_id => 7, :question_id => 2, :value => "marylou.lenhart@gmail.com" },
#   { :id => 123, :proposal_id => 7, :question_id => 3, :value => "555-555-5555" },
#   { :id => 124, :proposal_id => 7, :question_id => 4, :value => "cats!" },
#   { :id => 125, :proposal_id => 7, :question_id => 5, :value => "http://nooooooooooooooo.com" },
#   { :id => 126, :proposal_id => 7, :question_id => 6, :value => "@SteelCityRuby" },
#   { :id => 127, :proposal_id => 8, :question_id => 10, :value => "new relic test" },
#   { :id => 128, :proposal_id => 8, :question_id => 11, :value => "Hybrid/Other" },
#   { :id => 129, :proposal_id => 8, :question_id => 12, :value => "new relic" },
#   { :id => 130, :proposal_id => 8, :question_id => 13, :value => "new relic" },
#   { :id => 131, :proposal_id => 8, :question_id => 14, :value => "new relic" },
#   { :id => 132, :proposal_id => 8, :question_id => 15, :value => "" },
#   { :id => 133, :proposal_id => 8, :question_id => 16, :value => "223" },
#   { :id => 134, :proposal_id => 8, :question_id => 17, :value => "new relic" },
#   { :id => 135, :proposal_id => 8, :question_id => 18, :value => "asdasd" },
#   { :id => 136, :proposal_id => 8, :question_id => 7, :value => "Womens" },
#   { :id => 137, :proposal_id => 8, :question_id => 8, :value => "XS" },
#   { :id => 138, :proposal_id => 8, :question_id => 9, :value => "http://hi" },
#   { :id => 139, :proposal_id => 8, :question_id => 1, :value => "asdasd" },
#   { :id => 140, :proposal_id => 8, :question_id => 2, :value => "asdasd@asdasd.com" },
#   { :id => 141, :proposal_id => 8, :question_id => 3, :value => "123123" },
#   { :id => 142, :proposal_id => 8, :question_id => 4, :value => "new relic" },
#   { :id => 143, :proposal_id => 8, :question_id => 5, :value => "" },
#   { :id => 144, :proposal_id => 8, :question_id => 6, :value => "" }
# ]

# responses.each do |response|
#   Response.create response
# end
