<!-- docs\database\relationships.md -->

Voici les relations impliquées par les contraintes de clé étrangère (et les associations prévues) dans le schéma :

1. **User ⇄ Address**

   - **Un utilisateur peut avoir plusieurs adresses.**

     - Chaque enregistrement dans la table _Address_ a une clé étrangère `user_id` pointant vers la table _User_. Un seul utilisateur peut donc apparaître dans plusieurs enregistrements d'adresse.

   - **Une adresse appartient à un seul utilisateur.**

     - Le champ `user_id` dans la table _Address_ fait référence à un seul utilisateur.

2. **Seller → User**

   - **Le role `seller` peut être associé à plusieurs utilisateurs.**

     - L'utilisateur dispose d'une clé étrangère `seller_id` pouvant être _null_ et faisant référence au vendeur ; plusieurs utilisateurs peuvent partager le même `seller_id`.

   - **Un utilisateur peut être un vendeur. (facultatif)**

     - Si le champ `User.seller_id` n'est pas _null_, il pointe vers la table _Seller_.

3. **User → Review**

   - **Un utilisateur peut rédiger plusieurs avis.**

     - Chaque enregistrement dans la table _Review_ dispose d'une clé étrangère `user_id` pointant vers la table _User_.

   - **Un avis appartient à un seul utilisateur.**

     - Le champ `Review.user_id` identifie l'utilisateur qui l'a publié.

4. **User → Order**

   - **Un utilisateur peut passer plusieurs commandes.**

     - Chaque enregistrement dans la table _Order_ comporte une clé étrangère `user_id` pointant vers la table _User_.

   - **Une commande appartient à un seul utilisateur.**

     - Le champ `Order.user_id` indique quel utilisateur a passé cette commande.

5. **Order → OrderItem**

   - **Une commande peut contenir plusieurs articles.**

     - Chaque enregistrement dans la table _OrderItem_ comporte une clé étrangère `order_id` pointant vers la table _Order_.

   - **Un article appartient à une seule commande.**

     - Le champ `OrderItem.order_id` le relie à sa commande parent.

6. **Product → OrderItem**

   - **Un produit peut apparaître dans plusieurs articles.**

     - Chaque enregistrement dans la table _OrderItem_ comporte une clé étrangère `product_id` pointant vers la table _Product_.

   - **Un article fait référence à un seul produit.**

     - Le champ `OrderItem.product_id` indique quel produit a été commandé.

7. **Order → Shipment**

   - **Une commande peut avoir plusieurs expéditions.**

     - Chaque enregistrement dans la table _Shipment_ comporte une clé étrangère `order_id` pointant vers la table _Order_.

   - **Une expédition appartient à une seule commande.**

     - Le champ `Shipment.order_id` indique quelle commande est expédiée.

8. **Order → Payment**

   - **Une commande peut avoir plusieurs paiements.**

     - Chaque enregistrement dans la table _Payment_ comporte une clé étrangère `order_id` pointant vers la table _Order_.

   - **Un paiement appartient à une seule commande.**

     - Le champ `Payment.order_id` relie ce paiement à sa commande.

9. **User → ShoppingCart**

   - **Un utilisateur peut avoir plusieurs paniers.**

     - Chaque enregistrement dans la table _ShoppingCart_ a une clé étrangère `user_id` pointant vers la table _User_.

   - **Un panier appartient à un seul utilisateur.**

     - Le champ `ShoppingCart.user_id` indique à qui appartient le panier.

10. **ShoppingCart → CartItem**

    - **Un panier peut contenir plusieurs items.**

      - Chaque enregistrement dans la table _CartItem_ possède une clé étrangère `shopping_cart_id` pointant vers la table _ShoppingCart_.

    - **Un item appartient à un seul panier.**

      - Le champ `CartItem.shopping_cart_id` le relie à ce panier.

11. **Product → CartItem**

    - **Un produit peut apparaître dans plusieurs items.**

      - Chaque enregistrement dans la table _CartItem_ possède une clé étrangère `product_id` pointant vers la table _Product_.

    - **Un item fait référence à un seul produit.**

      - Le champ `CartItem.product_id` spécifie quel produit se trouve dans le panier.

12. **Product ↔ Category (via `Product_Category`)**

    - **Many‐to‐Many:**

      - **Un produit peut appartenir à plusieurs catégories.**

        - La table `Product_Category` a un clé étrangère `product_id` pointant vers la table _Product_.

      - **Une catégorie peut inclure plusieurs produits.**

        - La table `Product_Category` a un clé étrangère `category_id` pointant vers _Category_.

    - **Une enregistrement dans la table `Product_Category` relie exactement un produit à exactement une catégorie.**

13. **User → UserSession**

    - **Un utilisateur peut avoir plusieurs sessions utilisateur.**

      - Chaque enregistrement dans la table _UserSession_ comporte une clé étrangère `user_id` pointant vers la table _User_.

    - **Une session utilisateur appartient à exactement un utilisateur.**

      - Le champ `UserSession.user_id` indique quel utilisateur est propriétaire de cette session.

14. **User → Like**

    - **Un utilisateur peut aimer plusieurs produits.**

      - Chaque enregistrement dans la table _Like_ a une clé étrangère `user_id` pointant vers la table _User_.

    - **Un Like appartient à exactement un utilisateur.**

      - Le champ `Like.user_id` identifie qui a aimé quelque chose.

15. **Product → Like**

    - **Un produit peut être aimé par plusieurs utilisateurs.**

      - Chaque enregistrement dans la table _Like_ a une clé étrangère `product_id` pointant vers la table _Product_.

    - **Un Like fait référence à exactement un produit.**

      - Le champ `Like.product_id` indique quel produit a été aimé.

16. **Product → Seller**

    - **Un vendeur peut proposer plusieurs produits.**

      - Conceptuellement, chaque produit est mis en vente par un ou plusieurs vendeurs (typiquement, un seul vendeur).

    - **Un produit appartient à un seul vendeur.**

      - Dans la table _Product_, le champ `seller_id` (clé étrangère qui pointe vers _Seller_), permet de savoir qui commercialise ce produit.

17. **Review → Product**

    - **Un produit peut recevoir plusieurs avis.**

      - Les utilisateurs rédigent généralement des avis sur des produits précis.

    - **Un avis porte sur un seul produit.**

      - Dans la table _Review_, le champ `product_id` (clé étrangère qui pointe vers _Product_) permet de lier chaque avis au produit concerné.

18. **Order → Address (adresse de livraison)**

    - **Une commande est livrée à une seule adresse.**

      - Dans la table _Order_, le champ `address_id` (clé étrangère qui pointe vers _Address_), permet de lier la commande à l’adresse enregistrée chez l’utilisateur.

    - **Une adresse (de l’utilisateur) peut servir à plusieurs commandes.**

      - Une même adresse (résidentielle) peut être utilisée pour plusieurs livraisons.

19. **Payment → User (en tant que payeur)**

    - **Un utilisateur peut effectuer plusieurs paiements.**

      - Bien que la table _Order_ référence déjà l’utilisateur, on peut souhaiter savoir directement qui a procédé à chaque paiement (par exemple si un administrateur enregistre un paiement manuel).

    - **Un paiement appartient à un seul utilisateur.**

      - Le champ `user_id` (clé étrangère qui pointe vers la table _User_) dans la table _Payment_, permet de tracer qui a initié ou autorisé le règlement.

20. **OrderItem → Seller**

    - **Un vendeur peut apparaître dans plusieurs lignes de commande (OrderItem).**

      - Comme chaque ligne de commande correspond à un produit, et qu’on a lié chaque produit à un vendeur (voir point 16), on peut en déduire qu’une même commande peut contenir des articles provenant de vendeurs différents.

    - **Chaque ligne de commande (OrderItem) est associée, via le produit, à un unique vendeur.**

21. **ShoppingCart → UserSession (contexte de navigation)**

    - **Une session utilisateur peut être liée à un panier spécifique.**

      - Pour savoir à quelle session correspond le panier courant (pratique si l’on veut restaurer un panier abandonné).

    - **Un panier appartient à une seule session.**

      - Dans la table _ShoppingCart_, le champ `user_session_id` (clé étrangère qui pointe vers _UserSession_) permet de lier le panier à la session utilisateur courante.

22. **Seller → Address (adresse du magasin)**

    - **Un vendeur a une adresse physique (magasin ou entrepôt).**

      - Dans la table _Seller_, le champ `address_id` qui pointe vers la table _Address_ permet de lier le vendeur à l’adresse postale.

    - **Une adresse (de type magasin/entrepôt) appartient à un seul vendeur.**

      - Dans la table _Seller_, le champ `address_id` (clé étrangère qui pointe vers _Address_) permet de gérer proprement l’adresse postale du vendeur.
