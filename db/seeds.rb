require "json"
require "open-uri"
require "cloudinary"

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
  category: "Activites",
  name: "Excursion Nautique Cannes",
  city: "Cannes",
  address: "110 Boulevard du Midi Louise Moreau, Cannes",
  description: "Embarquez sur nos bateaux depuis le port du Béal et longez la célèbre Côte d’Azur direction Antibes, destination incontournable qui attire 3 millions de visiteurs par an !
Au départ de Cannes, nous vous embarquons pour trois heures trente de virée extraordinaire avec au programme une découverte nautique de la baie des milliardaires, du cap d’Antibes, une escale au Vieil Antibes et enfin un détour en bateau aux îles de Lérins.
Faites escale à Antibes, le quartier du port et du Vieil Antibes est particulièrement réputé pour le charme de son patrimoine Vauban.",
bookable: true,
user: user)
pictures1 = ['https://images.unsplash.com/photo-1463567517034-628c51048aa2?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'https://images.unsplash.com/photo-1540544660406-6a69dacb2804?q=80&w=2528&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D']

pictures1.each do |picture|
  file = URI.open(picture)
  activity_1.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_1.save
end

activity_2 = Activity.new(
  category: "Communaute",
  name: "Balade culturelle",
  address: "1 Place Bernard Cornut Gentille, Cannes",
  description: "Une visite de Cannes, sympathique et décontractée, pour voir l’essentiel de cette jolie petite ville… De la croisette à la vieille ville, en passant par le port et quelques boutiques de produits locaux où nous aurons le temps de déguster des spécialités locales.
                Nous penserons bien sûr à nous arrêter au marché provençal, à prendre quelques photos et à admirer la vue incroyable de Cannes, sa baie et les îles de Lérins.",
  user: user
)
pictures2 = ['https://images.unsplash.com/photo-1696971000682-ce3c96768268?q=80&w=2531&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'https://images.unsplash.com/photo-1659642081573-ac1a040d2e50?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D']
pictures2.each do |picture|
  file = URI.open(picture)
  activity_2.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_2.save
end


activity_4 = Activity.new(
  category: "Activites",
  name: "Location Kayak - Mourre Rouge",
  address: "Port du Moure Rouge, 06400 CANNES",
  city: "Cannes",
  latitude: 43.55135,
  longitude: 7.01275,
  description: "Le kayak simple est un support qui convient à tous et la Méditerranée est le lieu idéal pour sa pratique. Vous pourrez, au choix, longer la côte Est de Cannes et découvrir des contrées inconnues des touristes ou vous orienter vers l’île Sainte Marguerite et profiter de la vue sur la baie de Cannes loin du tumulte azuréen.
  Réservé aux adultes et aux enfants de plus de 16 ans.
  Les mineurs doivent être accompagnés d’un adulte lors de l’inscription.
  Prévoir une tenue adaptée à la pratique d’activité sportive en mer.
  L’été : maillot de bain ou short de bain + t-shirt ou lycra + chaussures fermées (ou chaussons néoprènes). Prévoir une tenue de rechange + serviette.
  Penser aux lunettes de soleil, crème solaire, casquette, bouteille d’eau.",
  bookable: true,
  user: user
)
pictures4 = ['https://images.unsplash.com/photo-1659642081573-ac1a040d2e50?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'https://images.unsplash.com/photo-1525721653822-f9975a57cd4c?q=80&w=2190&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D']
pictures4.each do |picture|
  file = URI.open(picture)
  activity_4.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_4.save
end

activity_5 = Activity.new(
  category: "Activites",
  name: "Les îles de Lérins",
  address: "06400 Cannes",
  city: "Cannes",
  latitude: 43.55135,
  longitude: 7.01275,
  description: "À seulement 20min de la Baie de Cannes, reposent paisiblement les Iles de Lérins. Célèbres pour leur histoire et les moines qui y résident, c’est un véritable havre de paix qui mérite le détour.
  Après de jolies balades sous les pins et une visite au château, vous trouverez rapidement un lieu propice à la baignade, au pique-nique et au farniente. Préférez les eaux turquoise situées entre les 2 îles pour initier les petits nageurs au snorkeling. Les poissons méditerranéens n’y sont pas farouches et vous pourrez contempler l’écomusée sous-marin inauguré en 2021.",
  user: user
)
pictures5 = ['https://images.unsplash.com/photo-1519046904884-53103b34b206?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'https://images.unsplash.com/photo-1510414842594-a61c69b5ae57?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D']
pictures5.each do |picture|
  file = URI.open(picture)
  activity_5.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_5.save
end

activity_6 = Activity.new(
  category: "Communaute",
  name: "Randonnée dans le Vercors",
  address: "Place Pietri, 26420 La Chapelle-en-Vercors",
  city: "La Chapelle-en-Vercors",
  latitude: 44.841475,
  longitude: 5.188901,
  description: "Dépaysement total dans ce superbe canyon entre deux falaises étroites. Lieu atypique d'une crevasse qui s’enfonce vers nulle part avec une atmosphère calme et sombre entre blocs rocheux, lichens et fougères.",
  user: user
)
pictures6 = ['https://images.unsplash.com/photo-1693326938409-d4341666b5ee?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'https://images.unsplash.com/photo-1590864303607-12c72a1d861f?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D']
pictures6.each do |picture|
  file = URI.open(picture)
  activity_6.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_6.save
end

activity_8 = Activity.new(
  category: "Communaute",
  name: "Square Reynaldo Hahn",
  address: "Square Reynaldo Hahn, 06400 Cannes",
  city: "Cannes",
  latitude: 43.55135, longitude: 7.01275,
  description: "Joli parc de jeux pour enfants, avec tobogans et jeux à proximité de la mer.",
  user: user
)
pictures8 = ['https://images.unsplash.com/photo-1519340241574-2cec6aef0c01?q=80&w=2532&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'https://images.unsplash.com/photo-1440288736878-766bd5839edb?q=80&w=2674&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D']
pictures8.each do |picture|
  file = URI.open(picture)
  activity_8.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_8.save
end

activity_9 = Activity.new(
  category: "Producteurs",
  name: "Ferme des Rapilles",
  address: "97 chemin du Rivet, 38360, engins",
  city: "Engins",
  description: "Productions de la ferme : Fromages : bleu du Vercors-Sassenage, Rapille, raclette, faisselles, beurre, St Sornin, tommette du Vercors,le petit enginois, la raclette
  Productions labellisées Agriculture biologique : 100 % de notre production sous label agriculture biologique",
  bookable: true,
  user: user
)
pictures9 = ['https://images.unsplash.com/photo-1626957341926-98752fc2ba90?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'https://images.unsplash.com/photo-1668094497457-29f4bd775c95?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D']
pictures9.each do |picture|
  file = URI.open(picture)
  activity_9.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_9.save
end

activity_10 = Activity.new(
  category: "Producteurs",
  name: "Ferme les Colibris",
  address: "Les Arnauds, 38112, meaudre",
  city: "Meaudre",
  description: "La ferme des Colibris vous accueille sur son exploitation située au coeur du Massif du Vercors.
                Notre exploitation est certifiée en Agriculture Biologique.
                Vente de viande de boeuf, veau, porc et charcuteries. Oeufs. Vente au détail ou caissettes de 5kg.

                Découpe sur place, par nos soins, dans notre salle de découpe.
                Productions de la ferme : La Ferme des Colibris vous accueille sur place, pour une visite auprès des animaux et l'achat de votre viande en vente directe.",
  bookable: true,
  user: user
)
pictures10 = ['https://images.unsplash.com/photo-1602470521006-aaea8b2fcc36?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'https://images.unsplash.com/photo-1602491950780-1c5411ecfdf6?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D']
pictures10.each do |picture|
  file = URI.open(picture)
  activity_10.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_10.save
end

activity_11 = Activity.new(
  category: "Producteurs",
  name: "Marché Europole",
  address: "Place Firmin Gautier, 38000 Grenoble",
  city: "Grenoble",
  description: "Ce marché à lieu toute l'année le jeudi de 15h à 19h",
  user: user
)
pictures11 = ['https://plus.unsplash.com/premium_photo-1686529896385-8a8d581d0225?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'https://images.unsplash.com/photo-1620095200055-9d1c4f36ba43?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D']
pictures11.each do |picture|
  file = URI.open(picture)
  activity_11.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_11.save
end

activity_12 = Activity.new(
  category: "Producteurs",
  name: "Marché Tublan",
  address: "Centre ville de Grenoble, 38000 Grenoble",
  city: "Grenoble",
  description: "Ce marché à lieu toute l'année, du mardi au dimanche, de 8h à 13h",
  user: user
)
pictures12 = ['https://images.unsplash.com/photo-1573481078935-b9605167e06b?q=80&w=2671&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'https://images.unsplash.com/photo-1588005011879-5b79164c0cbc?q=80&w=2674&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D']
pictures12.each do |picture|
  file = URI.open(picture)
  activity_12.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_12.save
end


activity_13 = Activity.new(
  category: "Producteurs",
  name: "Marché des Eaux-Claires",
  address: "1 Rue Henri Dunant,38100 Grenoble",
  city: "Grenoble",
  description: "Ce marché à lieu toute l'année, le mardi et jeudi, de 7h à 13h. Le samedi jusqu'à 13h30.",
  user: user
)
pictures13 = ['https://images.unsplash.com/photo-1488459716781-31db52582fe9?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'https://images.unsplash.com/photo-1553426971-e1937d26f49b?q=80&w=2531&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D']
pictures13.each do |picture|
  file = URI.open(picture)
  activity_13.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_13.save
end

activity_14 = Activity.new(
  category: "Activites",
  name: "Musée des Beaux-Arts de Lyon",
  address: "20 Place des Terreaux, 69001 Lyon France",
  city: "Lyon",
  description: "Une visite au Musée des Beaux-Arts de Lyon est un must pour les amateurs d'art. Découvrez les œuvres de Picasso, Rodin, El Greco et bien plus encore. Pour une entrée gratuite à ce musée et à d'autres attractions de la ville, pensez au «Lyon City Card».",
  bookable: true,
  user: user
)
pictures14 = ['https://images.unsplash.com/photo-1583306346437-f2143c0f11fc?q=80&w=2671&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'https://images.unsplash.com/photo-1563000215-e31a8ddcb2d0?q=80&w=2656&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D']
pictures14.each do |picture|
  file = URI.open(picture)
  activity_14.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_14.save
end

activity_15 = Activity.new(
  category: "Activites",
  name: "Musée Miniature et Cinéma",
  address: "60 rue Saint Jean, 69005 Lyon France",
  city: "Lyon",
  description: "Visitez les coulisses de vos films préférés au Musée Miniature et Cinéma. Des accessoires et costumes à une collection de scènes miniatures complexes, il y en a pour toute la famille. Pensez à acheter vos billets à l'avance pour gagner du temps et éviter les files d'attente.",
  bookable: true,
  user: user)
pictures15 = ['https://images.unsplash.com/photo-1667831961826-ce5ef3eb9094?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'https://images.unsplash.com/photo-1614350048512-98ef79f6f829?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D']
pictures15.each do |picture|
  file = URI.open(picture)
  activity_15.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_15.save
  end

activity_16 = Activity.new(
  category: "Activites",
  name: "Qui veut pister ?",
  address: "Place Bellecour, 69005 Lyon",
  city: "Lyon",
  latitude: 45.7542,
  longitude: 4.8309,
  description: "Envie d’aventure au coeur de Lyon ? Alors, menez l’enquête dans les rues lyonnaises et découvrez des lieux connus et méconnus avec les jeux de piste QuiveutpisterLyon.",
  user: user
)
pictures16 = ['https://images.unsplash.com/photo-1588240668832-a12810ca39de?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'https://images.unsplash.com/photo-1521713362244-1b5e5d150b29?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D']
pictures16.each do |picture|
  file = URI.open(picture)
  activity_16.pictures.attach(io:file, filename: 'activity', content_type: 'image/png')
  activity_16.save
end

activity_17 = Activity.new(
  category: "Communaute",
  name: "Le bois des Lutins",
  address: "La combe du loup, D 518 - 38790 Diémoz",
  city: "Diémoz",
  latitude: 45.5367,
  longitude: 5.1103,
  description: "Profitez d’une sortie à la journée pour découvrir plus de 25 attractions telles que le Village de Cabanes dans le Monde d’En haut, la Luge des lutins, la Grande Mer de filets, le Kioskamusik… sans oublier en 2024, le « Secret des trolls » l’attraction la plus immersive et imposante (200m2) du parc, mais aussi la première attraction 'augmentée', avec des décors époustouflants (champignons magiques, minerais précieux) et des effets sonores et lumineux.",
  user: user
)
pictures17 = ['https://images.unsplash.com/photo-1505731110654-99d7f7f8e39c?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'https://images.unsplash.com/photo-1560831269-3faa2fc0b932?q=80&w=2671&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D']
pictures17.each do |picture|
  file = URI.open(picture)
  activity_17.pictures.attach(io: file, filename: 'activity', content_type: 'image/png')
  activity_17.save
end

activity_18 = Activity.new(
  category: "Producteurs",
  name: "Food Tour 'No Diet Club'",
  city: "Lyon",
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
pictures18 = ['https://images.unsplash.com/photo-1614602638662-c7c1f55c33f9?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'https://images.unsplash.com/photo-1541557435984-1c79685a082b?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D']
pictures18.each do |picture|
  file = URI.open(picture)
  activity_18.pictures.attach(io: file, filename: 'activity', content_type: 'image/png')
  activity_18.save
end

activity_19 = Activity.new(
  category: "Producteurs",
  name: "La Ferme de Charly",
  address: "1232, Route de Saint-Abdon 69390 Charly",
  city: "Lyon",
  latitude: "45.6644778",
  longitude: "4.7934463",
  description: "C'est ici, dans notre magasin, que vous trouverez les denrées de producteurs locaux, en plus de nos fromages. Les produits proposés varient selon la période et les saisons. Nous pouvons ainsi vous proposer des paniers riches et variés qui raviront vos hôtes et surtout votre famille ! Vous trouverez des fruits et légumes de saison, de la charcuterie artisanale, de la volaille et bien plus encore. A vous de venir compléter cette liste !",
  bookable: true,
  user: user
)
pictures19 = ['https://images.unsplash.com/photo-1563906832557-b53ca701b251?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'https://images.unsplash.com/photo-1566935404705-c22355bfa3ac?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D']
pictures19.each do |picture|
  file = URI.open(picture)
  activity_19.pictures.attach(io: file, filename: 'activity', content_type: 'image/png')
  activity_19.save
end

activity_20 = Activity.new(
  category: "Communaute",
  name: "Ascension du Mont Thou",
  address: "Mont Thou, 69450 Saint-Cyr-au-Mont-d'Or, France",
  city: "Saint-Cyr-au-Mont-d'Or",
  latitude: "45.8416216",
  longitude: "4.7972667",
  description: "Depuis Poleymieux-au-Mont-d'Or, il va falloir grimper un peu pour atteindre le sommet du Mont Thou, le deuxième plus haut des Monts d'Or avec ses 625 mètres d’altitude. Récompense assurée une fois là-haut, face au sublime panorama qui s’offre à toi : une vue incroyable sur Lyon avec les Alpes en arrière plan !",
  user: user
)
pictures20 = ['https://images.unsplash.com/photo-1466722821433-65ceafd7c373?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bW9udCUyMHRob3V8ZW58MHx8MHx8fDA%3D', 'https://images.unsplash.com/photo-1516127716475-41e1f1e182d5?q=80&w=2529&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D']
pictures20.each do |picture|
  file = URI.open(picture)
  activity_20.pictures.attach(io: file, filename: 'activity', content_type: 'image/png')
  activity_20.save
end

activity_21 = Activity.new(
  category: "Activites",
  name: "Quiz Room Lyon",
  address: "51 Rue Denuzière, 69002 Lyon France",
  city: "Lyon",
  latitude: "45.7432328",
  longitude: "4.8184925",
  description: "Il faut de tout pour faire un quiz ! Découvre un jeu de questions-réponses où on s’éclate à buzzer comme sur un plateau TV.
Pas besoin d’être un as de la culture gé : nos questions sont adaptées à ton groupe et les thèmes, personnalisés : si tu sais tendre un piège et faire preuve de rapidité, tu as tout pour te marrer !",
  user: user
)
pictures21 = ['https://images.unsplash.com/photo-1611996575749-79a3a250f948?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHF1aXolMjBnYW1lfGVufDB8fDB8fHww', 'https://images.unsplash.com/photo-1584697964190-7383cbee8277?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjl8fHF1aXolMjBnYW1lfGVufDB8fDB8fHww']
pictures21.each do |picture|
  file = URI.open(picture)
  activity_21.pictures.attach(io: file, filename: 'activity', content_type: 'image/png')
  activity_21.save
end

activity_22 = Activity.new(
  category: "Activites",
  name: " L'hachez-vous",
  address: "4 Rue de l'Épée, 69003 Lyon France",
  city: "Lyon",
  latitude: "45.7568283",
  longitude: "4.8431428",
  description: "Lancer de hache pour Lyon est le premier centre à Lyon, où vous avez le droit de lancer des haches ! Grâce à nos conseils, étonnez vos amis et soyez le plus fort ! Nous disposons de 6 cibles, permettant d'accueillir jusqu’à 18 personnes par session d'une heure. Le lancer de haches est idéal pour une sortie entre amis, un anniversaire, un EVJF / EVJG, un team building, où même un rendez-vous galant !",
  user: user
)
pictures22 = ['https://images.unsplash.com/photo-1620303008348-afff3cc06891?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8aGFjaGV8ZW58MHx8MHx8fDA%3D', 'https://images.unsplash.com/photo-1444228250525-3d441b642d12?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YXhlJTIwdGFyZ2V0fGVufDB8fDB8fHww']
pictures22.each do |picture|
  file = URI.open(picture)
  activity_22.pictures.attach(io: file, filename: 'activity', content_type: 'image/png')
  activity_22.save
end

activity_23 = Activity.new(
  category: "Communaute",
  name: "Le Complexe Café-Théâtre",
  address: "7 Rue des Capucins, 69001 Lyon France",
  city: "Lyon",
  latitude: "45.769139",
  longitude: "4.832865",
  description: "Le Complexe , c'est l'endroit convivial où se retrouver en famille ou entre amis. Échappez vous de la vie quotidienne dans l'une des deux salles du café-théâtre des pentes de la Croix-Rousse ! Le Complexe , c'est aussi de délicieuses tapas à déguster une heure avant chaque représentation. Une programmation de qualité et pour tous les âges, une ambiance décontractée, voici la recette sans faille du Complexe !",
  user: user
)
pictures23 = ['https://images.unsplash.com/photo-1665069725197-40bc1b9a34fb?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29mZmVlJTIwdGhlYXRyZXxlbnwwfHwwfHx8MA%3D%3D', 'https://images.unsplash.com/photo-1648808678096-18f488fd6858?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y29mZmVlJTIwdGhlYXRlcnxlbnwwfHwwfHx8MA%3D%3D']
pictures23.each do |picture|
  file = URI.open(picture)
  activity_23.pictures.attach(io: file, filename: 'activity', content_type: 'image/png')
  activity_23.save
end

activity_24 = Activity.new(
  category: "Activites",
  name: "Musée de l'illusion",
  address: "1 Rue Bellecordière, 69002 Lyon, France",
  city: "Lyon",
  latitude: "45.7590094",
  longitude: "4.8360965",
  description: "A la recherche d'une activité amusante qui plaira aux petits et aux grands ? Le musée de l'illusion est l'endroit idéal pour une sortie en famille ou entre amis. Vous aurez l'occasion de vous amuser et de mettre votre perception à l’épreuve avec des oeuvres plus étonnantes les unes que les autres !

Les + de la visite :

Apprenez-en plus sur la vue et le fonctionnement de l'intellect humain grâce à des explications scientifiques et rationnelles
Le musée propose de nombreux espaces interactifs tels que des hologrammes, des jeux d'illusion, des énigmes..",
  user: user
)
pictures24 = ['https://images.unsplash.com/photo-1565485979550-7acb75dc3cb7?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aWxsdXNpb258ZW58MHx8MHx8fDA%3D', 'https://images.unsplash.com/photo-1534235826754-0a3572d1d6d5?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG11c2V1bXxlbnwwfHwwfHx8MA%3D%3D']
pictures24.each do |picture|
  file = URI.open(picture)
  activity_24.pictures.attach(io: file, filename: 'activity', content_type: 'image/png')
  activity_24.save
end

activity_25 = Activity.new(
  category: "Activites",
  name: "Opéra de Nice",
  address: "4-6 rue Saint François de Paule, 06300  Nice",
  city: "Nice",
  latitude: "43.6957087",
  longitude: "7.273465",
  description: "L’Opéra de Nice est une salle de spectacles de la ville de Nice dotée d’une capacité d’accueil de plus de 1 000 places. Classé monument historique, la structure se veut l’hôte de l’excellence lyrique niçoise, notamment grâce aux productions de son orchestre philarmonique. L’Opéra de Nice propose également de nombreux autres genres artistiques et événements, dont vous pouvez découvrir la teneur ici.",
  user: user
)
pictures25 = ['https://images.unsplash.com/photo-1719606187917-55d51f2c5cc3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8b3AlQzMlQTlyYXxlbnwwfHwwfHx8MA%3D%3D', 'https://images.unsplash.com/photo-1606405783825-5df8f72489c3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG9wJUMzJUE5cmF8ZW58MHx8MHx8fDA%3D']
pictures25.each do |picture|
  file = URI.open(picture)
  activity_25.pictures.attach(io: file, filename: 'activity', content_type: 'image/png')
  activity_25.save
end

activity_26 = Activity.new(
  category: "Activites",
  name: "Tour Ferrari Cannes",
  address: "73 avenue de la Croisette, 06400 Cannes",
  city: "Cannes",
  latitude: "43.54874801635742",
  longitude: "7.029068470001221",
  description: "Ouvert toute l'année du lundi au dimanche
Baladez vous sur la Croisette à bord d'une Ferrari California V8 de 460ch, décapotable ! Vivez le Rêve...Vous aurez de nombreuses occasions de prendre des photos à l'intérieur de la Ferrari et durant le parcours. Accessible à tous. Sur réservation.",
  user: user
)
pictures26 = ['https://images.unsplash.com/photo-1517703806608-15ec22b3e83b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZmVycmFyaXxlbnwwfHwwfHx8MA%3D%3D', 'https://images.unsplash.com/photo-1689255680603-cccb6ab43e1b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8ZmVycmFyaXxlbnwwfHwwfHx8MA%3D%3D']
pictures26.each do |picture|
  file = URI.open(picture)
  activity_26.pictures.attach(io: file, filename: 'activity', content_type: 'image/png')
  activity_26.save
end

activity_27 = Activity.new(
  category: "Artisans",
  name: "Coutellerie Brossard",
  address: "65-67 passage de l'Argue - 69002 Lyon 2ème",
  city: "Lyon",
  latitude: "45.7542",
  longitude: "4.8309",
  description: "Fondée en 1830, dès l'origine du Passage de l'Argue, cette Maison lyonnaise est une enseigne incontournable.
  Sa gamme de brosses en montage main (Isinis – Mason Pearson) pour les cheveux, le bain, les ongles, les habits représente un choix unique en France.

Les miroirs grossissants Simple Human les clients les plus exigeants pour leur rendu d'image et leur esthétique.

La cisellerie manucure, couture, coiffure, Nogent ou Solingen, en trousse ou au détail est sélectionnée sur la perfection de son tranchant et la possibilité de réaffutage, service proposé par la maison.

La coutellerie développée depuis trois générations offre un éventail choisi avec soin et connaissance du travail artisanal français pour les couteaux de poche",
  user: user
)
pictures27 = ['https://images.unsplash.com/photo-1608121653121-24141af988ee?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTUxfHxoYWlyZHJlc3NlcnxlbnwwfHwwfHx8MA%3D%3D', 'https://images.unsplash.com/photo-1610548493594-6128d5ee7cfe?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODJ8fGhhaXJkcmVzc2VyJTIwa25pZmV8ZW58MHx8MHx8fDA%3D']
pictures27.each do |picture|
  file = URI.open(picture)
  activity_27.pictures.attach(io: file, filename: 'activity', content_type: 'image/png')
  activity_27.save
end

activity_28 = Activity.new(
  category: "Artisans",
  name: "Ici Atelier-Boutique",
  address: "1 rue des Capucins - 69001 Lyon 1er",
  city: "Lyon",
  latitude: "45.7693565",
  longitude: "4.8341053",
  description: "Les créatrices permanentes ainsi que les pépites invitées vous proposent des illustrations étonnantes, des objets du quotidien revisités, des céramiques singulières, des vêtements stylés et des parures irrésistibles dans l’écrin de l’enseigne de la Rue des Capucins.

Modélistes, chapelière, crocheteuse, tisserande, ébéniste, céramistes, bijoutières, illustratrices vous attendent pour des créations éthiques 100% artisanales, fabriquées exclusivement en local !
",
  user: user
)
pictures28 = ['https://images.unsplash.com/photo-1555885424-fcb5134e4bee?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZHJlc3MlMjBhcnRpc2FufGVufDB8fDB8fHww', 'https://images.unsplash.com/photo-1574120153654-453fb26e6bd4?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGRyZXNzJTIwYXJ0aXNhbnxlbnwwfHwwfHx8MA%3D%3D']
pictures28.each do |picture|
  file = URI.open(picture)
  activity_28.pictures.attach(io: file, filename: 'activity', content_type: 'image/png')
  activity_28.save
end

activity_29 = Activity.new(
  category: "Artisans",
  name: "Upper Shoes Pêcherie",
  address: "4 quai de la Pêcherie - 69001 Lyon 1er",
  city: "Lyon",
  latitude: "45.7666847",
  longitude: "4.8302227",
  description: "Un peu à l’écart du cœur du centre ville, la boutique Upper Shoes quai de la Pêcherie n’en reste pas moins une adresse désormais incontournable pour les aficionados des souliers.

Ses 90 m² sont consacrés à des collections chaussures, un rayon outlet pour homme et femme toute l’année avec de grandes marques : Church’s, Crockett & Jones, Santoni… et un rayon 2nd Life où l’on peut retrouver des souliers de seconde main remis dans le circuit après avoir été expertisés, entretenus et parfois réparés pour vivre une seconde vie. Une nouvelle façon de consommer intelligemment de façon responsable.",
  user: user
)
pictures29 = ['https://images.unsplash.com/photo-1632661010878-26304779f821?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXMlMjBhcnRpc2FufGVufDB8fDB8fHww', 'https://images.unsplash.com/photo-1477517787936-70ba786643fd?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c2hvZXMlMjBhcnRpc2FufGVufDB8fDB8fHww']
pictures29.each do |picture|
  file = URI.open(picture)
  activity_29.pictures.attach(io: file, filename: 'activity', content_type: 'image/png')
  activity_29.save
end


  puts "Creating chatrooms..."

  chatroom_1 = Chatroom.create!(name: "général")

  chatroom_1.save

  puts "All done! 🎉"
