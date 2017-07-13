# rsurvival
___
rsurvival is a R package and simple survival game where you progress and survive by doing recurring daily, weekly, and monthly to-dos and taking care of yourself by cleaning and going for walks.

Version: 0.2

## Getting Started

Install in r by using `devtools::install_github("alexisblackbird/rsurvival@*release")` and load the package using `library("rsurvival")`

Start a new game by using `new.game()` See the documentation by typing `?new.game()` for more details. You can use a question mark before any function to see its documentation in R.

# Game Concepts
___
## Tasks

Tasks in rsurvival are recurring and provide bonuses and resources when they are completed. They are divided into dailies, weeklies, and monthlies. To get you started, there are a set of default tasks described bellow. These can be removed (and later re-enabled) using `defaults()`, and new tasks can be made using `new.daily()`, `new.weekly()`, and `new.monthly()`. 

When choosing what tasks to take, keep it realistic! It should be a challenge to complete them all but you should be able to do them. Feel free to adjust your tasks and the number of tasks you use to fit what you're able to accomplish. 

### Dailies

Dailies are small tasks that are generally geared towards taking care of yourself. Dailies come in a variety of types that provide different bonuses. Walk-type dailies use `scavenge()` to gather supplies. Clean-type dailies use `clean()` to help prevent and reduce squalor. Mana-type dailies regenerate a point of mana when completed. Dailies can also not have a special type. If all dailies are completed, you receive an experience point.

The defaults include:

walk: a walk-type daily. Go on a walk to complete this, it doesn't have to be long.

tidy: tidy up around your home or work space, even if it's just a bit.

meds: if you have medication, take them. This is a special daily and you will lose a point of health if you don't complete it. If you aren't taking any medications, you can either use this for daily vitamins, or just disable the task.

meditate: spend some time meditating. If you've never meditated before, there are many good guided meditations you can find on Youtube, or apps for your mobile device that help with meditation.

### Weeklies

Weeklies are slightly larger tasks that are generally geared towards growing and learning. Completing weeklies earns you an experience point, and completing all of them earns you a construction point. Weeklies reset when you run the day on Sunday.

The defaults include:

read science: read a scientific article or chapter of a book about something that interests you but isn't directly related to your work or school.

read social justice: read an article or chapter of a book about social justice. Unlearning our privileges and challenging oppression are important for growth, both individually and as a society. If you aren't sure where to start, [Everyday Feminism](http://everydayfeminism.com/) has good articles that are very accessible.
hobby: spend some time working on one of your hobbies, even if it's only for an hour or two.

### Monthlies

Monthlies are larger and more intimidating tasks, or just those that don't need to be done that often but can be hard to get motivated to do. When you complete a monthly, you earn a construction point, and completing all of them earns you five experience points. Monthlies don't automatically reset - this must be done manually at the end of the month by using `run.day(endmonth = TRUE)`.

The defaults include:

deep clean: Clean something you don't normally do, and give it a thorough cleaning - maybe do a thorough clean of your bathroom and get to as many nooks and crannies as you can, or give your oven a good scrub.

## Days

Most changes in the game happen at the end of the day when you use `run.day()`. This processes all of the stats changes and updates the day of the week. You should do this every day.

## Health

You have health points that get reduced by not having enough supplies, due to excess squalor, or from forgetting to take meds. If health reaches 0, you loose all of your experience points and your health is reset to 5. Any level up points you have or bonuses you've gained are kept, however. Health regenerates gradually over time.

## Mana

Mana points can be used to cast spells to help you survive. You start with none, but can gain more from leveling. Mana is replenished from meditating or other mana-type tasks.

## Squalor

Squalor points build up when you go a day without doing any cleaning, and if it builds up too much it can damage you. Squalor is reduced by cleaning. You can clean through clean-type dailies, or using `clean()` if you don't have any of those or got a lot of cleaning done that day.

## Scavenging

Scavenging for materials is done by going on walks and using the `scavange()` function. With this, you can find food, fuel, and building materials.

## Food

Food is essential to survival. You lose one food a day, and if you don't have any food you take a point of damage.

## Fuel

Fuel helps you stay warm at night. If you don't have any fuel, you take a point of damage. Building shelters decreases the odds that you will need to use fuel on any given night.

## Experience and Levels

As you gain experience, you level up. When you level up you gain level up points, which can be used to increase your health with `level.health()`, mana with `level.mana()`, or to learn new spells or gain traits.

## Spells

Spells allow you to spend mana to gain benefits. Learning spells costs a level up. The list of spells can be seen using the `view.spells()` function, and each spell has a function for learning and using the spell, for example `learn.lesserheal()` and `cast.lesserheal()`.

## Buildings and Construction Points

Buildings provide lasting benefits that make the game easier, at the cost of materials gained from scavenging and construction points. Buildings can be viewed using `view.buildings()`. Buildings have a function to build them, for example `build.survivalshelter()`. 


