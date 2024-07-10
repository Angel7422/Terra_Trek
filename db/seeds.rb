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
  description: "Joli parc de jeux pour enfants, avec tobogans et jeux à proximité de la mer.",
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
  name: "Marché des Eaux-Claires",
  address: "1 Rue Henri Dunant,38100 Grenoble",
  description: "Ce marché à lieu toute l'année, le mardi et jeudi, de 7h à 13h. Le samedi jusqu'à 13h30.",
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

activity_16 = Activity.new(
  category: "Culture",
  name: "Quiveutpister",
  address: "Place Bellecour, 69005 Lyon",
  latitude: 45.7542,
  longitude: 4.8309,
  description: "Envie d’aventure au coeur de Lyon ? Alors, menez l’enquête dans les rues lyonnaises et découvrez des lieux connus et méconnus avec les jeux de piste QuiveutpisterLyon.",
  user: user
)
pictures16 = ['https://res.cloudinary.com/dafkgjhwt/image/upload/v1720533920/5b8f8fe4-7fe2-4c3d-b25e-8bd7dd48decc.png', 'https://res.cloudinary.com/dafkgjhwt/image/upload/v1720534045/c60c9956-dab2-434a-bed8-c5b9491cc04a.png']
pictures16.each do |picture|
  file = URI.open(picture)
  activity_16.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_16.save
end

activity_17 = Activity.new(
  category: "Nature",
  name: "Le bois des Lutins",
  address: "La combe du loup, D 518 - 38790 Diémoz",
  latitude: 45.5367,
  longitude: 5.1103,
  description: "Profitez d’une sortie à la journée pour découvrir plus de 25 attractions telles que le Village de Cabanes dans le Monde d’En haut, la Luge des lutins, la Grande Mer de filets, le Kioskamusik… sans oublier en 2024, le « Secret des trolls » l’attraction la plus immersive et imposante (200m2) du parc, mais aussi la première attraction 'augmentée', avec des décors époustouflants (champignons magiques, minerais précieux) et des effets sonores et lumineux.",
  user: user
)
pictures17 = ['https://res.cloudinary.com/dafkgjhwt/image/upload/v1720535873/b9a3def7-0bad-4292-810f-4901d389e021.png', 'https://res.cloudinary.com/dafkgjhwt/image/upload/v1720535938/1b62eaf6-843c-423a-8b48-d16e67f2ec75.png']
pictures17.each do |picture|
  file = URI.open(picture)
  activity_17.pictures.attach(io: file, filename: 'activity', content_type: 'image/png')
  activity_17.save
end

activity_18 = Activity.new(
  category: "Au Marché",
  name: "Food Tour 'No Diet Club'",
  address: "Place de la Croix-Rousse",
  latitude: 45.774503,
  longitude: 4.831871,
  description: "Partez pour une expérience culinaire unique à l'occasion d'une balade au cœur de Lyon. Vous profiterez de spécialités locales bien sûr mais pas seulement ! Vous allez adorer l'ambiance décalée de ce quartier et la quantité de nourriture que vous aurez la chance de déguster.
  Votre 'No Diet' Food Tour
Durée : 3 heures - Une dizaine de produits dégustés - Explications culturelles
Dégustations de nombreux produits dans la Vieille Ville
Anecdotes de votre guide sur la ville et la région
Exemples de mets dégustés : praluline, plateau de charcuteries et de fromages de la région, un burger exceptionnel, coussins à la noisette.
Lors de cette activité, vous profiterez des meilleurs plats, sélectionnés par les guides pour votre plus grand plaisir. Souvenirs garantis pour tous les participants !",
  user: user
)
pictures18 = ['https://res.cloudinary.com/dafkgjhwt/image/upload/v1720594120/0c7b4eb9-ae37-4c0f-b48d-8751b7b86a51.png', 'https://res.cloudinary.com/dafkgjhwt/image/upload/v1720594211/ad90d5f3-73ce-4b44-b322-51af24181a07.png']
pictures18.each do |picture|
  file = URI.open(picture)
  activity_18.pictures.attach(io: file, filename: 'activity', content_type: 'image/png')
  activity_18.save
end

activity_19 = Activity.new(
  category: "Producteurs",
  name: "La Ferme de Charly",
  address: "1232, Route de Saint-Abdon 69390 Charly",
  latitude: "45.6644778",
  longitude: "4.7934463",
  description: "C'est ici, dans notre magasin, que vous trouverez les denrées de producteurs locaux, en plus de nos fromages. Les produits proposés varient selon la période et les saisons. Nous pouvons ainsi vous proposer des paniers riches et variés qui raviront vos hôtes et surtout votre famille ! Vous trouverez des fruits et légumes de saison, de la charcuterie artisanale, de la volaille et bien plus encore. A vous de venir compléter cette liste !",
  user: user
)
pictures19 = ["https://res.cloudinary.com/dafkgjhwt/image/upload/v1720596292/34484e74-4568-4fc7-9cd1-60b3b600f893.png", "https://res.cloudinary.com/dafkgjhwt/image/upload/v1720596322/ac1c7a68-6b74-45cd-bbed-7ad441911da6.png"]
pictures19.each do |picture|
  file = URI.open(picture)
  activity_19.pictures.attach(io: file, filename: 'activity', content_type: 'image/png')
  activity_19.save
end

activity_20 = Activity.new(
  category: "Balades",
  name: "Ascension du Mont Thou",
  address: "Mont Thou, 69450 Saint-Cyr-au-Mont-d'Or, France",
  latitude: "45.8416216",
  longitude: "4.7972667",
  description: "Depuis Poleymieux-au-Mont-d'Or, il va falloir grimper un peu pour atteindre le sommet du Mont Thou, le deuxième plus haut des Monts d'Or avec ses 625 mètres d’altitude. Récompense assurée une fois là-haut, face au sublime panorama qui s’offre à toi : une vue incroyable sur Lyon avec les Alpes en arrière plan !",
  user: user
)
pictures20 = ["https://res.cloudinary.com/dafkgjhwt/image/upload/v1720597295/8c828224-b158-4b6e-b4ff-e619a9d6f592.png", "https://res.cloudinary.com/dafkgjhwt/image/upload/v1720597311/943fb625-4646-4838-9ec6-85f340cc3c45.png"]
pictures20.each do |picture|
  file = URI.open(picture)
  activity_20.pictures.attach(io: file, filename: 'activity', content_type: 'image/png')
  activity_20.save
end

  puts "Creating chatrooms..."

  chatroom_1 = Chatroom.create!(name: "général")

  chatroom_1.save

  puts "All done! 🎉"
