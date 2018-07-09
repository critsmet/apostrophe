

House.all.each { |x| x.destroy }
HouseMembership.all.each { |x| x.destroy }
Authorship.all.each { |x| x.destroy }
Issue.all.each { |x| x.destroy }
User.all.each { |x| x.destroy }
Article.all.each { |x| x.destroy }
Publication.all.each { |x| x.destroy }
Zine.all.each { |x| x.destroy }


chris = User.create(name: "Chris Metzger", location: "Brooklyn, New York")
tez = User.create(name: "Tez Thinks", location: "Philadelphia, PA")
mo = User.create(name: "Mohammed Fayaz", location: "Queens, New York")
hanna = User.create(name: "Hanna Hurr", location: "Helsinki, Finland")
mark = User.create(name: "Mark Sauer-Utley", location: "Dallas, TX")

mask_pubs = House.create(name: "Mask Publications")
pocs = House.create(name: "The Queer POC Crew")
nerds = House.create(name: "Nerds")

mask = Zine.create(name: "Mask Zine")
Publication.create(publisher_id: mask_pubs.id, publisher_type: mask_pubs.class.name, zine_id: mask.id)

bb = Zine.create(name: "Brown Beauty")
Publication.create(publisher_id: pocs.id, publisher_type: pocs.class.name, zine_id: bb.id)

nerds_mag = Zine.create(name: "Nerds Zine")
Publication.create(publisher_id: nerds.id, publisher_type: nerds.class.name, zine_id: nerds_mag.id)

vegan = Zine.create(name: "Vegan Food Zine")
Publication.create(publisher_id: mark.id, publisher_type: mark.class.name, zine_id: vegan.id)

one = HouseMembership.new
one.user = chris
one.house = mask_pubs
one.save

two = HouseMembership.new
two.user = chris
two.house = pocs
two.save

three = HouseMembership.new
three.user = tez
three.house = pocs
three.save

four = HouseMembership.new
four.user = mo
four.house = pocs
four.save

five = HouseMembership.new
five.user = hanna
five.house = mask_pubs
five.save

mask_one = Issue.create(name: "Get It Issue", zine_id: mask.id)
mask_two = Issue.create(name: "Tiger Issue", zine_id: mask.id)
vegan_one = Issue.create(name: "Good Food Issue", zine_id: vegan.id)
bb_one = Issue.create(name: "Highlighters Galore", zine_id: bb.id)
nerds_one = Issue.create(name: "So Over Star Wars", zine_id: nerds_mag.id)

everybody = Article.create(title: "Everybody Loves Their Body", body: "A lot of stuff goes in here about bodies! Weird and interesting!", issue_id: bb_one.id)
hungry = Article.create(title: "Everybody Gets Hungry", body: "A lot of stuff goes in here about getting hungry!! Hangry and interesting!", issue_id: vegan_one.id)
winning = Article.create(title: "Everybody Loves Winning", body: "A lot of stuff goes in here about winning! Happy and interesting!", issue_id: mask_one.id)
pretty = Article.create(title: "Everybody Loves Looking Pretty", body: "A lot of stuff goes in here about being gorgeous! Beautiful and interesting!", issue_id: mask_one.id)
computing = Article.create(title: "Everybody Loves Computing", body: "A lot of stuff goes in here about computing! Long and not very interesting!", issue_id: nerds_one.id)

Authorship.create(user_id: hanna.id, article_id: everybody.id)
Authorship.create(user_id: tez.id, article_id: everybody.id)
Authorship.create(user_id: tez.id, article_id: winning.id)
Authorship.create(user_id: mo.id, article_id: pretty.id)
Authorship.create(user_id: chris.id, article_id: pretty.id)
Authorship.create(user_id: mark.id, article_id: hungry.id)
