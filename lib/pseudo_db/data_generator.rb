module PseudoDb
  class DataGenerator
    def self.username
      "#{adjectives.sample}#{nouns.sample}#{rand(99)}"
    end

    def self.postcode
      "#{random_character_string(2)}#{rand(98)+1} #{random_number_string(1)}#{random_character_string(2)}"
    end

    def self.uk_passport
      "#{random_number_string(10)}GBR#{random_number_string(7)}#{random_character_string(1).upcase}" +
          "#{random_number_string(7)}#{'<' * 12}0#{random_number_string(1)}"
    end

    private

    def self.random_number_string(length)
      rand_max = ('8'.to_s.concat('9' * (length - 1))).to_i
      plus = ('1'.to_s.concat('0' * (length - 1))).to_i
      rand(rand_max)+plus
    end

    def self.random_character_string(length)
      (0...length).map { (65 + rand(26)).chr }.join
    end

    def self.nouns
      %w( bambino beaver apple arm banana bike bird book chin clam clover club corn crayon crow crown crowd
          crib desk dime dirt dress fang flag flower fog game heat hill home horn hose joke juice kite lake
          maid mask mice milk mint meal meat moon mother morning name nest nose pear pen pencil plant rain
          river road rock room rose seed shape shoe shop show sink snail snake snow soda sofa star step stew
          stove summer swing table tank team tent toes tree vest water wing winter woman alarm animal aunt bait
          balloon bath bead beam bean bedroom boot bread brick brother camp chicken children crook deer dock
          doctor downtown drum dust eye family father fight flesh food frog goose grade grandfather grandmother
          grape grass hook horse jail jam kiss kitten light loaf lock lunch lunchroom meal mother notebook
          owl pail parent park plot rabbit rake robin sack sail scale sea sister soap song spark space spoon
          spot spy summer tiger toad town trail tramp tray trick trip uncle vase winter water week wheel wish
          wool yard zebra actor airplane airport army baseball beef birthday boy brush bushes butter cast cave
          cent cherries cherry cobweb coil cracker dinner eggnog elbow face fireman flavor gate glove glue
          goldfish goose grain hair haircut hobbies holiday hot jellyfish ladybug mailbox number oatmeal pail
          pancake pear pest popcorn queen quicksand quiet quilt rainstorm scarecrow scarf street sugar throne
          toothpaste twig volleyball wood wrench advice anger answer apple arithmetic badge basket basketball
          battle beast beetle beggar brain branch bubble bucket cactus cannon cattle celery cellar cloth coach
          coast crate cream daughter donkey drug earthquake feast fifth finger flock frame furniture geese
          ghost giraffe governor honey hope hydrant icicle income island jeans judge lace lamp lettuce marble
          month north ocean patch plane playground poison riddle rifle scale seashore sheet sidewalk skate
          slave sleet smoke stage station thrill throat throne title toothbrush turkey underwear vacation
          vegetable visitor voyage year able achieve acoustics action activity aftermath afternoon afterthought
          apparel appliance beginner believe bomb border boundary breakfast cabbage cable calculator calendar
          caption carpenter cemetery channel circle creator creature education faucet feather friction fruit
          fuel galley guide guitar health heart idea kitten laborer language lawyer linen locket lumber magic
          minister mitten money mountain music partner passenger pickle picture plantation plastic pleasure
          pocket police pollution railway recess reward route scene scent squirrel stranger suit sweater temper
          territory texture thread treatment veil vein volcano wealth weather wilderness wren )
    end

    def self.adjectives
      %w( adorable beautiful clean drab elegant fancy glamorous handsome long magnificent plain quaint sparkling
          ugliest unsightly red orange yellow green blue purple gray black white alive better careful clever
          dead easy famous gifted helpful important inexpensive mushy odd powerful rich shy tender uninterested
          vast wrong angry bewildered clumsy defeated embarrassed fierce grumpy helpless itchy jealous lazy
          mysterious nervous obnoxious panicky repulsive scary thoughtless uptight worried agreeable brave
          calm delightful eager faithful gentle happy jolly kind lively nice obedient proud relieved silly
          thankful victorious witty zealous broad chubby crooked curved deep flat high hollow low narrow round
          shallow skinny square steep straight wide big colossal fat gigantic great huge immense large little
          mammoth massive miniature petite puny scrawny short small tall teeny tiny cooing deafening faint hissing
          loud melodic noisy purring quiet raspy screeching thundering voiceless whispering ancient brief early fast
          late long modern old old-fashioned quick rapid short slow swift young bitter delicious fresh greasy juicy
          hot icy loose melted nutritious prickly rainy rotten salty sticky strong sweet tart tasteless uneven weak
          wet wooden yummy boiling breeze broken bumpy chilly cold cool creepy crooked cuddly curly damaged damp dirty
          dry dusty filthy flaky fluffy freezing hot warm wet abundant empty few full heavy light many numerous
          sparse substantial )
    end
  end
end