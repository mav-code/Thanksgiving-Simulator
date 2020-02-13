thanksgiving_locations_master = []

people_at_tg = []
def generate_random_number
    (4..10).to_a.sample
end

def populate_data
    i = 0
    people_at_tg = []
    until i == generate_random_number
    people_at_tg << Faker::Name.name
    i += 1
    participants = people_at_tg
    end

    partipants.each do |plate|
    Plate.create(person_id: $user.id, thanksgiving_id: tg.id)
    end
end

def boot
    Plate.destroy_all
    $user = Person.create(name: "user", hunger: "100", tryptophan: "0", politics: nil)
end

def intro
    prompt = TTY::Prompt.new
        puts "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
    sleep(1)
    puts "\n"
    puts "
████████╗  ██╗  ██╗   █████╗   ███╗   ██╗  ██╗  ██╗  ███████╗   ██████╗   ██╗  ██╗   ██╗  ██╗  ███╗   ██╗   ██████╗
╚══██╔══╝  ██║  ██║  ██╔══██╗  ████╗  ██║  ██║ ██╔╝  ██╔════╝  ██╔════╝   ██║  ██║   ██║  ██║  ████╗  ██║  ██╔════╝
   ██║     ███████║  ███████║  ██╔██╗ ██║  █████╔╝   ███████╗  ██║  ███╗  ██║  ██║   ██║  ██║  ██╔██╗ ██║  ██║  ███╗
   ██║     ██╔══██║  ██╔══██║  ██║╚██╗██║  ██╔═██╗   ╚════██║  ██║   ██║  ██║  ╚██╗ ██╔╝  ██║  ██║╚██╗██║  ██║   ██║
   ██║     ██║  ██║  ██║  ██║  ██║ ╚████║  ██║  ██╗  ███████║  ╚██████╔╝  ██║   ╚████╔╝   ██║  ██║ ╚████║  ╚██████╔╝
   ╚═╝     ╚═╝  ╚═╝  ╚═╝  ╚═╝  ╚═╝  ╚═══╝  ╚═╝  ╚═╝  ╚══════╝   ╚═════╝   ╚═╝    ╚═══╝    ╚═╝  ╚═╝  ╚═══╝   ╚═════╝"
    puts "\n"
    sleep(0.5)
    puts "
                                            ┌─┐┬┌┬┐┬ ┬┬  ┌─┐┌┬┐┌─┐┬─┐
                                            └─┐│││││ ││  ├─┤ │ │ │├┬┘
                                            └─┘┴┴ ┴└─┘┴─┘┴ ┴ ┴ └─┘┴└─"
    sleep(0.5)
    puts "\n"
    puts "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
    sleep(4)
    puts "\n"
    puts "The year is 2020, the month November. Halloween is over. You promise yourself your costume will be better next year."
    puts "\n"
    sleep(3)
    puts "The election was three weeks ago. It was devastating."
    puts "\n"
    sleep(3)
    puts "It is time once again for the American harvest/genocide festival."
    puts "\n"
    sleep(3)
    dish = prompt.ask('What did you make to bring to Thanksgiving this year?')
    sleep(1)
    puts "\n"
    if dish 
    puts "Sounds good. Hope it came out okay."
    else 
    puts "Nothing, huh? Typical."
    end
    sleep(2)
    puts "\n"
    puts "This year's a big one; you're expected at five seperate Thanksgivings. It's a real ordeal, but you suppose you should be thankful."
    sleep (0.5)
end

def thanksgiving_menu
    prompt = TTY::Prompt.new
    sleep(0.5)
    display_current_plates
    sleep(0.5)
    puts "\n"
    tg_choice = prompt.select("Which feast are you thinking of hitting?", Thanksgiving.all.map{|tg| tg.location})
    current_tg = Thanksgiving.find_by location: tg_choice.to_s
    sleep(0.5)
    puts "\n"
    call_menu_choice = prompt.select("#{tg_choice}. You start gathering your things.", ["Go to #{tg_choice}", "Call ahead", "Back"])
    if call_menu_choice == "Back"
        thanksgiving_menu
    elsif call_menu_choice == "Call ahead"
        call(current_tg)
    else
        attend(current_tg)
    end
end

def call(tg)
    prompt = TTY::Prompt.new
    sleep(0.5)
    puts "\n"
    call_choice = prompt.select("You decide to call ahead. >> Call text will go here once we've populated the thanksgiving. <<",["Go to #{tg.location}.", "Back"])
    if call_choice == "Back"
        thanksgiving_menu
    else
        attend(tg)
    end
        
end

def attend(tg)
    prompt = TTY::Prompt.new
    "You arrive at #{tg.location}. >> Will develop more trinket text to go here. <<"

    if tg.course == "Tofurkey"
        sleep(0.5)
        puts "\n"
        puts "It's vegetarian this year."
    end
    sleep(0.5)
    puts "\n"
    if $user.thanksgivings.all.any?{|thanksgiving| thanksgiving == tg}
        puts "You find your plate. Someone has put out a cigarette on it."
    else
        puts "You fix yourself a plate and commence small talk. You have fulfilled your harvest pact with these people."
        newplate = Plate.create(person_id: $user.id, thanksgiving_id: tg.id)
        newplate.save
    end
    sleep(0.5)
    puts "\n"
    plate_choice = prompt.select("What's next?", ["Get into a political argument", "Try and attend another Thanksgiving"])
        if plate_choice == "Get into a political argument"
            political_argument(tg)
        else
            thanksgiving_menu
        end

end

def political_argument(tg)
    prompt = TTY::Prompt.new
    sleep(1)
    puts "\n"
    argue_choice = prompt.select("You start hollering about electoralism, the Second Internationale, and podcasts.", ["Calm down!", "Smash your plate and get the heck out of here!"])
    if argue_choice == "Calm down!"
        attend(tg)
    else
        sleep(0.5)
        puts "\n"
        puts "With one finger shaking in the air, as if to accuse God herself, you pound your other meaty fist into your mashed potatoes. The dish shatters."
        sleep(3)
        puts "\n"
        puts "No one responds or looks you in the eye."
        sleep(3)
        puts "\n"
        puts "Let's get out of here."
        sleep(3)
        puts "\n"
        Plate.where(person_id: $user.id, thanksgiving_id: tg.id)[0].destroy
        thanksgiving_menu
    end
end

def display_current_plates
    sleep(0.5)
    puts "\n"
    if Plate.all.any?{|plate| plate.person_id == $user.id}
        locations = $user.plates.all.map{|plate| plate.thanksgiving.location}
        if locations.length == 1
            puts "You have a plate at : #{locations.join(", ")}."
        else puts "You have plates at : #{locations.join(", ")}."
        end
    end
end