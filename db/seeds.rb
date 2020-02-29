require 'faker'

number_of_users = 30

firstname = []
lastname = []
playlist = ["News", "Sport", "Foot", "Tech", "Bazar", "Drôle", "Voyage", "Projet de Sophie", "Boulot",
            "Le Monde", "20 minutes", "Sciences", "Code", "Blog", "Le Wagon", "Javascript", "Rails",
            "Economie", "Sante", "Faits Divers", "Gastronomie", "Cinémas", "Arts", "Mémoires", "Modes",
            "Geek", "Le Figaro", "France", "Japon", "USA"]

File.readlines('db/seed_data/firstname.txt').each do |line|
  firstname << line.chomp
end

File.readlines('db/seed_data/lastname.txt').each do |line|
  lastname << line.chomp
end

puts "⚠️  Destroy all Playlists"
Playlist.destroy_all
puts "⚠️  Destroy all Audio/playlist association"
AudiosPlaylist.destroy_all
puts "⚠️  Destroy all Audios"
Audio.destroy_all
puts "⚠️  Destroy all Users"
User.destroy_all
puts ""
puts ""

puts "➕ Create Users..."
user1 = User.create!(
  email: "test@test.com",
  first_name: "Quentin",
  last_name: "Lallemand",
  nickname: '@Q_Lallemand',
  password:  '123456',
  user_bio: "Champion de France de Hand Spinner, Consultant culinaire spécialisé en churros.
            Aime la biére et les coquillages, modèle pouces et index sur Insta"
)
puts "User ##{user1.id} | #{user1.email} created"

user2 =User.create!(
  email: "test2@test.com",
  first_name: "Mimie",
  last_name: "Mathy",
  nickname: '@Mimie_M',
  password:  '123456',
  user_bio: "Femme fatale et ange gardien, amatrice de grands espaces. Onewoman Show au camping paradis.
            Photographe mains @MimieMainty_off sur Insta"
)
puts "User ##{user2.id} | #{user2.email} created"

user2 =User.create!(
  email: "test3@test.com",
  first_name: "Elon",
  last_name: "Musk",
  nickname: '@Elon_M',
  password:  '123456',
  user_bio: "La tete dans l'espace"
)
puts "User created"

number_of_users.times do
  print "."
  User.create!(
    email: Faker::Internet.email,
    first_name: firstname.sample.capitalize,
    last_name: lastname.sample.upcase,
    nickname: "#{Faker::Name.first_name}_#{('A'..'Z').to_a.sample}",
    password:  '123456',
    password_confirmation: '123456',
    user_bio: Faker::Quote.matz,
  )
end

puts "✔ All users have been created"

Audio.create!(
  text_url: "http://www.footmercato.net/ligue-1/ligue-1-le-formidable-rebond-du-nimes-olympique-en-2020_273709",
  language: "french",
  text_to_transcript: "Ligue 1 : le formidable rebond du Nîmes Olympique en 2020\nLigue 1 : le formidable rebond du Nîmes Olympique en 2020\nPublié le :\nMaxime Barbaud Suivre @MBarbaud\nLargué en première partie de saison, le Nîmes Olympique est déjà en train de refaire surface grâce notamment à l'apport des trois recrues venues lors du mercato d'hiver.\nNîmes s'est complètement relancé dans la course au maintien\n©Maxppp\n« Le chemin est encore long. Il ne faut pas s’arrêter. C’est une bonne passe, il y en aura de plus compliquées. Les joueurs s’accrochent et ne lâchent pas. » Bernard Blaquart n’avait pas encore un large sourire à Nice après la première victoire du Nîmes Olympique à l’extérieur de la saison (3-1). Soulagé mais pas rassasié, l’entraîneur gardois peut tout de même envisager la suite de la saison avec plus de sérénité. Au soir de cette 24e journée, son équipe est 18e, encore barragiste, mais elle s’est complètement relancée en 2020 alors que la plupart des observateurs la condamnaient déjà à la Ligue 2 en mai prochain.\nIl faut dire que le 21 décembre dernier après une nouvelle défaite à Marseille (3-1), Nîmes pointait à la 19e place, à déjà 5 points de la place de barragiste occupée alors par Amiens. Sauf que le mercato et une réorganisation de la cellule de recrutement sont passés par là. La nomination de Reda Hammache au poste de directeur sportif à la fin décembre a permis aux Crocodiles d’amener quelques renforts sur le marché des transferts. À première vue, il n’y a rien de très sexy avec les recrutements de Moussa Koné (3M€ en provenance du Dynamo Dresde), Nolan Roux (arrivé gratuitement de Guingamp) et Yassine Benrahou (prêté par Bordeaux).\nTotal de points doublé rien qu’en 2020\nÀ première vue seulement car une fois sur le terrain, les nouveaux venus ont tout de suite fait la différence. Fort de son expérience en Ligue 1, Nolan Roux a marqué dès son deuxième match (face à Dijon). Entré à une demi-heure de la fin face à Nice alors qu’il était juste physiquement, Moussa Koné a scellé la victoire des siens à l’Allianz Riviera. Et que dire de Benrahou ? Le milieu de terrain a trouvé le chemin du but à deux reprises et distribué une passe décisive en seulement cinq rencontres. Il est surtout à l’origine de pas mal de situations sur coups de pied arrêtés, une arme très peu exploitée durant la première partie de saison. Sur 11 buts marqués en Ligue 1 en 2020 par Nîmes, 5 viennent directement des recrues.\n« J’ai suffisamment dit pendant la première moitié que l’on n’avait pas d’attaque. On avait l’état d’esprit, mais on n’était pas équipé offensivement, reconnaît Blaquart, content de ce mercato très productif. Un Nolan Roux qui avait besoin de se relancer, qui ne jouait pas en Ligue 2, un Benrahou qui avait besoin aussi de se relancer, c’est plutôt un recrutement malin. » Après deux petites victoires lors de la première partie de saison, les Crocos ont déjà remporté 4 matches (en 6 rencontres) de championnat en 2020 et ont doublé leur total de points. « Mais on est toujours barragistes », tranche le coach nîmois. Certes, il y a désormais 4 points d’écart avec le premier relégable, toujours Amiens, mais le travail est encore loin d’être terminé.\n",
  audio_url: "http://res.cloudinary.com/quentinlallemand/video/upload/v1581273207/l2kvo4ztl0n9ygv46u0y.mp3",
  user: User.first,
  title: "Ligue 1 : le formidable rebond du Nîmes Olympique en 2020",
  iso: "fr",
  text_image: "http://www.footmercato.net/images/a/nimes-s-est-completement-relance-dans-la-course-au-maintien_273709.jpg",
  duration: "192",
  text_html: "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<h1 class=\"record\" data-start=\"0\">Ligue 1 : le formidable rebond du Nîmes Olympique en 2020</h1>\n<body><div class=\"line article-text\">\n<p class=\"record\" data-start=\"4.008\"><i>« Le chemin est encore long. Il ne faut pas s'arrêter. C'est une bonne passe, il y en aura de plus compliquées. Les joueurs s'accrochent et ne lâchent pas. »</i> Bernard Blaquart n'avait pas encore un large sourire à Nice après la première victoire du Nîmes Olympique à l'extérieur de la saison (3-1). Soulagé mais pas rassasié, l'entraîneur gardois peut tout de même envisager la suite de la saison avec plus de sérénité. Au soir de cette 24e journée, son équipe est 18e, encore barragiste, mais elle s'est complètement relancée en 2020 alors que la plupart des observateurs la condamnaient déjà à la Ligue 2 en mai prochain.</p>\n<p class=\"record\" data-start=\"39.192\">Il faut dire que le 21 décembre dernier après une nouvelle défaite à Marseille (3-1), Nîmes pointait à la 19e place, à déjà 5 points de la place de barragiste occupée alors par Amiens. Sauf que le mercato et une réorganisation de la cellule de recrutement sont passés par là. La nomination de Reda Hammache au poste de directeur sportif à la fin décembre a permis aux Crocodiles d'amener quelques renforts sur le marché des transferts. À première vue, il n'y a rien de très sexy avec les recrutements de Moussa Koné (3M€ en provenance du Dynamo Dresde), Nolan Roux (arrivé gratuitement de Guingamp) et Yassine Benrahou (prêté par Bordeaux).</p>\n<h3 class=\"spip record\" data-start=\"76.392\">Total de points doublé rien qu'en 2020</h3>\n<p class=\"record\" data-start=\"79.032\">À première vue seulement car une fois sur le terrain, les nouveaux venus ont tout de suite fait la différence. Fort de son expérience en Ligue 1, Nolan Roux a marqué dès son deuxième match (face à Dijon). Entré à une demi-heure de la fin face à Nice alors qu'il était juste physiquement, Moussa Koné a scellé la victoire des siens à l'Allianz Riviera. Et que dire de Benrahou ? Le milieu de terrain a trouvé le chemin du but à deux reprises et distribué une passe décisive en seulement cinq rencontres. Il est surtout à l'origine de pas mal de situations sur coups de pied arrêtés, une arme très peu exploitée durant la première partie de saison. Sur 11 buts marqués en Ligue 1 en 2020 par Nîmes, 5 viennent directement des recrues.</p>\n<p class=\"record\" data-start=\"119.63999999999999\"><i>« J'ai suffisamment dit pendant la première moitié que l'on n'avait pas d'attaque. On avait l'état d'esprit, mais on n'était pas équipé offensivement</i>, reconnaît Blaquart, content de ce mercato très productif. <i>Un Nolan Roux qui avait besoin de se relancer, qui ne jouait pas en Ligue 2, un Benrahou qui avait besoin aussi de se relancer, c'est plutôt un recrutement malin. »</i> Après deux petites victoires lors de la première partie de saison, les Crocos ont déjà remporté 4 matches (en 6 rencontres) de championnat en 2020 et ont doublé leur total de points. <i>« Mais on est toujours barragistes »</i>, tranche le coach nîmois. Certes, il y a désormais 4 points d'écart avec le premier relégable, toujours Amiens, mais le travail est encore loin d'être terminé.</p>\n</div></body>\n</html>\n"
  )

Playlist.create!(
  name: "Podcasts Favoris",
  description: Faker::Quote.matz,
  category: Faker::Food.fruits,
  user: User.first
)
Playlist.create!(
  name: "Podcasts Favoris",
  description: Faker::Quote.matz,
  category: Faker::Food.fruits,
  user: User.find(2)
)
Playlist.create!(
  name: "Podcasts Favoris",
  description: Faker::Quote.matz,
  category: Faker::Food.fruits,
  user: User.find(3)
)
