def setclock
    $year = 2019
end

def new_world
    shiva
    brahma
    intro
end

def shiva
    system "clear"
    Plate.destroy_all
    Person.destroy_all
end

def year_flavor
    yearmod = $year % 4
    if yearmod == 0
        puts "The election was three weeks ago. It was devastating."
    elsif yearmod == 1
        puts "Last month the United States declared a war of liberation against #{Faker::Address.country}. Still, Turkey Day proceeds."
    elsif yearmod == 2
        if $year == 2022
            puts  "The world cup in Qatar has just started. Everyone knows that the stadiums were built with mass slave labor, and on top of the graves of slave laborers. It doesn't affect coverage."
        else
            puts "The world cup in #{Faker::Address.country} has just started."
        end
        puts "\n"
        sleep (1)
        puts "Today we have a match between #{Faker::Address.country} and #{Faker::Address.country} and one between #{Faker::Address.country} and #{Faker::Address.country}."
    elsif yearmod == 3
        puts "Reality is fraying."
    end
end

def brahma
    $todays_tgs = Thanksgiving.all.sample(5)
    50.times do Person.create(name: Faker::Name.unique.name, hunger: "100", tryptophan: "0", politics: nil) 
    end
    $todays_tgs.each{|tg| 
        rand(4..15).times do 
            Plate.create(person_id: Person.all.sample.id, thanksgiving_id: tg.id) 
        end
    }
    $user = Person.create(name: "Yourself, remember?", hunger: "100", tryptophan: "0", politics: nil)
end

$bar = "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
$tglogo = "
████████╗  ██╗  ██╗   █████╗   ███╗   ██╗  ██╗  ██╗  ███████╗   ██████╗   ██╗  ██╗   ██╗  ██╗  ███╗   ██╗   ██████╗
╚══██╔══╝  ██║  ██║  ██╔══██╗  ████╗  ██║  ██║ ██╔╝  ██╔════╝  ██╔════╝   ██║  ██║   ██║  ██║  ████╗  ██║  ██╔════╝
   ██║     ███████║  ███████║  ██╔██╗ ██║  █████╔╝   ███████╗  ██║  ███╗  ██║  ██║   ██║  ██║  ██╔██╗ ██║  ██║  ███╗
   ██║     ██╔══██║  ██╔══██║  ██║╚██╗██║  ██╔═██╗   ╚════██║  ██║   ██║  ██║  ╚██╗ ██╔╝  ██║  ██║╚██╗██║  ██║   ██║
   ██║     ██║  ██║  ██║  ██║  ██║ ╚████║  ██║  ██╗  ███████║  ╚██████╔╝  ██║   ╚████╔╝   ██║  ██║ ╚████║  ╚██████╔╝
   ╚═╝     ╚═╝  ╚═╝  ╚═╝  ╚═╝  ╚═╝  ╚═══╝  ╚═╝  ╚═╝  ╚══════╝   ╚═════╝   ╚═╝    ╚═══╝    ╚═╝  ╚═╝  ╚═══╝   ╚═════╝"

$simlogo = "
                                              ┌─┐┬┌┬┐┬ ┬┬  ┌─┐┌┬┐┌─┐┬─┐
                                              └─┐│││││ ││  ├─┤ │ │ │├┬┘
                                              └─┘┴┴ ┴└─┘┴─┘┴ ┴ ┴ └─┘┴└─"

def fulllogo1
    puts $bar.yellow
    puts "\n"
    puts $tglogo.red
    puts "\n"
    puts $simlogo.red
    puts "\n"
    puts $bar.yellow
end

def fulllogo2
    puts $bar.red
    puts "\n"
    puts $tglogo.yellow
    puts "\n"
    puts $simlogo.yellow
    puts "\n"
    puts $bar.red
end

def logoflicker
    3.times do
        system "clear"
        fulllogo2
        sleep(1)
        system "clear"
        fulllogo1
        sleep(1)
    end
end


def intro
    prompt = TTY::Prompt.new
    $year += 1
    puts $bar.yellow
    sleep(1)
    puts "\n"
    puts $tglogo.red
    puts "\n"
    sleep(1)
    puts $simlogo.red
    sleep(1)
    puts "\n"
    puts $bar.yellow
    sleep(1)
    logoflicker
    sleep(2)
    puts "\n"
    puts "The year is #{$year}, the month November. Halloween is over. You promise yourself your costume will be better next year."
    puts "\n"
    sleep(3)
    puts year_flavor
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
    sleep (1)
    puts "\n"
    thanksgiving_menu
end

def thanksgiving_menu
    prompt = TTY::Prompt.new
    sleep(0.5)
    tg_choice = prompt.select("Which feast are you thinking of hitting?", $todays_tgs.map{|tg| tg.location})
    current_tg = Thanksgiving.find_by location: tg_choice.to_s
    sleep(0.5)
    puts "\n"
    call_menu_choice = prompt.select("#{tg_choice}. You start gathering your things.", ["Go to #{tg_choice}", "Call ahead", "Back"])
    puts "\n"
    if call_menu_choice == "Back"
        clear_and_display
        thanksgiving_menu
    elsif call_menu_choice == "Call ahead"
        call(current_tg)
    else
        clear_and_display
        attend(current_tg)
    end
end

def call(tg)
    prompt = TTY::Prompt.new
    contact = tg.people.sample.name
    sleep(0.5)
    puts "You decide to call ahead to get the lay of the land."
    sleep(3)
    puts "\n"
    puts "Your chosen point of contact is #{contact.red}, whom you know to be in attendance."
    puts "\n"
    rand(1..6).times do 
        sleep(3)
        p "Ring ring ring..."
        puts "\n"
    end
    sleep(3)
    puts "You get the dirt on the attendees. The following individuals have been sighted:"
    puts "\n"
    sleep(3)
    pp tg.people.map{|person| person.name}.uniq
    puts "\n"
    sleep(0.5)
    call_choice = prompt.select("Thanks #{contact.split[0]}.",["Go to #{tg.location}.", "I hate those people."])
    clear_and_display
    if call_choice == "I hate those people."
        puts "\n"
        thanksgiving_menu
    else
        attend(tg)
    end
        
end

def attend(tg)
    sleep(0.5)
    puts "You arrive at #{tg.location.blue}. The hosts greet you and entreat you to dine."
    if tg.course == "Tofurky"
        sleep(1)
        puts "\n"
        puts "It's vegetarian this year."
    end
    find_plate(tg)
end

def find_plate(tg)    
    sleep(1)
    puts "\n"
    if $user.thanksgivings.all.any?{|thanksgiving| thanksgiving == tg}
        puts "You find your plate. Someone has put out a cigarette on it."
        sleep(1)
    else
        puts "You fix yourself a plate and commence small talk. You have fulfilled your harvest pact with these people."
        newplate = Plate.create(person_id: $user.id, thanksgiving_id: tg.id)
        newplate.save
        sleep(1)
    end
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
            eat(tg)
        else
            clear_and_display
            thanksgiving_menu
        end

end

def eat(tg)
    sleep(0.5)
    puts "You shovel matter into your body."
    sleep(0.5)
    puts "\n"
    puts "Hunger " + "-100".green
    $user.hunger -= 100
    puts "Hunger: #{$user.hunger}"
    if tg.course == "Turkey"
        puts "Tryptophan " + "+1".green
        puts "The turkey chemical!"
        $user.tryptophan += 1
    else
        puts "Tryptophan" + "+0".yellow
    end
    puts "Tryptophan: #{$user.tryptophan}"
    sleep(0.5)
    puts "\n"
    if $user.tryptophan == 1
        puts "Mmm. Birdmeat."
    elsif $user.tryptophan == 2
        puts "Unf. Gettin sleepy"
    elsif $user.tryptophan == 3
        puts "Moving is getting to be a real struggle."
    elsif $user.tryptophan == 4
        puts "Mmf... one more... bite... eyes... closing..."
        sleep(1)
        puts "\n"
        puts "Your fork and your head hit the table together. Fade to black."
        sleep(7)
        system "clear"
        sleep(2)
        new_world
    end
    sleep(0.5)
    puts "\n"
    tg_choice(tg)
end

def political_argument(tg)
    prompt = TTY::Prompt.new
    sleep(1)
    puts "\n"
    argue_choice = prompt.select("You start hollering about electoralism, the Second Internationale, and podcasts.", ["Calm down!", "Smash your plate and get the heck out of here!"])
    if argue_choice == "Calm down!"
        find_plate(tg)
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
            puts "You have a plate at: #{locations.join(", ")}."
        else puts "You have plates at: #{locations.join(", ")}."
        end
    end
    puts "Hunger: #{$user.hunger}"
    puts "Tryptophan: #{$user.tryptophan}"
    puts "\n"
end