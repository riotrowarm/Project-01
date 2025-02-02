/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/\


VAR knife = 0
VAR Knife = 0
VAR Strength = 0 
VAR Doc_Name =""
VAR time = -1 // 0 Ten Minutes, 1 Thirty Minutes, 2 An Hour

Your eyes flutter open, a bright white blinding light hangs above you in empty room with nothing but a small mattress on the floor and giant mirror on the wall that gives an uneasy feeling. You can’t remember who or what you are.  Do you even remember how to speak?

*[Investigate the mirror]-> mirror

*[Crawl onto the mattress]->mattress

*[Try to speak]->speaking

=== speaking ===

You open your mouth yet only weird nosies come out. what are you even trying to say. You scream out trying to form a sentence, what are you even saying. Help? My is? or Where am i? You stop trying after a while. 

Just then you hear the sound a door open and the sound of something slinding in, then the sound of the door closing. 

*[Investigate the source of the sound]->foodTray

*[Ingore it]->ignore

=== mattress
~ Knife = Knife + 1

You crawl towards the mattress. It smells familiar, and has unknown markings on it but you can't help but feel safe here. Its not comfortable at all, you can't help but feel as if something sharp is in the mattress. What an odd feeling. 

Just then you hear the sound a door open and the sound of something slinding in, then the sound of the door closing. 

*[Investigate the source of the sound]->foodTray

*[Ingore it]->ignore

== mirror ===

You crawl towards the mirror, staring at yourself and your appearance which you find disgustinging. you reach out your hand touching the glass, but you can't help but feel as if someing is trying to reach back from behind the mirror.

Just then you hear the sound a door open and the sound of something slinding in, then the sound of the door closing. 

*[Investigate the source of the sound]->foodTray

*[Ingore it]->ignore

=== ignore===

The sound of a metal tray scrapping the floor makes you nervous, better not to explore what could possibly hurt you, right? Pain means death right? 

*[Continue]-> Doc

=== foodTray ===

Following the source of the sound you spot a nice red looking bowl. And inside you is something that smells good, It looks weird but your stomach starts to make a rumbling nosie, and your mouth starts to drool. 

*[Eat the food]->eating

=== eating ===
~ Strength = Strength + 1

You lower your and scoop up whatever in is in that bowl and start eating it like a rabid dog. It taste bad but it smelled so good, you don't understand how. But at least your stomach isn't rumbling anymore.

*[Continue]-> Doc

=== Doc ===

The mirror makes a weird nosie and you turn your head to see a woman on the other side of the mirror, shes...

*[Beautiful]
~ Doc_Name = "Beautiful"
 ->Doc1
 
*[Terrifying]
~Doc_Name = "Terrifying"
->Doc1

*[Plain]
~Doc_Name = "Plain"
->Doc1

=== Doc1 ===
The {Doc_Name} lady looks at you through the mirror and smiles at you. She speaks through an intercom but you can't understand what she is saying. It sounds like { Doc_Name == "Beautiful": she is speaking in an Orchestra, her voice the violin| } { Doc_Name == "Terrifying": her voice are her nails and she is killing the chalk board| } { Doc_Name == "Plain" : she has done this before.  But I don't know her, have we met?| } 

She then looks down on you and smiles before pressing a bottom and a gas enters the room. 

*[Continue]->ex1

=== ex1 ===

You wake up straped to a table the {Doc_Name} lady is standing next to the table along with men in white hazmat suits. You don't know whats going on. Your scared, you can't move because of the restraints. { not knife_pickup: If only you had something to cut them with| }

*{knife > 0 } [Use the knife]-> escape
 
+[Be Brave]-> Brave

=== Brave ===


The {Doc_Name} lady injects you with something. It hurts you feel your body start reacting. The men in white hazmat suits rub something on your face that burns. 

+[Tuff it out]->tuff1

+[Scream out in pain]-> fin

=== tuff1 ===
~time = time + 1
Its been about {advance_time () }

Yet the pain only gets worse

+[Endure the pain]->tuff2

+[Scream out in pain]-> fin

=== tuff2 ===
Its been about {advance_time () }

Your face starts to burn off

+[Endure the pain]-> tuff3

+[Scream out in pain]-> fin

=== tuff3 ===
They add more cream on your face that makes the pain worse

+{ time == 2 } [You feel yourself changing]-> Ending1

+[Scream out in pain]-> fin


=== fin ===
The {Doc_Name} Lady knocks you out and the pain stops.

+[Contiune]->Room

 
 === Room ===
 
 They took you back to your room you where in orginally. Your tired and your stomach rumbles again. But no food...
 
 +[Sleep]->mattress1
 
 === mattress1 ===
 ~ Knife = Knife + 1

{ Knife < 2 : You crawl towards the mattress. It smells familiar, and has unknown markings on it but you can't help but feel safe here. Its not comfortable at all, you can't help but feel as if something sharp is in the mattress. What an odd feeling.| } 

{ Knife > 1 : You lay down on the mattress, but you feel that sharp stabbing thing again withing the mattress | }
 
* { Knife > 1 } [Open the mattress]->  knife_pickup

+[Ingore the pain and sleep]-> DayTime


=== knife_pickup ===
~knife = knife + 1
 You find a knife within the mattress, did I put this here? You can't remember.
 
 +[Take knife]-> K1
 
 === K1 ===
 
 You pick up the knife and hide in on your body, hopefully no one noticed. 
 
 +[Go Sleep]-> DayTime
 
 === Ending1 ===
 Your body starts to change, your grow another arm and then you feel nothing. The {Doc_Name} lady put you down. 
 
 ->END
 
 === DayTime==
 
 You wake up and hear the tray slide under the door again.
 
 +[Eat]->eat
 
 +[Ingore the food]->ignore1
 
 === ignore1 ===
 
 You ignore the food. And the {Doc_Name} lady comes back. Its time for your daily testing again. 
 
 +[Go on]->ex1

 
 === eat===
 ~ Strength = Strength + 1
 
 You eat the food. And the {Doc_Name} lady comes back. Its time for your daily testing again. 
 
 +[Go on]->ex1
 
 === escape ===
 You cut the restraints and get up and fly towards one the men in the hazmat suits cutting him down. The {Doc_Name} lady runs out of the room. And a security guard runs in ready to end you. 
 
* { Strength > 1 } [Over Power Him]-> escape

+[Fight him off]->badending

=== escape1 ===
You manage to Overpower him and kill him, you run through the lab until you find yourself out side. You see the outside, in a lobby of what seems to be a cosmetic company. You see many people shopping, and workers helping people. But they all stop and stare at you. You realize that your covered in blood, but your also hungry. 

+[EAT]-> CannonEND

=== CannonEND ===
You feel so hungry. You lunge at a woman and bite her, she manges to push you off of her, you then you attack another man, this time eating him, but then the woman you bit turns into a hungry monster like you... people run and scream out of the store. But more and more people turn into hungry monsters just like you.

A zombie outbreak just started, all because of a bad face cream. 

->END
=== badending==

You try to fight him off but he over powers you and kills you. 

->END
 
 
 == function advance_time ==

    ~ time = time + 1
    
    {
        - time > 2:
            ~ time = 0
    }    
    
    {    
        - time == 0:
            ~ return "Ten Mintutes"
        
        - time == 1:
            ~ return "Thirty Mintutes"
        
        - time == 2:
            ~ return "An Hour"
            
      
    }
            
         
    
    
        
    ~ return time
 
 
 
 
