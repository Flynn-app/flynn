require 'faker'


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
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  nickname: '@john_preston',
  password:  '123456',
  user_bio: Faker::Quote.matz
)
puts "User ##{user1.id} | #{user1.email} created"

user2 =User.create!(
  email: "test2@test.com",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  nickname: '@martin123',
  password:  '123456',
  user_bio: Faker::Quote.matz
)
puts "User ##{user2.id} | #{user2.email} created"

user3 = User.create!(
  email: "test3@test.com",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  nickname: '@juliaB',
  password:  '123456',
  user_bio: Faker::Quote.matz
)
puts "User ##{user3.id} | #{user3.email} created"

puts "✔ All users have been created"

users = User.all
puts ""
puts ""

puts "➕ Create Playlists"

p1 = Playlist.create!(
  name: "Podcasts Favoris",
  description: Faker::Quote.matz,
  category: Faker::Food.fruits,
  user: users.first
)
puts "Playlist ##{p1.id} | #{p1.name} created"

p2 = Playlist.create!(
  name: "la playlist 2",
  description: Faker::Quote.matz,
  category: Faker::Food.fruits,
  user: users.sample
)
puts "Playlist ##{p2.id} | #{p2.name} created"

p3 = Playlist.create!(
  name: "la playlist 2",
  description: Faker::Quote.matz,
  category: Faker::Food.fruits,
  user: users.sample
)
puts "Playlist ##{p3.id} | #{p3.name} created"

p4 = Playlist.create!(
  name: "la playlist 2",
  description: Faker::Quote.matz,
  category: Faker::Food.fruits,
  user: users.sample
)
puts "Playlist ##{p4.id} | #{p4.name} created"

puts "✔ All playlists have been created"
puts ""
puts ""

puts "➕ Create Audios"

a1 = Audio.create!(
  text_url: "http://www.footmercato.net/autre-championnat/erling-braut-haland-la-machine-a-buts-du-borussia-dortmund_273993",
  language: "french",
  text_to_transcript: "17 septembre 2019. Première journée de la phase de groupes de la Ligue des champions. Alors que le Paris Saint-Germain ne fait qu’une bouchée du Real Madrid (3-0), un exploit a lieu du côté de Salzbourg. Alors que le club autrichien reçoit Genk, un jeune attaquant de 19 ans, Erling Braut Håland inscrit un triplé lors de la victoire des siens (6-1). C’est seulement le troisième joueur de mois de 20 ans de l’Histoire de la compétition à réaliser cet exploit. Seuls Wayne Rooney et Raul l’avaient effectué avant lui. Toute l’Europe est interloquée par la performance et n’a pas fini d’être impressionnée. Dans ce groupe où Salzbourg tient la dragée haute à Liverpool et au Napoli, Håland enfile les buts comme des perles (8 en 5 matches). Il devient ainsi le premier joueur de l’Histoire de la Champions League à marquer lors de ses cinq premiers matches dans la compétition.Ses performances ne passent pas inaperçues bien entendu. D’autant qu’au sein du championnat autrichien, l’attaquant norvégien a les mêmes temps de passage. En 16 matches, il score à 20 reprises dont 4 triplés qui semblent devenir sa marque de fabrique. Le RB Salzbourg devient donc trop petit pour le phénomène. Alors cet hiver, le Borussia Dortmund entame des négociations et fin décembre décroche la signature pour quatre ans d’Håland. Et l’intégration au sein du BVB est express. Pour son premier match, il entre à 30 minutes de la fin sur la pelouse d’Augsbourg. Et alors que son équipe est menée, il inscrit un triplé ! En trois semaines, il écrit l’Histoire en marquant 8 buts en 4 matches et en devenant le premier joueur de Bundesliga à scorer à 7 reprises sur ses 7 premiers tirs cadrés !Le prodige fait honneur à ses deux surnoms : le Monstre et The Manchild (l’homme-enfant) qu’il a obtenu quand il était encore adolescent à Molde. L’un des plus grands clubs de Norvège avait repéré le phénomène très jeune, notamment grâce à son responsable de la cellule de recrutement, John Vik. Débarqué en 2017 en provenance de son club formateur, le Bryne FK, Håland a dû prendre son mal en patience. En pleine croissance, son entraîneur d’alors, un certain Ole Gunnar Solskjaer refuse de le faire jouer afin que son corps se développe dans sa totalité. Bien lui en a pris puisqu’en quelques mois, le fils de l’ancien défenseur de Leeds United, Alf-Inge Håland, prend 12 cm. Du haut de ses désormais 1m94, il peut planer sur le championnat norvégien et empiler les buts (12 en 26 matches en 2018). Des statistiques qui lui ouvrent les portes du Red Bull Salzbourg contre un chèque de 5 M€. La suite on la connait, mais avec le Norvégien il faut se souvenir d’une chose : ce n’est que le début de sa formidable ascension.L’intégralité du focus et du parcours d’Erling Braut Håland est à retrouver dans la vidéo ci-dessus.",
  audio_url: "http://res.cloudinary.com/quentinlallemand/video/upload/v1581870010/oerijw5gfshlactd73sn.mp3",
  user: users.first,
  title: "Erling Braut Håland, la machine à buts du Borussia Dortmund",
  iso: "fr",
  text_image: "http://www.footmercato.net/images/a/focus-sur-erling-braut-haland-l-attaquant-norvegien-de-dortmund_273993.jpg",
  duration: "109",
  )
puts "Podcast ##{a1.id} created"

a2 = Audio.create!(
  text_url: nil,
  language: "french",
  text_to_transcript: "Les pompiers professionnels ont annoncé, mardi 28 janvier, la fin de huit mois de grève nationale après une journée de manifestation marquée, à Paris, par des heurts avec les forces de l’ordre. L’annonce de l’intersyndicale est intervenue quelques heures après que le ministre de l’intérieur, Christophe Castaner, s’est engagé par écrit à revaloriser leur prime de feu lors d’une rencontre avec quatorze représentants de la profession. Aujourd’hui égale à 19 % du traitement indiciaire des pompiers professionnels, elle devrait être élevée par décret à 25 % avant l’été, selon le ministère de l’intérieur.\r\n\r\nLire notre enquête : « Nous sommes devenus les médecins des pauvres » : les pompiers face à l’évolution du métier\r\nPrévue au même moment, la manifestation des pompiers à Paris s’est déroulée dans une ambiance tendue avec les forces de l’ordre. La Préfecture de police de Paris a rapidement déploré que certains manifestants « portent leur casque et leur tenue de feu », contrairement à des « engagements » pris par les syndicats avant le défilé. « Vu ce que l’on a vécu le 15 octobre à Paris [la manifestation s’était terminée par des heurts avec la police], les gars ont préféré venir en se protégeant, explique William Moreau, secrétaire général de l’UNSA-SDIS dans les Yvelines, quelques minutes après avoir quitté la manifestation. Ce qui ne veut pas dire s’en prendre aux forces de l’ordre, avec qui nous avons d’ailleurs discuté tout au long du parcours, sauf lors de quelques gazages en tête de cortège. » Evoquant des « manifestants violents prenant à partie les forces de l’ordre », la Préfecture de police a fait état de deux interpellations.\r\n\r\n« C’est une avancée significative, mais pas majeure »\r\nLa revalorisation de la prime de feu constituait une revendication centrale du mouvement des « pompiers en colère », débuté dans de nombreux services départementaux d’incendie et de secours (SDIS) dès le mois de juin 2019 – les pompiers volontaires, moins regroupés syndicalement, ainsi que les pompiers de Paris et de Marseille, au statut de militaires, sont quasiment absents des cortèges. « C’est une avancée significative, mais pas majeure, qui a surtout une forte valeur symbolique », souligne Sébastien Delavoux, représentant CGT-SDIS. Les pompiers professionnels demandaient depuis plusieurs mois que la dangerosité de leur métier soit reconnue au même titre que celle des policiers et des gendarmes.",
  audio_url: "http://res.cloudinary.com/quentinlallemand/video/upload/v1581320682/qn1yxzoc5te3cdndsduq.mp3",
  user: users.first,
  title: "Test text no url",
  iso: "fr",
  text_image: "https://source.unsplash.com/100x100/?abstract",
  duration: "139",
  )
puts "Podcast ##{a2.id} created"

a3 = Audio.create!(
  text_url: "http://www.footmercato.net/ligue-1/ligue-1-le-formidable-rebond-du-nimes-olympique-en-2020_273709",
  language: "french",
  text_to_transcript: "Ligue 1 : le formidable rebond du Nîmes Olympique en 2020\nLigue 1 : le formidable rebond du Nîmes Olympique en 2020\nPublié le :\nMaxime Barbaud Suivre @MBarbaud\nLargué en première partie de saison, le Nîmes Olympique est déjà en train de refaire surface grâce notamment à l'apport des trois recrues venues lors du mercato d'hiver.\nNîmes s'est complètement relancé dans la course au maintien\n©Maxppp\n« Le chemin est encore long. Il ne faut pas s’arrêter. C’est une bonne passe, il y en aura de plus compliquées. Les joueurs s’accrochent et ne lâchent pas. » Bernard Blaquart n’avait pas encore un large sourire à Nice après la première victoire du Nîmes Olympique à l’extérieur de la saison (3-1). Soulagé mais pas rassasié, l’entraîneur gardois peut tout de même envisager la suite de la saison avec plus de sérénité. Au soir de cette 24e journée, son équipe est 18e, encore barragiste, mais elle s’est complètement relancée en 2020 alors que la plupart des observateurs la condamnaient déjà à la Ligue 2 en mai prochain.\nIl faut dire que le 21 décembre dernier après une nouvelle défaite à Marseille (3-1), Nîmes pointait à la 19e place, à déjà 5 points de la place de barragiste occupée alors par Amiens. Sauf que le mercato et une réorganisation de la cellule de recrutement sont passés par là. La nomination de Reda Hammache au poste de directeur sportif à la fin décembre a permis aux Crocodiles d’amener quelques renforts sur le marché des transferts. À première vue, il n’y a rien de très sexy avec les recrutements de Moussa Koné (3M€ en provenance du Dynamo Dresde), Nolan Roux (arrivé gratuitement de Guingamp) et Yassine Benrahou (prêté par Bordeaux).\nTotal de points doublé rien qu’en 2020\nÀ première vue seulement car une fois sur le terrain, les nouveaux venus ont tout de suite fait la différence. Fort de son expérience en Ligue 1, Nolan Roux a marqué dès son deuxième match (face à Dijon). Entré à une demi-heure de la fin face à Nice alors qu’il était juste physiquement, Moussa Koné a scellé la victoire des siens à l’Allianz Riviera. Et que dire de Benrahou ? Le milieu de terrain a trouvé le chemin du but à deux reprises et distribué une passe décisive en seulement cinq rencontres. Il est surtout à l’origine de pas mal de situations sur coups de pied arrêtés, une arme très peu exploitée durant la première partie de saison. Sur 11 buts marqués en Ligue 1 en 2020 par Nîmes, 5 viennent directement des recrues.\n« J’ai suffisamment dit pendant la première moitié que l’on n’avait pas d’attaque. On avait l’état d’esprit, mais on n’était pas équipé offensivement, reconnaît Blaquart, content de ce mercato très productif. Un Nolan Roux qui avait besoin de se relancer, qui ne jouait pas en Ligue 2, un Benrahou qui avait besoin aussi de se relancer, c’est plutôt un recrutement malin. » Après deux petites victoires lors de la première partie de saison, les Crocos ont déjà remporté 4 matches (en 6 rencontres) de championnat en 2020 et ont doublé leur total de points. « Mais on est toujours barragistes », tranche le coach nîmois. Certes, il y a désormais 4 points d’écart avec le premier relégable, toujours Amiens, mais le travail est encore loin d’être terminé.\n",
  audio_url: "http://res.cloudinary.com/quentinlallemand/video/upload/v1581273207/l2kvo4ztl0n9ygv46u0y.mp3",
  user: users.sample,
  title: "Ligue 1 : le formidable rebond du Nîmes Olympique en 2020",
  iso: "fr",
  text_image: "http://www.footmercato.net/images/a/nimes-s-est-completement-relance-dans-la-course-au-maintien_273709.jpg",
  duration: "192"
  )
puts "Podcast ##{a3.id} created"

puts "✔ All podcats have been created"

audios = Audio.all
playlists_all = Playlist.all
playlists = playlists_all.sample(playlists_all.length - 1)
puts ""
puts ""

puts "➕ Create associations"

ap1 = AudiosPlaylist.create!(
  audio: a1,
  playlist: p1,
  favorite: true
  )
puts "Association ##{ap1.id} created"

ap2 = AudiosPlaylist.create!(
  audio: a2,
  playlist: playlists_all.first,
  favorite: true
  )
puts "Association ##{ap2.id} created"

ap3 = AudiosPlaylist.create!(
  audio: audios.sample,
  playlist: playlists.sample
  )
puts "Association ##{ap3.id} created"

ap4 = AudiosPlaylist.create!(
  audio: audios.sample,
  playlist: playlists.sample
  )
puts "Association ##{ap4.id} created"

ap5 = AudiosPlaylist.create!(
  audio: audios.sample,
  playlist: playlists.sample
  )
puts "Association ##{ap5.id} created"

puts "✔ Audio/playlist associations have been created"

