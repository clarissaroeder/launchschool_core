# Shorten the following sentence:

advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!(0, advice.index("house"))
p advice

# If you used #slice instead, the same string would be returned, but advice would not be altered