# Mental Illness Survival Game


#
# Building ideas:
# Ceremonial fire - converts fuel in to mana
# Carpenter's bench - converts fuel into building materials
#
# Spell ideas:
# Warming flame - 1 mana for 2 temporary warmth
# Done! Lesser heal - 1 mana for 1 health
# Greater heal - 2 mana for 1 health
#

# Should probably make it so there are storage caps for resources
# Momentum should be harder to sustain at higher levels 
#
# Things needed to make it playable by others:
# Display stats functions:
#   Main screen
#   Spell options
#   Building options
#   Current spells & buildings


# Bugs:
# does not recognize multiple items of the same type being collected while scavenging
#   (done, untested) Probably is because the function pulls data from the file, updates the file, but keeps working w/ the local data - need to specify ~everything~ to reference stats$
#   Should also consider migrating it to be all directly working from/targetting stats rather than mucking around with attach/detach

# check if creating new omthlies works correctly - I noticed the variable names don't have the $ for specifying create it in stats (ie stats[[stuff... rather than stats$[[stuff... ) and adding the $ makes R complain about the brackets

# Exception handling I need to make:
# did.daily etc : invalid name (will need to have a check if ndailies is 0 at the front of the custom name search (ie no custom dailies)), and probably a count loop with something like 1000 for in checking the custom daily... or use exists or something

# Stuff I'm working on





# Completed code

