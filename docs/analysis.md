# Domain Analysis for the Battle challenge

## User Stories
```
As two Players,
So we can play a personalised game of Battle,
We want to Start a fight by entering our Names and seeing them

As Player 1,
So I can see how close I am to winning
I want to see Player 2's Hit Points

As Player 1,
So I can win a game of Battle,
I want to attack Player 2, and I want to get a confirmation

As Player 1,
So I can start to win a game of Battle,
I want my attack to reduce Player 2's HP by 10

As two Players,
So we can continue our game of Battle,
We want to switch turns

As Player 1,
So I can see how close I am to losing,
I want to see my own hit points

As Player 1,
So I can lose a game of Battle,
I want Player 2 to attack me, and I want to get a confirmation

As Player 1,
So I can start to lose a game of Battle,
I want Player 2's attack to reduce my HP by 10

As a Player,
So I can Lose a game of Battle,
I want to see a 'Lose' message if I reach 0HP first

As a Player,
So I can play a suspenseful game of Battle,
I want all Attacks to deal a random amount of damage

As a lonely Player,
So I can keep my Battle skills up to scratch
I want to play a Computerised opponent

As a Player,
So I can enjoy a game of Battle with more variety,
I want to choose from a range of attacks I could make

As a Player,
So I can better enjoy a game of Battle,
I want some of my attacks to Paralyse an opponent (chance of losing their next attack)

As a Player,
So I can better enjoy a game of Battle,
I want one of my attacks to have a chance of Poisoning my Opponent (Opponent takes a small random amount of damage at the beginning of their turn)

As a Player,
So I can better enjoy a game of Battle,
I want to make an attack that has a chance of sending my Opponent to Sleep (Opponent definitely misses next turn)

As a Player,
So I can extend my joyous experience of Battle,
I want to have an attack that heals some of my Hit Points

As a Player,
So I can enjoy my game of Battle,
I want a sexy user interface
```

## Minimum Requirements based on User Stories
- Battle game interface - welcome and setup users - name
- Fight interface - ability for a User to select and complete an action
  - minimum requirement is single event chain
  - possible randomisation of first event as an enhancement / game leveller
- confirmation of action, and resultant impact on User / Opponent
- Visualisation of hit point status of User and Opponent
- Loop until game logic results in win/lose condition
  - ignoring 'draw' game state at this time
- No requirement for history
- Single "Fight" event boundary
- requirement for a 'sexy' interface
- requirement for a 'single player' experience

## Objects / Methods / Properties
### Objects
Battle - game / environment Object
Fight - child object of Battle - single engagement
User - player in Battle / Fight engagement - could be persistent or transitory
Attack / Turn - object to capture Attack event - for history and combined actions
Status / Health - object to manage the longer term effects of an 'Attack'

### Methods
Action - method to capture event and apply status effects
Confirmation/effect - confirmation of action and total reaction for a 'turn'
Turn Management - transfer of control to do actions

### Properties
Name - property of 'User'
Control state - ability for a user to submit an action
Hit points - scoring property of the 'fight' / status of User
Attack Type - property of Attack - different logic / impacts
  Paralyse, Sleep, Attack, Poison, Heal,
Effect - property of Action - determine actual effect - to be compiled into a 'Status' effect
Status - combined property of 'User' - paralyse, Heal, Poison, etc to provide feed forward impacts of previous attack

### Conditions
Win - property of 'User' and/or 'Fight' - opponent reaches zero HP
Lose - property of 'User' and/or 'Fight'- User reaches zero HP
Probability - property of 'Status' and 'Effect' - some actions/effects should be probabilistic


## DEV STEP
reduce opponent HP by 10 on an attack
Turn based activity - focus / ball switches after each action
attack actions are to be visible to both parties
AI / Computer opponent to be provided - randomise attacks / attack types
  - enhancement - provide 'fight logic tree'
  - enhancement - 'learning' - multiple trees / strategies / 'personalities'
  - enhancement self selectable 'personality' based on opponent actions / status.
'Sexy' user interface

## Enhancements
- enable "power" of actions - to modify impacts, but introduce 'risks'/'vulnerabilities'
  - 'Vulnerabilities' - reflected nerfs on a User, due to 'risky' actions
  - turn or chain impacts
- introduce 'action window' - time limited control to do an action
  - ability to modify window with actions / status
  - adrenalin, morale, etc.
- enable "response" actions
  - Parry, Avoid, Counter Attack, etc
- enable 'chaining' of actions
  - combos, increased effectivity, increased power, reduced impacts, etc.
- maintenance of "score history" - battle made up of many fights
- ability to allow 'spoils' to be obtained (weapons, modifiers, skill development)
- Avatar - image to be developed to show progress / status in the 'Battle universe'
- Character - modifiers to be developed
  - introduction of "training" event to compliment "fight" event - allow development
- Customisation of Avatar
- different attack types
  - trainable, obtained through spoils, obtained through 'experience', obtained with 'weapons'
- Buffs and nerfs - impacts that follow to next fight
  - could be morale or wounds, etc.
- fully fledged AI opponent - including 'mistakes'
