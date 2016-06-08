def addTale(user, title, prompt, lines)
  t = Tale.create(title: title, prompt: prompt, owner: user)
  t.save!
  lines.each do |line|
    Line.create(user: user, tale: t, content: line, done: true)
    user = User.all.sample until user && user != t.lines.last.user
  end
end

dean = User.create(first_name: "Dean", last_name: "Watts", username: "hdwatts", email: "dean@tales.com", password: "password1" )
alex = User.create(first_name: "Alex", last_name: "Martin", username: "asmartin", email: "alex@tales.com", password: "password1" )
eve = User.create(first_name: "Eve", last_name: "Essex", username: "eessex", email: "eve@tales.com", password: "password1" )

until User.all.count == 8 do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username = Faker::Internet.user_name
  email = first_name.downcase + "@flatironschool.com"
  password = Faker::Internet.password(6)
  u = User.create(first_name: first_name, username: username, last_name: last_name, email: email, password: password)
  if u.valid?
    [rand(6).years, rand(365).days, rand(24).hours, rand(60).minutes, rand(60).seconds].each{|time| u.created_at -= time}
    u.save
  end
end

user = User.all.sample
title = "Quick"
prompt = "Everyone is born with a disability and an ability. A test is done at birth to determine these, if they aren't already apparent. You, well, you were born with crippled legs and have the power of super speed. (story from: /u/Razputin7)"
lines = []
lines[0] = "See, what most people don't realise about super speed is that it doesn't just affect your legs. Your entire body moves fast."
lines[1] = "People never tend to get that because you see guys like Ravel Alton sprinting at three hundred kilometres an hour down the speedway. I mean, it's more impressive visually than what I can do... but I like to think that my abilities are pretty good."
lines[2] = "\"Checkmate,\" I smile, knocking over the white king with my own rook. Valentin, my opponent, stares at me in shock. By the look on his face, my guess is that his ability was mind-reading. It's a good way to become a chess champion, I'll give him that."
lines[3] = "But he can't keep up with me."
lines[4] = "See, from the femtosecond his finger touched the first piece, I started running through the possible moves in my head. All of them."
lines[5] = "Do you know how many possible positions there are after each player moves three times? More than 9 million. That goes up to 288 billion after four moves each."
lines[6] = "But when you can't move without a wheelchair, and when you have a brain that can scan and memorise information faster than anything else on the planet... and when you also have a lot of time on your hands... you can memorise everything."
lines[7] = "Every perfect game..."
lines[8] = "Not to mention, of course... Valentin might be able to read minds. But he can't process information as fast as I can. Which leaves him unable to comprehend the million, million, million thoughts I have every nanosecond."
lines[9] = "I can't run. But that doesn't mean I'm not fast."
addTale(user, title, prompt, lines)

user = User.all.sample
title = "Highway Wastes"
prompt = "When I was 16 my father pulled me out of school and shoved me in the car. His eyes didn't leave the road as he threw a gun in my lap and said, \"We\'re going to get your mother.\" (story from: /u/blahgarfogar)"
lines = []
lines[0] = "Everybody’s running from something.<br><br>Sometimes from themselves.<br><br>And when that happens...<br><br>...you call on someone very special.<br><br>Someone who stopped running long ago.<br><br>The Highwayman."
lines[1] = "For a long while, folks thought he was a myth. No one knew his name or where he was from. He simply...appears. Materializing out of the dust storms in a rusted ol’ speedster with a firebreathing nitro-boosted engine to match. You’ll hear him."
lines[2] = "You'll definitely hear him.<br><br>Snarling down the rippling asphalt with a determined face."
lines[3] = "He’ll be wearing a plain white dress shirt with a simple vest and tie, his sleeves rolled up and dark glasses to match the leather gloves covering his disfigured hands. He answers to no one but helps everyone."
lines[4] = "Addicts, runaways, mobsters, the abused, the forgotten, the ones who wish to be forgotten. He does not discriminate."
lines[5] = "In the end...it doesn’t matter. He’ll come for you when you need him most.<br><br>Because nothing stops a Highwayman."
lines[6] = "He’ll get you to where you need to be.<br><br>To threaten a Highwayman is a sin.<br><br>To kill a Highwayman is impossible.<br><br>You can try.<br><br>But you will fail."
lines[7] = "Any man can die. But an idea? It is something more than a man."
lines[8] = "------<br><br>Don’t bother listing off your sexual prowess or talking about your macho, brooding attitude.<br><br>In the Saffron Gentlemen’s Club, only money talks. A man can do so much with wealth. It’s almost absurd."
lines[9] = "I pass a bloke droning on and on about thematic symbolism about a book he’s penned. Shameless plugging in a strip club. Never thought I’d see the day."
lines[10] = "The woman wrapped lovingly around his lap takes it all in, his words, his demeanor, his smell, everything, but I can see her eyes glaze over."
lines[11] = "The only thing deep about her is her throat.<br><br>You could kill an epileptic by placing him in this club. Dazzling arrays of green and purple lights scatter across the hollering crowd."
lines[12] = "The strippers, donning glow sticks around the parts that matter, the areas which tease your eyes and promise your mind pleasures you didn’t know you had."
lines[13] = "The goddesses effortlessly slide up and down the fluorescent pole while saturated guitar leads wail in the background."
lines[14] = "Pulsing in and out of my skull is a steady and infectious bassline, each downbeat coinciding perfectly with the sway of hips."
lines[15] = "I maneuver my way through the sea of patrons, who consist of wannabe womanizers, aristocrats and shady rats I’m not too keen on meeting."
lines[16] = "I catch the attention of a brunette server clad in a bare bikini and ask her if she knows where Paige is."
lines[17] = "\"Wait, you’re not one of her new boyfriends, are you? Don’t cause any trouble or I’ll break your wrists.\" she quickly snaps."
lines[18] = "I show her a pair of silver car keys and a silver coin of unknown origin. \"Oh.\" I can see on her face that she wants to apologize but for some reason she holds it in. \"Well, look to the stage, hun.\""
lines[19] = "And there she was, wearing nothing but a wristband. Free as can be, with all of those men by the stage in the palm of her hand. They’re all vulnerable, powerless against her smile, her charisma, her body, her motions, her scent."
lines[20] = "I don't care for it. I'm here for one reason only. At last her dance ends, and I follow her to her dressing room. She's sitting in front of a mirror with those lightbulbs adorned around the frame."
lines[21] = "I make no effort to hide myself, even going as far to adjust my tie. \"You\'re not supposed to be back here.\" said Paige in a sing-songy voice. \"And you\'re supposed to be keeping a low profile.\" I respond."
lines[22] = "\"I make good money here. Hey...at least I settled on a small town.\"<br><br>\"Put some clothes on.\"<br><br>She twirls her head around, reapplying her red lipstick. \"Why? Am I...distracting you?\""
lines[23] = "I turn away. \"Something took my wife.\"<br><br>\"Sorry to hear that.\"<br><br>\"No, you\'re not.\"<br><br>\"How\'s your daughter doing\-\"<br><br>\"Leave her out of this.\"<br><br>\"But you've brought her with you...haven\'t you?\""
lines[24] = "\"I need access to the Echidna\'s Map. And you\'re going to give it to me.\"<br><br>\"Why should I?\"<br><br>\"I helped your Coven. Now you\'ll help me. I never ask anything in return. But now I need the map.\""
lines[25] = "\"You helped my Coven. Not me. I don\'t know where it is-\"<br><br>I grab her arm. Not in a gentle manner. In a manner that lets her know the malice that I'm capable of.<br><br>\"Let go...Highwayman.\""
lines[26] = "\"Give me what I need. Then I will leave.\"<br><br>\"No one is supposed to use that map except for the Coven. If I give it to you...then I may be forced to hurt you.\" Paige smiles deviously."
lines[27] = "\"Threatening a Highwayman is a sin.\"<br><br>\"I've sinned plenty, mister. And no. I'm not giving it to you.\"<br><br>Her skin starts to heat up, burning my palm. For a brief second her eyes glow a fantastic red."
lines[28] = "A blade to the neck solves everything. I let her limp body fall to the floor and rummage through her shelves. I hear the place going silent, aside from the music. The witches will find me soon enough."
lines[29] = "Then, behind the frame of an oil painting is a yellowed tattered excuse for a map. A map through the Deadlands. I shove it into my pocket."
lines[30] = "\"I\'m coming, Jane.\" I mutter. \"You won\'t be alone for long.\"<br><br>As I begin to leave, I'm struck by a silent broadhead. Pain surges up my shoulders.<br><br>Her Sisters have come."
lines[31] = "I bolt towards the exit, as several more witches armed with bewitched crossbows take aim. I see now that the club is empty, besides a single woman in a long white coat sitting by the stage."
lines[32] = "\"You\'ve made a mistake. Breaking into a Coven club without my permission.\" spoke the woman, drinking a glass of wine. \"Breaking rules is so uncharacteristic of a Highwayman, hmm?\""
lines[33] = "\"I\'m not one anymore.\" I reply, tearing the arrow out of my arm.<br><br>\"I can arrange that.\" The witch teleports behind me and kicks me onto the table. Glass tears away my fragile skin."
lines[34] = "Get up.<br><br>Get up, old man.<br><br>I didn't have to.<br><br>With a thunderous crash, The Revelator barrels through the club's walls, flames erupting out from the skirt exhausts."
lines[35] = "The 8 cylinder engine growls and roars like a rabid animal unleashed. Luckily, my daughter can tame such a thing. She learned from the best."
lines[36] = "\"Dad! Get in!\" shouts my daughter, firing a sawed off shotgun. I run through the ensuing chaos and land on top of the roof.<br><br>\"Go! Alice! Go!\""
lines[37] = "She stomps on the throttle, the tires vomiting out bits of shredded rubber and smoke."
lines[38] = "550 horsepower and enough torque to reverse the rotation of the planet violently propels the muscle car out of the building, leaving the Sisters with a nicely packed plume of dust and debris."
lines[39] = "But they're giving chase with two Harleys in hot pursuit.<br><br>\"Honey!\" I shout above the burble of the engine. Crossbows smash into the boot of the vehicle."
lines[40] = "My daughter opens up the sun roof, and tosses me a revolver. I take aim and miss the first three shots.<br><br>\"Keep it steady, Alice! Get it on pavement!\""
lines[41] = "Below me, she shifts into third gear, maneuvering the car around the wreckage of an airliner. \"I\'m trying!\""
lines[42] = "Cursing, I fire off my last shots, blowing the tires off of one motorcycle. Good riddance. The remaining witch is in the midst of reloading."
lines[43] = "\"Alice! Gun!\" Blood is starting to seep onto the windows.<br><br>\"Wait!\" She\'s shuffling through the glove box while simultaneously weaving through the junkyard. \"I-I]'m tryin\'...\""
lines[44] = "\"Alice! Now, honey! Gun! GUN!\"<br><br>\"I\'m reloading!\"<br><br>The witch brings up her weapon to take aim, charging the arrow with sizzling arcane energy.<br><br>Panic courses through my bloodstream. \"ALICE!\""
lines[45] = "\"HERE!\"<br><br>I catch the rifle and squeeze the trigger.<br><br>One flash.<br><br>One bullet.<br><br>One witch whose skull is scattered all over the sands."
lines[46] = "I crawl my way into the passenger's seat and pat my daughter on the back. \"You did good, honey. You did...\"<br><br>Something insidious is looming in the rearview mirror."
lines[47] = "A titan of sand and rock ascending into the dark moonlit clouds.<br><br>\"Dad...uh...what's that?\" she asks, worry tinging her tone."
lines[48] = "The Beast. The Guardian of the Deadlands. \"How's our reserves?\"<br><br>\"Six buck for the shotty, two rounds for the Widow, and two Greek Fire grenades.\"<br><br>I swiftly reload the repeater."
lines[49] = "\"Ugh. Keep your eyes on the road, and the pedal to the metal. You hear me, Alice?\"<br><br>\"Y-yeah...\"<br><br>I hold her hand. \"I know you\'re scared. But you can do this.\""
lines[50] = "\"I know...\"<br><br>\"Breath. Breath. In and out. Remember what I said?\"<br><br>Alice grabs the shift knob which I fashioned out of an 8 ball. \"Nothing stops a Highwayman.\""
lines[51] = "I give her a smile and a quick peck on the cheek. \"We\'re getting her back. I promise you.\"<br><br>Through the infinite wall of dust and fire...we ride together into the horizon, the Beast howling behind us."
lines[52] = "We've got some road to burn."
addTale(user, title, prompt, lines)

user = User.all.sample
title = "Origins"
prompt = "\"Adulthood is like looking both ways before you cross the street, then getting hit by an airplane.\" (story from: /u/psycho_alpaca)"
lines = []
lines[0] = "\"I\'m sorry to bring you here like this.\"<br><br>\"Not at all, my dear boy. Not at all.\"<br><br>\"But, you see, I have to know... I have to know, and you're the only one –\""
lines[1] = "\"I get it,\" the old man interrupted me. He puffed his cheeks weakly, like it took him great effort just to breathe, and then he leaned back against the armchair and his eyes turned to the crackling of the fireplace.  \"Ask away.\""
lines[2] = "\"Well... it\'s pretty simple, actually.\" I leaned forward. \"What\'s it like?\"<br><br>His eyes turned to me, and he almost smiled. \"What\'s it like?\"<br><br>\"Yeah. Life. Growing up. Being old.\""
lines[3] = "I paused. \"Well, not that I'm calling you old, I just –\""
lines[4] = "\"It's okay, dear boy,\" he laughed. \"I am old. That's why you brought me here.\"<br><br>I said nothing. He arranged himself on the armchair like he had all the time in the world. Then his eyes went up to me again. \"It's... hard.\""
lines[5] = "I waited. I knew he wasn't done."
lines[6] = "\"It's the hardest thing you'll ever have to do, actually\" he continued. \"Harder than building all this fancy equipment you've built. Harder than studying all you've studied. Harder than winning all these scientific awards you've won so far.\""
lines[7] = "He chuckled. \"Nothing prepares you for it.\""
lines[8] = "\"What makes it hard?\" I asked. \"Is it the responsibilities? The body decaying? What makes growing up so hard?\""
lines[9] = "\"No. It\'s not the responsibilities. Growing up is like looking both ways before you cross the street, then getting hit by an airplane.\" He lowered his head as if to put his thoughts together, then continued."
lines[10] = "\"It\'s the things you don\'t expect that catch you by surprise. Sure, it\'s scary to have a kid, and to get married, and to ask your boss for a promotion, and all these grown-up stuff we have to pretend we know how to do.\""
lines[11] = "\"Pretend?\""
lines[12] = "He seemed surprised. \"Yes, pretend. No one really grows up, of course. We put on a face to the world, but at home, three in the morning, all alone watching TV, you're still sixteen. All of us are.\" He shook his head."
lines[13] = "\"There\'s nothing more heartbreaking than being a real person and sitting down in front of another real person, and then both of you have to act like fake people."
lines[14] = "You sit across from someone two years older than you in a job interview and you both say \'Hello, sir\' and \'Yes, I also think the Dow Jones has been fluctuating dangerously this last few days\'"
lines[15] = "and \'Oh, absolutely, the 405 is a nightmare this time of day\'. And all along you know you both laugh at poop jokes and fart sounds and you have all these hobbies and interests and you curse and say fuck and shit and asshole."
lines[16] = "You\'re real people. But you act like robots. You have to put on the face, and they have to put on a face, and you have to pretend that nothing in life is ever fun, everything is productivity and seriousness.\""
lines[17] = "\"Is that what makes it hard?\" I asked. \"That everyone\'s just... faking their way through adulthood?\""
lines[18] = "\"No. No, that\'s expected. It sucks, but we all know what we're getting into.\" He sighed. \"No, what catches you by surprise are the little things about growing up. It's being stuck in traffic and remembering a day. Any day."
lines[19] = "A locker room conversation in high school. A teacher. A friend of a friend. Something that happened long enough ago that it could order its own drink. It sneaks up on you, and you look at yourself in the rear view and you think, my God..."
lines[20] = "Where did it go? When did I become so old?\""
lines[21] = "\"I remember college like it was yesterday.\", he continued, \"I remember my girlfriends and my friends and they used to drink and talk about sex and hanging out and now they all eat oatmeal and go to funerals. And I do that to."
lines[22] = "And I like all of that. Well, not going to funerals, but oatmeal. Soap operas. Going to bed at nine. I like it.\"<br><br>\"So what\'s the problem?\""
lines[23] = "\"The problem is I\'m still the sixteen year old. I'm still the college kid. My needs and wants have changed, and my body has changed, and my mind has changed, in a way, but I didn\'t change. I\'m still putting on a face."
lines[24] = "So when these thoughts sneak up on me – when a flash of a college party or a roadtrip or the feeling of falling asleep in the back of my Dad\'s car wells up on me... it breaks me. It breaks me because I don\'t think of it fondly."
lines[25] = "I don\'t look at that young kid with affection and nostalgia, I look at him with envy. Envy, because he\'s got all of that ahead of him still, and he doesn't even know how lucky he is. He\'s me, we\'re the same –"
lines[26] = "but he\'s got the good looks and the health and all the years ahead of him, and I\'m wasting away in an old apartment. And I hate that kid so much. Every time he sneaks up on me I hate him more.\""
lines[27] = "I looked down, then up. \"What about family? Kids?\"<br><br>\"They are great. They are amazing. But they go away. They\'re not you. In the end, you raise your sons and daughters for the world, not for yourself."
lines[28] = "They have to fall asleep in the back of my car, and go to their college parties and all that... they don\'t exist for my benefit. No one exists for my benefit but myself. And I'm much too old to do anything about it.\""
lines[29] = "I swallowed dry and averted my eyes to the fireplace. The old man leaned forward. \"We always get the feeling that the good old days are either behind us or ahead of us. They\'re never our own days."
lines[30] = "We were always born just a bit too late to go to Woodstock or to see Nirvana live or to see the Berlin Wall fall or to party Great Gatsby style in the 20\'s."
lines[31] = "And then we get old and we realize we were born too soon to see the wonders of technology and the world reshaping and blooming into something new and exciting. But the truth is, our Woodstocks were happening all around us as we grew."
lines[32] = "Our new and exciting world was some old guy\'s boring present, and our past will be some spoiled, arrogant kid\'s \'Good old days\'. We were just too stupid to realize it when it mattered. So we let it slide away."
lines[33] = "And then we ended up like me – sad and resentful of our younger selves for all they can still do and we can't.\"<br><br>Finally, I got up. I went to the old man and I knelt in front of him. \"I\'m sorry I brought you over.\""
lines[34] = "\"It\'s okay,\" he said. \"I knew you would. After all, I did it, sixty years ago.\"<br><br>I looked at my own eyes. Despite the wrinkles around them, they still looked pretty much the same."
lines[35] = "The old man shook his head and sniffed a tear away. \"Now let\'s go back to your lab so you can send me back to my own time, so I can hate you in peace.\""
lines[36] = "I hugged my own eighty year old version and leaned away and nodded. \"I\'ll enjoy it,\" I said. \"And I\'ll know I\'m living in the good old days, I promise.\""
lines[37] = "He got up with difficulty. \"No, you won\'t,\" he said. \"The good old days are only ever good when they\'re gone. That\'s what makes them good. When you\'re living through them, they\'re just... days.\""
lines[38] = "He slow-stepped ahead of me towards the lab. Then he spoke without turning his head: \"And days go by really fast, man. They go by really fast.\""
addTale(user, title, prompt, lines)

user = User.all.sample
title = "Henry Potter and the Scientists Flask"
prompt = "You're a 12 year-old in a world domintated by magic. A small, feeble man appears on your doorstep claiming: \"You\'re a scientist, Henry\" (story from: /u/Luna_LoveWell)"
lines = []
lines[0] = "Henry and Roy shuffled into the cafeteria along with the other forty first year students who would be starting at the East Brighton Preparatory Academy. The other students, already seated at the tables, barely looked up from their meals."
lines[1] = "It didn\'t look much like the Great Hall of Hogwarts that he had seen in Mum and Dad\'s old photos. Instead of a thousand floating candles and a stormy sky, Henry just saw dirty ceiling tiles and fluorescent lights."
lines[2] = "And there were no long wooden tables with silver platters of food, but instead scuffed red plastic tags and dented aluminum trays heaped with something that almost looked like macaroni and cheese."
lines[3] = "\"This must be the Sorting!\" Henry whispered eagerly to Roy. \"My father told me all about it!\" He searched the room for any noticeable banners to see what the different houses were, but he couldn't see any."
lines[4] = "No matter; the muggle's version of the Sorting Hat would surely explain it.<br><br>\"Sorting?\" Roy grunted. \"Sorting what?\" He was muggle born, after all, so of course he wouldn\'t know how it was done at Hogwarts."
lines[5] = "Do the muggles not do sorting? Henry wondered. That didnt make sense. Haggard had even brought him to a Muggle library so that he could learn a bit more about his school before the first day; theyd used a machine that Haggard had called \"internet.\""
lines[6] = "There, he saw pictures of mascots and all the bright colors, just like the Gryffindor lion."
lines[7] = "And while they were at the Muggle\'s version of Diagon Alley (Called \"Shopping Mall,\") Haggard had explained that all the boys would be split up to live in different areas of the school. There had to be a sorting, right?"
lines[8] = "\"You know,\" Henry tried to explain, \"Like, where they split us all up and decide what house we\'re going to live in.\"<br><br>\"Ohhhh.\" Roy nodded understandingly. \"Yeah, \'at\'s what this is for.\""
lines[9] = "The young girl in front of Roy turned right then and passed a stack of papers to him. They weren\'t the yellowish parchament that Henry was used to; just plain white squares covered in black writing."
lines[10] = "Roy took one for himself and then passed the stack to Henry.  Henry studied the options, each with a little blank check box next to it:"
lines[11] = "<br><br>Windsor Building, Dorm A<br><br>Windsor Building, Dorm B<br><br>Churchill Building, Dorm A<br><br>Churchill Building, Dorm B"
lines[12] = "\"Errr....\" Henry wasn't sure if this was right. Where was the Hat to make the decision? \"You just pick one?\""
lines[13] = "\"Yeah,\" Roy answered, seeming a bit confused. \"Wotchu think, Henry? Want to room together?\""
lines[14] = "\"Sure!\" He didn't have to stop and think about it. Regardless of what House they chose together, it would be good to be with a friend."
lines[15] = "\"Well, my brother Doug was in Churchill B 'is first year,\" Roy explained. A roguish grin spread across his face. \"'e said that it's got a pretty good view into the girls dormitory across the quad! I say we grab that one!\""
lines[16] = "The girl in front of Roy turned around and shot daggers at him along with a look of disgust. She was likely trying to figure out which dorm was not across from Churchill B."
lines[17] = "Henry looked back down at the paper. \"Well... what attributes does House Churchill fit best? Because I think that I'm fairly studious and intelligent, but my father's house was known for being brave and those things tend to run in the family.\""
lines[18] = "He frowned; this really would be easier if there was just a hat to the decision."
lines[19] = "Roy's face screwed up in confusion. \"Henry, you're a weird bloke. What the hell are you talking about?\"<br><br>\"You know...\" This was so frustrating! Henry'd never had to deal with Muggles before."
lines[20] = "\"Isn't our house supposed to match our personality?\"<br><br>Roy laughed. \"It's just a place to live, Henry. It'll be a bunk bed and a desk with a little lamp on it. Probably broken, if what my brothers all told me is true. That's about it.\""
lines[21] = "\"Oh.\" Henry looked down at his paper. \"I guess Churchill B will be fine then.\" He looked around for someone passing out feathers to write with, but there were none. Just some little orange sticks topped with what looked like bubblegum."
lines[22] = "Roy took one and pressed it against his paper, and it made a mark in the box, so Henry copied him. Just like that, it was done. That was the muggle version of sorting."
lines[23] = "Roy and Henry turned in their forms and were shepherded into a different line. They were given trays and walked past a counter with a glass sneeze shield."
lines[24] = "A frumpy old woman ladled heaps of orange goo onto their trays from a big metal bin that was indeed labeled \"macaroni and cheese.\" Henry couldn't see a single noodle in there."
lines[25] = "Then they found their way to tables and sat in no particular order; Henry didn't even know who the other members of Churchill B were yet."
lines[26] = "\"So this is the feast?\" Henry asked, poking at his goo. Roy had already devoured half of his portion."
lines[27] = "\"Yep!\" Roy said. \"But don't get used to it. My brothers said the food gets worse after the first night. They're trying to make a good impression and whatnot.\" He followed that sentence by shoveling another forkful into his mouth."
lines[28] = "Henry looked down at his orange blob. He decided he didn't like being a scientist very much."
addTale(user, title, prompt, lines)

user = User.all.sample
title = "Nose Cheese"
prompt = "A man orders a \"cheese pizza with no crust\" from a local pizza delivery joint as a joke. Unbeknownst to him, that pizza joint is a drug front and he just placed an order for a kilo of cocaine. (story from: /u/Hostiel)"
lines = []
lines[0] = "At the sound of the doorbell, I heaved myself from my seat.<br><br>I moved over to the door, ready to go on an angry rant about the time. Who the hell thought two in the morning was a good time to turn up at your house? They could’ve woken me up!"
lines[1] = "They didn’t, but they could’ve, and it’s the thought that counts. I opened the door and my words died on my lips. A man in a pizza deliveryman’s costume stood there, smoking a cigarette and flanked by two burly men in tracksuits."
lines[2] = "Behind them, a bright red SUV was parked, its lights off but engine still gently running.<br><br>\"Uh...hi?\"<br><br>The pizza man dropped his cigarette. \"Show us the money first.\""
lines[3] = "I glanced around. \"Am...am I being robbed?\"<br><br>The man snorted. \"Robbed? Hell no. We’ve got the best prices around.\""
lines[4] = "I looked at the symbol on the man’s hat and came to a sudden realisation. \"You’re from Notmafiosos’ Pizza Parlour!\"<br><br>\"Hell yeah, I am. Now where’s the money?\""
lines[5] = "\"I called you guys six hours ago.\" Prank-called them, to be specific, asking for a ridiculous order. Come to think of it, I hadn’t even given them my address."
lines[6] = "The pizza man snorted. \"What, you thought we were gonna come in broad daylight? And people don’t normally ask for such massive amounts.\""
lines[7] = "\"I only asked for a cheese pizza with no crust.\"<br><br>\"Man, what do you mean ‘only’? It would take years to get through a cheese pizza without the crust. What do you normally buy?\""
lines[8] = "I rolled my eyes. \"A Hawaiian pizza with no cheese or pineapple.\"<br><br>The pizza man’s eyes widened. \"Holy shit, dude. Are you some kind of millionaire?\" He turned back to one of the men. \"This guy’s a real buyer; go get the product.\""
lines[9] = "The man nodded and headed back to the SUV. He rooted around in it for a minute before turning the lights on, revealing a myriad of logos for Notmafiosos’ Pizza Parlour that I somehow hadn’t seen before."
lines[10] = "He returned soon, clutching a briefcase, which he handed to the pizza man, who laid it on the floor and clicked it open, revealing a pristine pizza box. Slowly and carefully, he stood, and then handed it to me."
lines[11] = "\"It’s all in there, dude.\"<br><br>What the hell were these guys on about? I opened the box.<br><br>\"Guys, I didn’t order a box of flour.\""
addTale(user, title, prompt, lines)

10.times do
  tag = Tag.create(name: Faker::Hipster.word)
  (rand(1..Tale.all.size)).times do
    tale = Tale.all.sample until tale && !tag.tales.include?(tale)
    TagsTale.create(tag: tag, tale: tale )
    tale.save
  end
end