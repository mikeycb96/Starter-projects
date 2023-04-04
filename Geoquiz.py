print("Welcome to the GeoQuiz!")

playing = input("Are you ready to test your geographical skills?")

if playing.lower() != "yes":
    quit()

print("Okay! Let's begin!")
score = 0

answer = input("What is the capital of Northern Ireland? ")
if answer.lower() == "belfast":
    print("Correct!")
    score += 1
else:
    print("Incorrect :(")

answer = input("What is the capital of The United Arab Emirates? ")
if answer.lower() == "abu dhabi":
    print("Correct!")
    score += 1
else:
    print("Incorrect :(")

answer = input("What is the capital of Nigeria? ")
if answer.lower() == "abuja":
    print("Correct!")
    score += 1
else:
    print("Incorrect :(")

answer = input("What is the capital of Japan? ")
if answer.lower() == "tokyo":
    print("Correct!")
    score += 1
else:
    print("Incorrect :(")

answer = input("What is the capital of Egypt? ")
if answer.lower() == "cairo":
    print("Correct!")
    score += 1
else:
    print("Incorrect :(")

answer = input("What country is Brussels the capital of? ")
if answer.lower() == "belgium":
    print("Correct!")
    score += 1
else:
    print("Incorrect :(")

answer = input("What country is Bucharest the capital of? ")
if answer.lower() == "romania":
    print("Correct!")
    score += 1
else:
    print("Incorrect :(")

answer = input("What country is Havana the capital of? ")
if answer.lower() == "cuba":
    print("Correct!")
    score += 1
else:
    print("Incorrect :(")

answer = input("What country is Addis Ababa the capital of? ")
if answer.lower() == "ethiopia":
    print("Correct!")
    score += 1
else:
    print("Incorrect :(")

answer = input("What country is Georgetown the capital of? ")
if answer.lower() == "Guyana":
    print("Correct!")
    score += 1
else:
    print("Incorrect :(")

answer = input("What is the largest country in the world by land area? ")
if answer.lower() == "russia":
    print("Correct!")
    score += 1
else:
    print("Incorrect :(")

answer = input("What is the most populous country in the world? ")
if answer.lower() == "china":
    print("Correct!")
    score += 1
else:
    print("Incorrect :(")

answer = input("What is the world's largest ocean? ")
if answer.lower() == "pacific" and "pacific ocean" and "the pacific":
    print("Correct!")
    score += 1
else:
    print("Incorrect :(")

answer = input("What is the world's widest river? ")
if answer.lower() == "the amazon" and "the amazon river" and "amazon" and "amazon river":
    print("Correct!")
    score += 1
else:
    print("Incorrect :(")

answer = input("What is the world's longest river? ")
if answer.lower() == "nile" and "the nile" and "the river nile" and "the nile river" and "river nile" and "nile river":
    print("Correct!")
    score += 1
else:
    print("Incorrect :(")

answer = input("What is world's longest mountain range on land? ")
if answer.lower() == "andes" and "the andes":
    print("Correct! Fun fact, the Mid-Atlantic Ridge is just over 40,000 miles long but is under the Atlantic Ocean!")
    score += 1
else:
    print("Incorrect :(")

answer = input("What is the name of the famous red rock in Australia? ")
if answer.lower() == "uluru" and "ayer's rock":
    print("Correct!")
    score += 1
else:
    print("Incorrect :(")

answer = input("How many main islands does Japan have? ")
if answer.lower() == "4" and "four":
    print("Correct!")
    score += 1
else:
    print("Incorrect :(")

answer = input("What is the national animal of Canada? ")
if answer.lower() == "beaver":
    print("Correct!")
    score += 1
else:
    print("Incorrect :(")

answer = input("What is the coldest place in the world? ")
if answer.lower() == "Antarctica":
    print("Correct!")
    score += 1
else:
    print("Incorrect :(")

print("You got " + str(score) + " questions correct!")
print("You got " + str((score / 20) * 100) + "%.")
