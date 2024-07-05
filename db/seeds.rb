require "json"
require "open-uri"

User.destroy_all
Activity.destroy_all
Chatroom.destroy_all

puts 'Creating users...'

user = User.create!(
  email: "alpha@gmail.com",
  password: "123456",
  address: "Cannes",
  nickname: "Alpha",
)
user.save

puts 'Creating activities...'

activity_1 = Activity.new(
  category: "Excursions",
  name: "Excursion Nautique Cannes",
  address: "110 Boulevard du Midi Louise Moreau, Cannes",
  description: "Embarquez sur nos bateaux depuis le port du Béal et longez la célèbre Côte d’Azur direction Antibes, destination incontournable qui attire 3 millions de visiteurs par an !
Au départ de Cannes, nous vous embarquons pour trois heures trente de virée extraordinaire avec au programme une découverte nautique de la baie des milliardaires, du cap d’Antibes, une escale au Vieil Antibes et enfin un détour en bateau aux îles de Lérins.
Faites escale à Antibes, le quartier du port et du Vieil Antibes est particulièrement réputé pour le charme de son patrimoine Vauban.",
  user: user)
pictures1 = ['https://res.cloudinary.com/dtswvq8pg/image/upload/v1719937148/photo-1605472075294-4c73b9909d08_xaa4cm.jpg', 'https://res.cloudinary.com/dtswvq8pg/image/upload/v1719937179/photo-1526112722470-4393b1a797ab_bvwher.jpg', 'https://res.cloudinary.com/dtswvq8pg/image/upload/v1719937217/photo-1559075471-b8a6c70b56c2_zln3yd.jpg']

pictures1.each do |picture|
  file = URI.open(picture)
  activity_1.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_1.save
end

activity_2 = Activity.new(
  category: "Visites",
  name: "Balade culturelle",
  address: "1 Place Bernard Cornut Gentille, Cannes",
  description: "Une visite de Cannes, sympathique et décontractée, pour voir l’essentiel de cette jolie petite ville… De la croisette à la vieille ville, en passant par le port et quelques boutiques de produits locaux où nous aurons le temps de déguster des spécialités locales.
                Nous penserons bien sûr à nous arrêter au marché provençal, à prendre quelques photos et à admirer la vue incroyable de Cannes, sa baie et les îles de Lérins.",
  user: user
)
pictures2 = ['https://res.cloudinary.com/dtswvq8pg/image/upload/v1719937343/photo-1691770126586-f228469bda6b_c5ogfm.jpg', 'https://res.cloudinary.com/dtswvq8pg/image/upload/v1719937429/photo-1536522803715-161ba18e0574_wuw3zt.jpg']
pictures2.each do |picture|
  file = URI.open(picture)
  activity_2.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_2.save
end


activity_4 = Activity.new(
  category: "Activites Nautiques",
  name: "LOCATION D'UN KAYAK SIMPLE - CANNES - Mourre Rouge",
  address: "PORT DU MOURE ROUGE06400 CANNES",
  latitude: 43.55135,
  longitude: 7.01275,
  description: "Le kayak simple est un support qui convient à tous et la Méditerranée est le lieu idéal pour sa pratique. Vous pourrez, au choix, longer la côte Est de Cannes et découvrir des contrées inconnues des touristes ou vous orienter vers l’île Sainte Marguerite et profiter de la vue sur la baie de Cannes loin du tumulte azuréen.
  Réservé aux adultes et aux enfants de plus de 16 ans.
  Les mineurs doivent être accompagnés d’un adulte lors de l’inscription.
  Prévoir une tenue adaptée à la pratique d’activité sportive en mer.
  L’été : maillot de bain ou short de bain + t-shirt ou lycra + chaussures fermées (ou chaussons néoprènes). Prévoir une tenue de rechange + serviette.
  Penser aux lunettes de soleil, crème solaire, casquette, bouteille d’eau.",
  user: user
)
pictures4 = ['https://res.cloudinary.com/dtswvq8pg/image/upload/v1719937725/photo-1450500392544-c2cb0fd6e3b8_bwreka.jpg', 'https://res.cloudinary.com/dtswvq8pg/image/upload/v1719937722/photo-1590508673229-b9b7b7ad754e_kdi0f4.jpg']
pictures4.each do |picture|
  file = URI.open(picture)
  activity_4.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_4.save
end

activity_5 = Activity.new(
  category: "Pour les enfants",
  name: "Les îles de Lérins",
  address: "06400 Cannes",
  latitude: 43.55135,
  longitude: 7.01275,
  description: "À seulement 20min de la Baie de Cannes, reposent paisiblement les Iles de Lérins. Célèbres pour leur histoire et les moines qui y résident, c’est un véritable havre de paix qui mérite le détour.
  Après de jolies balades sous les pins et une visite au château, vous trouverez rapidement un lieu propice à la baignade, au pique-nique et au farniente. Préférez les eaux turquoise situées entre les 2 îles pour initier les petits nageurs au snorkeling. Les poissons méditerranéens n’y sont pas farouches et vous pourrez contempler l’écomusée sous-marin inauguré en 2021.",
  user: user
)
pictures5 = ['https://res.cloudinary.com/dtswvq8pg/image/upload/v1719945392/photo-1707282400097-f1a6b2728433_pz0aes.jpg', 'https://res.cloudinary.com/dtswvq8pg/image/upload/v1719945339/photo-1699735568928-61486b582157_qj6mms.jpg',]
pictures5.each do |picture|
  file = URI.open(picture)
  activity_5.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_5.save
end

activity_6 = Activity.new(
  category: "Expériences",
  name: "Randonnée dans le Vercors",
  address: "",
  latitude: 44.841475,
  longitude: 5.188901,
  description: "Dépaysement total dans ce superbe canyon entre deux falaises étroites. Lieu atypique d'une crevasse qui s’enfonce vers nulle part avec une atmosphère calme et sombre entre blocs rocheux, lichens et fougères.",
  user: user
)
pictures6 = ['https://res.cloudinary.com/dtswvq8pg/image/upload/v1719937911/licensed-image_hvp3ps.jpg', 'https://res.cloudinary.com/dtswvq8pg/image/upload/v1719937904/licensed-image_ogblz4.jpg']
pictures6.each do |picture|
  file = URI.open(picture)
  activity_6.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_6.save
end

activity_7 = Activity.new(category: "Expériences",
  name: "Randonnée dans le Vercors",
  address: "",
  latitude: 44.885409,
  longitude: 5.44263,
  description: "Dépaysement total dans ce superbe canyon entre deux falaises étroites. Lieu atypique d'une crevasse qui s’enfonce vers nulle part avec une atmosphère calme et sombre entre blocs rocheux, lichens et fougères.",
  user: user
)
pictures7 = ['https://res.cloudinary.com/dtswvq8pg/image/upload/v1719937898/licensed-image_juu2x5.jpg', 'https://res.cloudinary.com/dtswvq8pg/image/upload/v1719937893/licensed-image_sukr3e.jpg']
pictures7.each do |picture|
    file = URI.open(picture)
  activity_7.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_7.save
end

activity_8 = Activity.new(
  category: "Parcs",
  name: "Square Reynaldo Hahn",
  address: "Square Reynaldo Hahn, 06400 Cannes",
  latitude: 43.55135, longitude: 7.01275,
  description: "Jolie parc de jeux pour enfants, avec tobogans et jeux à proximité de la mer.",
  user: user
)
pictures8 = ['https://res.cloudinary.com/dtswvq8pg/image/upload/v1719946008/photo-1526834527924-83a042ea7711_j4d2vp.jpg', 'https://res.cloudinary.com/dtswvq8pg/image/upload/v1719946073/photo-1453342664588-b702c83fc822_erueoy.jpg' ]
pictures8.each do |picture|
  file = URI.open(picture)
  activity_8.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_8.save
end

activity_9 = Activity.new(
  category: "Producteurs",
  name: "FERME DES RAPILLES",
  address: "97 chemin du Rivet, 38360, engins",
  description: "Productions de la ferme : Fromages : bleu du Vercors-Sassenage, Rapille, raclette, faisselles, beurre, St Sornin, tommette du Vercors,le petit enginois, la raclette
  Productions labellisées Agriculture biologique : 100 % de notre production sous label agriculture biologique",
  user: user
)
pictures9 = ['https://res.cloudinary.com/dtswvq8pg/image/upload/v1719946008/photo-1526834527924-83a042ea7711_j4d2vp.jpg', 'https://res.cloudinary.com/dtswvq8pg/image/upload/v1719946073/photo-1453342664588-b702c83fc822_erueoy.jpg']
pictures9.each do |picture|
  file = URI.open(picture)
  activity_9.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_9.save
end

activity_10 = Activity.new(
  category: "Producteurs",
  name: "Ferme les Colibris",
  address: "Les Arnauds, 38112, meaudre",
  description: "La ferme des Colibris vous accueille sur son exploitation située au coeur du Massif du Vercors.
                Notre exploitation est certifiée en Agriculture Biologique.
                Vente de viande de boeuf, veau, porc et charcuteries. Oeufs. Vente au détail ou caissettes de 5kg.

                Découpe sur place, par nos soins, dans notre salle de découpe.
                Productions de la ferme : La Ferme des Colibris vous accueille sur place, pour une visite auprès des animaux et l'achat de votre viande en vente directe.",
  user: user
)
pictures10 = ['https://res.cloudinary.com/dtswvq8pg/image/upload/v1719946008/photo-1526834527924-83a042ea7711_j4d2vp.jpg', 'https://res.cloudinary.com/dtswvq8pg/image/upload/v1719946073/photo-1453342664588-b702c83fc822_erueoy.jpg']
pictures10.each do |picture|
  file = URI.open(picture)
  activity_10.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_10.save
end

activity_11 = Activity.new(
  category: "Au marché",
  name: "Marché Europole",
  address: "Place Firmin Gautier, 38000 Grenoble",
  description: "Ce marché à lieu toute l'année le jeudi de 15h à 19h",
  user: user
)
pictures11 = ['https://res.cloudinary.com/dtswvq8pg/image/upload/v1719946008/photo-1526834527924-83a042ea7711_j4d2vp.jpg', 'https://res.cloudinary.com/dtswvq8pg/image/upload/v1719946073/photo-1453342664588-b702c83fc822_erueoy.jpg']
pictures11.each do |picture|
  file = URI.open(picture)
  activity_11.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_11.save
end

activity_12 = Activity.new(
  category: "Au marché",
  name: "Marché Tublan",
  address: "Centre ville de Grenoble, 38000 Grenoble",
  description: "Ce marché à lieu toute l'année, du mardi au dimanche, de 8h à 13h",
  user: user
)
pictures12 = ['https://res.cloudinary.com/dtswvq8pg/image/upload/v1719946008/photo-1526834527924-83a042ea7711_j4d2vp.jpg', 'https://res.cloudinary.com/dtswvq8pg/image/upload/v1719946073/photo-1453342664588-b702c83fc822_erueoy.jpg']
pictures12.each do |picture|
  file = URI.open(picture)
  activity_12.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_12.save
end


activity_13 = Activity.new(
  category: "Au marché",
  name: "Marché Libération",
  address: "88 Cours de la Libération, 38000 Grenoble",
  description: "Ce marché à lieu toute l'année, le vendredi et samedi, de 6h à 13h",
  user: user
)
pictures13 = ['https://res.cloudinary.com/dtswvq8pg/image/upload/v1719946008/photo-1526834527924-83a042ea7711_j4d2vp.jpg', 'https://res.cloudinary.com/dtswvq8pg/image/upload/v1719946073/photo-1453342664588-b702c83fc822_erueoy.jpg']
pictures13.each do |picture|
  file = URI.open(picture)
  activity_13.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_13.save
end

activity_14 = Activity.new(
  category: "Musées",
  name: "Musée des Beaux-Arts de Lyon",
  address: "20 Place des Terreaux, 69001 Lyon France",
  description: "Une visite au Musée des Beaux-Arts de Lyon est un must pour les amateurs d'art. Découvrez les œuvres de Picasso, Rodin, El Greco et bien plus encore. Pour une entrée gratuite à ce musée et à d'autres attractions de la ville, pensez au «Lyon City Card».",
  user: user
)
pictures14 = ['https://res.cloudinary.com/dtswvq8pg/image/upload/v1719946008/photo-1526834527924-83a042ea7711_j4d2vp.jpg', 'https://res.cloudinary.com/dtswvq8pg/image/upload/v1719946073/photo-1453342664588-b702c83fc822_erueoy.jpg']
pictures14.each do |picture|
  file = URI.open(picture)
  activity_14.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_14.save
end

activity_15 = Activity.new(
  category: "Musées",
  name: "Musée Miniature et Cinéma",
  address: "60 rue Saint Jean, 69005 Lyon France",
  description: "Visitez les coulisses de vos films préférés au Musée Miniature et Cinéma. Des accessoires et costumes à une collection de scènes miniatures complexes, il y en a pour toute la famille. Pensez à acheter vos billets à l'avance pour gagner du temps et éviter les files d'attente.",
  user: user)
pictures15 = ['https://res.cloudinary.com/dtswvq8pg/image/upload/v1719946008/photo-1526834527924-83a042ea7711_j4d2vp.jpg', 'https://res.cloudinary.com/dtswvq8pg/image/upload/v1719946073/photo-1453342664588-b702c83fc822_erueoy.jpg']
pictures15.each do |picture|
  file = URI.open(picture)
  activity_15.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_15.save
  end

  puts "Creating chatrooms..."

  chatroom_1 = Chatroom.create!(name: "général")

  chatroom_1.save

  puts "All done! 🎉"


