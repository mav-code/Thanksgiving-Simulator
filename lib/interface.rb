def create_tg()
    array_tg = []
    array_tg << 5.times {Thanksgiving.all.sample}
    array_tg.each {|tg| populate_data(tg)}
end

def boot
    Plate.destroy_all
    Person.destroy_all
    $todays_tgs = Thanksgiving.all.sample(5)
    50.times do Person.create(name: Faker::Name.unique.name, hunger: "100", tryptophan: "0", politics: nil) 
    end
    $todays_tgs.each{|tg| 
        rand(4..15).times do 
            Plate.create(person_id: Person.all.sample.id, thanksgiving_id: tg.id) 
        end
    }
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
    sleep(1)
    puts "
                                            ┌─┐┬┌┬┐┬ ┬┬  ┌─┐┌┬┐┌─┐┬─┐
                                            └─┐│││││ ││  ├─┤ │ │ │├┬┘
                                            └─┘┴┴ ┴└─┘┴─┘┴ ┴ ┴ └─┘┴└─"
    sleep(1)
    puts "\n"
    puts "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
    sleep(1)
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
    system "clear"
    prompt = TTY::Prompt.new
    sleep(0.5)
    puts "\n"
    tg_choice = prompt.select("Which feast are you thinking of hitting?", $todays_tgs.map{|tg| tg.location})
    current_tg = Thanksgiving.find_by location: tg_choice.to_s
    sleep(0.5)
    puts "\n"
    call_menu_choice = prompt.select("#{tg_choice}. You start gathering your things.", ["Go to #{tg_choice}", "Call ahead", "Back"])
    clear_and_display
    if call_menu_choice == "Back"
        thanksgiving_menu
    elsif call_menu_choice == "Call ahead"
        call(current_tg)
    else
        attend(current_tg)
    end
end

def call(tg)
    system "clear"
    prompt = TTY::Prompt.new
    contact = tg.people.sample.name
    sleep(0.5)
    puts "\n"
    puts "You decide to call ahead and get the lay of the land."
    sleep(3)
    puts "\n"
    puts "Your chosen point of contact is #{contact}, whom you know to be in attendance."
    puts "\n"
    rand(1..6).times do 
        sleep(3)
        p "Ring ring ring..."
        puts "\n"
    end
    sleep(3)
    puts "You get the dirt on the attendees. The following individuals are either already there or on their way:"
    puts "\n"
    sleep(3)
    pp tg.people.map{|person| person.name}.uniq
    puts "\n"
    sleep(0.5)
    call_choice = prompt.select("Thanks #{contact.split[0]}.",["Go to #{tg.location}.", "I hate those people."])
    if call_choice == "I hate those people."
        thanksgiving_menu
    else
        attend(tg)
    end
        
end

def attend(tg)
    puts "You arrive at #{tg.location}. The hosts greet you and entreat you to dine."
    if tg.course == "Tofurky"
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
    tg_choice(tg)
end

def tg_choice(tg)
    prompt = TTY::Prompt.new
    plate_choice = prompt.select("What's next?", ["Stuff your face", "Get into a political argument", "Try and attend another Thanksgiving"])
    sleep(0.5)
    puts "\n"
        if plate_choice == "Get into a political argument"
            political_argument(tg)
        elsif plate_choice == "Stuff your face"
            sleep(0.5)
            puts "You shovel matter into your body."
            sleep(0.5)
            puts "\n"
            puts "Hunger -100"
            $user.hunger -= 100
            if tg.course == "Turkey"
                puts "The turkey chemical!"
                puts "Tryptophan +1"
                $user.tryptophan += 1
            else
                puts "Tryptophan +0"
            end
            sleep(0.5)
            puts "\n"
            tg_choice(tg)
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
        Plate.where(person_id: $user.id, thanksgiving_id: tg.id)[0].destroy
        thanksgiving_menu
    end
end

def clear_and_display
    sleep(0.5)
    system "clear"
    if Plate.all.any?{|plate| plate.person_id == $user.id}
        locations = $user.plates.all.map{|plate| plate.thanksgiving.location}
        if locations.length == 1
            puts "You have a plate at: #{locations.to_s}."
        else puts "You have plates at: #{locations.join(", ")}."
        end
    end
    puts "Hunger: #{$user.hunger}"
    puts "Tryptophan: #{$user.tryptophan}"
    puts "\n"
end

