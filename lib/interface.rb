def intro
    prompt = TTY::Prompt.new
        puts "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
    sleep(0.5)
    puts "\n"
    puts "████████╗  ██╗  ██╗   █████╗   ███╗   ██╗  ██╗  ██╗  ███████╗   ██████╗   ██╗  ██╗   ██╗  ██╗  ███╗   ██╗   ██████╗" 
    sleep(0.5)
    puts "╚══██╔══╝  ██║  ██║  ██╔══██╗  ████╗  ██║  ██║ ██╔╝  ██╔════╝  ██╔════╝   ██║  ██║   ██║  ██║  ████╗  ██║  ██╔════╝"
    sleep(0.5) 
    puts "   ██║     ███████║  ███████║  ██╔██╗ ██║  █████╔╝   ███████╗  ██║  ███╗  ██║  ██║   ██║  ██║  ██╔██╗ ██║  ██║  ███╗"
    sleep(0.5)
    puts "   ██║     ██╔══██║  ██╔══██║  ██║╚██╗██║  ██╔═██╗   ╚════██║  ██║   ██║  ██║  ╚██╗ ██╔╝  ██║  ██║╚██╗██║  ██║   ██║"
    sleep(0.5)
    puts "   ██║     ██║  ██║  ██║  ██║  ██║ ╚████║  ██║  ██╗  ███████║  ╚██████╔╝  ██║   ╚████╔╝   ██║  ██║ ╚████║  ╚██████╔╝"
    sleep(0.5)
    puts "   ╚═╝     ╚═╝  ╚═╝  ╚═╝  ╚═╝  ╚═╝  ╚═══╝  ╚═╝  ╚═╝  ╚══════╝   ╚═════╝   ╚═╝    ╚═══╝    ╚═╝  ╚═╝  ╚═══╝   ╚═════╝"
    sleep(1)
    puts "\n"
    puts "
                                            ┌─┐┬┌┬┐┬ ┬┬  ┌─┐┌┬┐┌─┐┬─┐
                                            └─┐│││││ ││  ├─┤ │ │ │├┬┘
                                            └─┘┴┴ ┴└─┘┴─┘┴ ┴ ┴ └─┘┴└─
    "
    sleep(0.5)
    puts "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
    sleep(4)
    puts "\n"
    puts "The year is 2020, the month November. Halloween is over. You promise yourself your costume will be better next year."
    puts "\n"
    sleep(7)
    puts "The election was three weeks ago. It was devastating."
    puts "\n"
    sleep(5)
    puts "It is time once again for the American harvest/genocide festival."
    puts "\n"
    sleep(5)
    dish = prompt.ask('What did you make to bring to Thanksgiving this year?')
    sleep(1)
    puts "\n"
    if dish 
    puts "Sounds good. Hope it came out okay."
    else 
    puts "Nothing, huh? Typical."
    end
    sleep(3)
    puts "\n"
    puts "This year's a big one; you're expected at five seperate Thanksgivings. It's a real ordeal, but you suppose you should be thankful."
    sleep (5)
    puts "\n"
end