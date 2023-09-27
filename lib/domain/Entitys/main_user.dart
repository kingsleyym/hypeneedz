class MainUser {
  final String id;
  final String username;
  final String number;
  final String image;
  final String bio;
  final bool private;
  final bool admin;
//  final Subscription subscription;

  MainUser({
    required this.id,
    required this.username,
    required this.number,
    required this.image,
    required this.bio,
    required this.private,
    required this.admin,
    //  required this.subscription,
  });

  static MainUser empty = MainUser(
    id: '',
    username: "Luca Kingsleys",
    bio: '',
    admin: false,
    image:
        'https://cdnb.artstation.com/p/assets/images/images/053/254/977/medium/jack-wang-baibin.jpg?1661794550',
    number: '',
    private: false,
    //  subscription: Subscription.empty(),
  );

  MainUser copyWith({
    String? id,
    String? username,
    String? number,
    String? image,
    String? bio,
    bool? private,
    bool? admin,
    // Subscription? subscription,
  }) {
    return MainUser(
      id: id ?? this.id,
      username: username ?? this.username,
      number: number ?? this.number,
      image: image ?? this.image,
      bio: bio ?? this.bio,
      private: private ?? this.private,
      admin: admin ?? this.admin,
      //  subscription: subscription ?? this.subscription,
    );
  }
}
