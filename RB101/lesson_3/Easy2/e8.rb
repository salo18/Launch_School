advice = "Few things in life are as important as house training your pet dinosaur."

# ...remove everything starting from "house".

advice.slice!("house training your pet dinosaur")


# LS answer:
advice.slice!(0, advice.index('house'))

# without the !, slice does not mutate the caller and advice has the same value after
# the operation

