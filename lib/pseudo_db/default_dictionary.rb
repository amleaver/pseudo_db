{
    city: {
        aliases: [:town, :town_city, :towncity],
        values: %w(
                Aberdeen Armagh Bangor Bath Belfast Birmingham Bradford Bristol Cambridge
                Canterbury Cardiff Carlisle Chester Chichester London Coventry Derby Dundee
                Durham Edinburgh Ely Exeter Glasgow Gloucester Hereford Inverness Lancaster
                Leeds Leicester Lichfield Lincoln Lisburn Liverpool London Londonderry
                Manchester Newport Newry Norwich Nottingham Oxford Peterborough Plymouth Portsmouth
                Preston Ripon Salford Salisbury Sheffield Southampton Stirling Stoke-on-Trent
                Sunderland Swansea Truro Wakefield Wells Westminster Winchester Wolverhampton Worcester York
          ),
    },
    country: {
        values: ['United Kingom', 'Great Britain', 'Northern Ireland', 'England', 'Scotland']
    },
    postcode:{
        aliases: [:post_code],
          values: proc{ DataGenerator.postcode }
    },
    first_name: {
        aliases: [:fname, :first_name, :firstname],
        values: %w(Theo Alex Pat Sam Mel Lou Jamie Taylor Tracy Ash Kim Reese Robin Murphy Dylan Ryan),
    },
    last_name: {
        aliases: [:surname, :lastname, :second_name, :sname],
        values: proc { Faker::Name.last_name }
    },
    phone_number: {
        aliases: [:phonenumber, :phone_num, :telephone_num, :telephonenum, :phone],
        values: proc { "0#{rand(1) + 1}#{DataGenerator::random_number_string(9)}" }
    },
    email: {
        aliases: [:email_address, :email],
        values: proc { |arg| DataGenerator.username(arg) + '@example.com' }
    },
    username: {
        aliases: [:user_name, :display_name, :displayname],
        values: proc { |arg| DataGenerator.username(arg) }
    },
    vat_number: {
        aliases: [:vatnumber],
        values: proc{ "GB#{DataGenerator::random_number_string(9)}" }
    },
    passport_number: {
        aliases: [:passport_num, :passportnumber],
        values: proc{ DataGenerator.uk_passport }
    }
}