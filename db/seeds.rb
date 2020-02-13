require 'faker'


puts "Delete Audio database"
Audio.destroy_all
puts "Delete User database"
User.destroy_all



puts "Create User"
User.create!(
  email: "test@test.com",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  nickname: '@John_Preston',
  password:  '123456',
  password_confirmation: '123456',
  user_bio: Faker::Quote.matz
)
print "."

User.create!(
  email: "test2@test.com",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  nickname: '@Martin_Sanchez',
  password:  '123456',
  password_confirmation: '123456',
  user_bio: Faker::Quote.matz
)
print "."

User.create!(
  email: "test3@test.com",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  nickname: '@Salome_Rakhia',
  password:  '123456',
  password_confirmation: '123456',
  user_bio: Faker::Quote.matz
)
print "."
puts "Users created"

puts "Create Audios"

users = User.all

Audio.create!(
  text_url: "http://www.footmercato.net/flash-mercato/manchester-city-aymeric-laporte-previent-le-real-madrid_273705",
  language: "french",
  text_to_transcript: "Manchester City : Aymeric Laporte prévient le Real Madrid\nManchester City : Aymeric Laporte prévient le Real Madrid\nPublié le :\nLucas Billard Suivre @@LucasBillard6\nQui dit mois de février dit Ligue des Champions. Et la plus prestigieuse des compétitions réserve son lot de chocs entre les écuries du Vieux Continent encore en lices dans cette compétition. Le Borussia Dortmund affrontera par exemple le PSG pour rallier les quarts de finale alors que les champions d’Europe (et du monde) en titre, les Reds, croiseront la route de l’Atlético de Madrid. Mais la plus grosse affiche de ces 8es de finale de la C1 opposera le Manchester City de Pep Guardiola au Real Madrid de Zinedine Zidane.\nAymeric Laporte (25 ans), le défenseur central des Citizens, s’est d’ailleurs exprimé au micro de Téléfoot, ce dimanche, au sujet de cette double confrontation à venir (match aller à Madrid le 28 février, match retour à l’Etihad Stadium le 17 mars) : « c’est une des meilleures équipes du monde actuellement et je pense qu’ils sont favoris par rapport aux années précédentes en Ligue de champions et à leur vécu. Après, on a de très grands joueurs, comme eux, on peut faire mal aussi. Ce peut être une confrontation très disputée ». Les Skyblues, doubles champions d’Angleterre en titre, n’ont jamais dépassé les demi-finales en Ligue des Champions alors que les Merengues ont soulevé la coupe aux grandes oreilles à 13 reprises au cours de leur histoire, un record.\n",
  audio_url: "http://res.cloudinary.com/quentinlallemand/video/upload/v1581273176/vexytzmn5fkf7xzpygol.mp3",
  user: users.first,
  title: "Manchester City : Aymeric Laporte prévient le Real Madrid",
  iso: "fr",
  text_image: "https://source.unsplash.com/50x50/?abstract",
  duration: "1:29"
  )
print ".Audio1. "

Audio.create!(
  text_url: nil,
  language: "french",
  text_to_transcript: "Les pompiers professionnels ont annoncé, mardi 28 janvier, la fin de huit mois de grève nationale après une journée de manifestation marquée, à Paris, par des heurts avec les forces de l’ordre. L’annonce de l’intersyndicale est intervenue quelques heures après que le ministre de l’intérieur, Christophe Castaner, s’est engagé par écrit à revaloriser leur prime de feu lors d’une rencontre avec quatorze représentants de la profession. Aujourd’hui égale à 19 % du traitement indiciaire des pompiers professionnels, elle devrait être élevée par décret à 25 % avant l’été, selon le ministère de l’intérieur.\r\n\r\nLire notre enquête : « Nous sommes devenus les médecins des pauvres » : les pompiers face à l’évolution du métier\r\nPrévue au même moment, la manifestation des pompiers à Paris s’est déroulée dans une ambiance tendue avec les forces de l’ordre. La Préfecture de police de Paris a rapidement déploré que certains manifestants « portent leur casque et leur tenue de feu », contrairement à des « engagements » pris par les syndicats avant le défilé. « Vu ce que l’on a vécu le 15 octobre à Paris [la manifestation s’était terminée par des heurts avec la police], les gars ont préféré venir en se protégeant, explique William Moreau, secrétaire général de l’UNSA-SDIS dans les Yvelines, quelques minutes après avoir quitté la manifestation. Ce qui ne veut pas dire s’en prendre aux forces de l’ordre, avec qui nous avons d’ailleurs discuté tout au long du parcours, sauf lors de quelques gazages en tête de cortège. » Evoquant des « manifestants violents prenant à partie les forces de l’ordre », la Préfecture de police a fait état de deux interpellations.\r\n\r\n« C’est une avancée significative, mais pas majeure »\r\nLa revalorisation de la prime de feu constituait une revendication centrale du mouvement des « pompiers en colère », débuté dans de nombreux services départementaux d’incendie et de secours (SDIS) dès le mois de juin 2019 – les pompiers volontaires, moins regroupés syndicalement, ainsi que les pompiers de Paris et de Marseille, au statut de militaires, sont quasiment absents des cortèges. « C’est une avancée significative, mais pas majeure, qui a surtout une forte valeur symbolique », souligne Sébastien Delavoux, représentant CGT-SDIS. Les pompiers professionnels demandaient depuis plusieurs mois que la dangerosité de leur métier soit reconnue au même titre que celle des policiers et des gendarmes.",
  audio_url: "http://res.cloudinary.com/quentinlallemand/video/upload/v1581320682/qn1yxzoc5te3cdndsduq.mp3",
  user: users.first,
  title: "Test text no url",
  iso: "fr",
  text_image: "https://source.unsplash.com/50x50/?abstract",
  duration: "2:19"
  )
print ".Audio2."

Audio.create!(
  text_url: "http://www.footmercato.net/ligue-1/ligue-1-le-formidable-rebond-du-nimes-olympique-en-2020_273709",
  language: "french",
  text_to_transcript: "Ligue 1 : le formidable rebond du Nîmes Olympique en 2020\nLigue 1 : le formidable rebond du Nîmes Olympique en 2020\nPublié le :\nMaxime Barbaud Suivre @MBarbaud\nLargué en première partie de saison, le Nîmes Olympique est déjà en train de refaire surface grâce notamment à l'apport des trois recrues venues lors du mercato d'hiver.\nNîmes s'est complètement relancé dans la course au maintien\n©Maxppp\n« Le chemin est encore long. Il ne faut pas s’arrêter. C’est une bonne passe, il y en aura de plus compliquées. Les joueurs s’accrochent et ne lâchent pas. » Bernard Blaquart n’avait pas encore un large sourire à Nice après la première victoire du Nîmes Olympique à l’extérieur de la saison (3-1). Soulagé mais pas rassasié, l’entraîneur gardois peut tout de même envisager la suite de la saison avec plus de sérénité. Au soir de cette 24e journée, son équipe est 18e, encore barragiste, mais elle s’est complètement relancée en 2020 alors que la plupart des observateurs la condamnaient déjà à la Ligue 2 en mai prochain.\nIl faut dire que le 21 décembre dernier après une nouvelle défaite à Marseille (3-1), Nîmes pointait à la 19e place, à déjà 5 points de la place de barragiste occupée alors par Amiens. Sauf que le mercato et une réorganisation de la cellule de recrutement sont passés par là. La nomination de Reda Hammache au poste de directeur sportif à la fin décembre a permis aux Crocodiles d’amener quelques renforts sur le marché des transferts. À première vue, il n’y a rien de très sexy avec les recrutements de Moussa Koné (3M€ en provenance du Dynamo Dresde), Nolan Roux (arrivé gratuitement de Guingamp) et Yassine Benrahou (prêté par Bordeaux).\nTotal de points doublé rien qu’en 2020\nÀ première vue seulement car une fois sur le terrain, les nouveaux venus ont tout de suite fait la différence. Fort de son expérience en Ligue 1, Nolan Roux a marqué dès son deuxième match (face à Dijon). Entré à une demi-heure de la fin face à Nice alors qu’il était juste physiquement, Moussa Koné a scellé la victoire des siens à l’Allianz Riviera. Et que dire de Benrahou ? Le milieu de terrain a trouvé le chemin du but à deux reprises et distribué une passe décisive en seulement cinq rencontres. Il est surtout à l’origine de pas mal de situations sur coups de pied arrêtés, une arme très peu exploitée durant la première partie de saison. Sur 11 buts marqués en Ligue 1 en 2020 par Nîmes, 5 viennent directement des recrues.\n« J’ai suffisamment dit pendant la première moitié que l’on n’avait pas d’attaque. On avait l’état d’esprit, mais on n’était pas équipé offensivement, reconnaît Blaquart, content de ce mercato très productif. Un Nolan Roux qui avait besoin de se relancer, qui ne jouait pas en Ligue 2, un Benrahou qui avait besoin aussi de se relancer, c’est plutôt un recrutement malin. » Après deux petites victoires lors de la première partie de saison, les Crocos ont déjà remporté 4 matches (en 6 rencontres) de championnat en 2020 et ont doublé leur total de points. « Mais on est toujours barragistes », tranche le coach nîmois. Certes, il y a désormais 4 points d’écart avec le premier relégable, toujours Amiens, mais le travail est encore loin d’être terminé.\n",
  audio_url: "http://res.cloudinary.com/quentinlallemand/video/upload/v1581273207/l2kvo4ztl0n9ygv46u0y.mp3",
  user: users.sample,
  title: "Ligue 1 : le formidable rebond du Nîmes Olympique en 2020",
  iso: "fr",
  text_image: "http://www.footmercato.net/images/a/nimes-s-est-completement-relance-dans-la-course-au-maintien_273709.jpg",
  duration: "3:12"
  )
print ".Audio3."
puts "Audios created"
