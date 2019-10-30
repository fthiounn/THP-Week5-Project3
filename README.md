# README
# THP - Week 5 - Project 1 - The Gossip Project, les premières views
# François THIOUNN



# Notes & Use :
 -run in commandline from folder : 
 	- bundle install
	- rails db:create |rails db:migrate | rails db:seed
	- rails s
- go to http://localhost:3000 and enjoy ;)
- type in http://localhost:3000/home/:id to go to the hidder url (question 2.4)
	where the id is an existing user id in the database
- team and contact page are bootstrat templates

 


#Projet : The Gossip Project : Full CRUD
  
1. Introduction
Dans ce projet, tu vas faire ton premier CRUD entier en Rails. Je sais pas si tu te rends compte de ce que ça représente : le CRUD sur une ressource, c'est la base de tout site web ! Et d'ici ce soir, t'en auras fait un : Pwaaaa ! C'est ouf !

Pour avoir une vision complète, nous allons travailler sur les potins en acceptant toutes les actions du CRUD : on va les créer, les afficher, les modifier et les supprimer. Et puisqu'à THP on aime bien te pousser à fond, on va même te demander d'implémenter une partie de CRUD sur les commentaires de potins. De la bombe 💣.

⚠️Bonnes pratiques ⚠️ : nous te conseillons de faire des commits à chaque sous-chapitre de cet exercice. Ainsi, si jamais tu veux tester quelque chose, tu peux écrire ton code et l'exécuter quitte à faire un git reset --hard pour revenir au commit précédent. Très pratique pour repartir de la dernière étape fonctionnelle quand tu as un truc qui merde 💩

2. Le projet
Voici ce qui t'attend dans le projet du jour :

On va repartir du projet d'hier ✌
On va utiliser Bootstrap pour lui donner un peu de pep's
Nous allons faire la page potin (affichage d'un potin), la page utilisateur et la page ville
Nous allons faire l'édition des potins
Nous allons faire en sorte qu'il soit possible de supprimer un potin à partir de la page potin
Nous allons intégrer et afficher les commentaires de potins
Inutile de te rappeler que toutes tes routes doivent être en mode REST : l'usage de resources est ici obligatoire.

Allez, c'est parti ! Commence par reprendre ton projet d'hier.

2.1. Un joli front ?
Maintenant que tu as fait tes premières pages, et que tu sais qu'on peut faire du Bootstrap avec un simple CDN, nous allons faire en sorte que notre site ressemble à quelque chose de potable. Assure-toi que ton projet d'hier soit bien connecté au CDN de Bootstrap. 
Maintenant, balade-toi sur les pages d'exemples Bootstrap et quand tu vois un élément que tu veux utiliser pour ton Gossip Project, regarde le code source de la page et récupère le nom des classes utilisées pour le construire. Quelques suggestions du chef :

Jumbotron est une bonne base pour le haut de ta page d'accueil
Tu peux afficher l'index des gossip sous forme d'une liste Bootstrap
Un autre exemple est celui Social Media de W3Schools.
Pour le front, fais comme tu le sens avec le double objectif est que 1) le rendu soit présentable, et 2) tu n'y passes pas trop de temps. Le front, si on se laisse prendre au jeu, on peut y passer un temps infini et la leçon du jour, c'est de faire un back-end CRUD !

2.2. C'est bon ? T'es chaud ?
Allez on se lance. On va te donner les directives pour chaque morceau du CRUD, mais on te laisse tout coder. Il faudra ne pas hésiter à te rapporter aux cours des 2 journées précédentes pour 1) faire des routes propres, 2) faire des controllers avec les bonnes méthodes CRUD et 3) afficher les informations dans les views.

Let's GO !

2.2.1. Hot Gossip
L'objectif de cette partie est que tu crées la page potin (la page show qui affiche un potin spécifique). C’est-à-dire que quand tu tapes l'URL /gossips/3, tu arrives sur la page affichant le contenu du potin portant l'ID 3. La page potin doit afficher :

Son titre
Son contenu
Son auteur
La ville de l'auteur
À partir de la page d'accueil, qui contient l'index des potins, chaque potin doit être accompagné d'un lien pointant vers sa propre page.

2.2.2. Hot user
L'objectif de cette partie est de faire de même pour la page utilisateur. Cette page doit afficher :

Son prénom
Son nom
Sa description
Son e-mail
Son age
Le nom de sa ville
Sur la page show d'un potin, l'utilisateur doit pouvoir en savoir plus sur l'auteur du potin en question. Il doit y avoir un lien vers la page show de l'auteur.

2.2.3. Hot city
Allez, dernière page show : la page pour afficher le détail d'une ville. Cette page devra afficher :

Le nom de la ville
Les potins écrits par les utilisateurs associés à la ville en question (faire une liste comme celle de la page d'accueil)
La page ville doit être accessible depuis la page utilisateur (lien vers la ville de l'utilisateur) et depuis la page potin (lien vers la ville de l'auteur).

2.3. Edit / Update
Maintenant nous allons faire en sorte de pouvoir éditer les potins 🙌

Pour ceci, nous allons faire une page /gossips/:id/edit qui affichera un formulaire pour éditer le potin. Ce formulaire devra pointer vers la méthode #update qui aura pour rôle d'actualiser le potin en BDD. Comme pour la méthode #create, cette méthode a des conventions bien précises qui ressemblent à ceci :

def update
  @model = Model.find(params[:id])
  if @model.update(tes_params)
    redirect_to @model
  else
    render :edit
  end
end
Si tu sors de ces clous, tu as presque 100 % de chances de te gourer (la seule exception étant la possibilité d'afficher une alerte du genre "Potin bien mis à jour !").

Astuce : essaye de pré-remplir les champs du formulaire d'édition avec les informations du potin. Ainsi, l'utilisateur n'a qu'à changer les quelques infos qu'il souhaite : pas besoin de tout retaper.

2.4. Détruire
À partir de la page potin, il est possible de détruire le potin avec un lien pour le faire. Implémente cette fonctionnalité. Après avoir détruit le potin, l'utilisateur doit être redirigé vers l'index des potins.

2.5. Les commentaires de potins
Ce site de gossips ne serait pas complet sans une section de commentaires où les gens pourraient commenter les ragots des moussaillons. Nous allons donc ajouter une fonctionnalité de commentaires à nos chers gossips.

Ci-dessous on te détaille ce qu'on attend de toi.

2.5.1. Création
Un commentaire peut être ajouté à un potin uniquement depuis la page show de ce dernier. La page contiendra donc un formulaire pour renseigner le texte du commentaire. Tout comme pour les potins, si un nouveau commentaire est rajouté via ce formulaire il sera assigné à notre utilisateur anonyme (pour le moment).

La page show du gossip affichera tous les commentaires liés à ce gossip, dans l'ordre que tu veux. Pour chaque commentaire, on pourra lire son auteur (ça ne sera pas forcément ton utilisateur anonyme, tu peux aussi faire un seed avec des utilisateurs créés en base), son texte, et on disposera d'un lien pour le modifier.

2.5.2. Modification et destroy
Créé le page edit du commentaire (page pour le modifier). 
Cette page permettra également de détruire le commentaire via un bouton.

2.5.3. Compter les commentaires
Dans la page d'index, chaque potin affiche le nombre de commentaires qui lui sont liés.

2.6. Les tags - BONUS
Allez, dernier exercice de la journée. Nous allons coder le fait de pouvoir ajouter un tag à la création du potin. Pour ceci, voici comment tu vas faire :

Dans ton seed, tu vas créer une dizaine de tags sympathiques.
Dans ton formulaire de création de potin, tu vas ajouter un select form où tu pourras sélectionner un tag parmi tous les tags que tu as en base. Deux options pour ça : soit tu le construis toi-même en HTML, soit tu utilises le helper select_tag (lié à un form_tag).
C'est le controller qui devra mettre à disposition de la view un array contenant tous les tags existant(n'hésite pas à aller voir des exemples sur Stack Overflow).
GOD MODE : si tu veux pouvoir ajouter plusieurs tags à un potin, n'hésite pas à regarder le concept des nested forms
Une fois que tu as rajouté cette fonctionnalité à la création d'un potin, ajoute-la aussi lors de l'édition du potin .

3. Rendu attendu
Un Gossip Project qui commence à avoir de la gueule !
