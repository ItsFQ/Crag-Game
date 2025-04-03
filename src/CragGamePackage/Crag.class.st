Class {
	#name : #Crag,
	#superclass : #Object,
	#instVars : [
		'roll'
	],
	#category : #CragGamePackage
}

{ #category : #'Class Methods' }
Crag class >> new: dice [

|newCrag|

newCrag := self new.

newCrag setRoll: dice.

^newCrag 




]

{ #category : #'Class Methods' }
Crag class >> surprise [
|arr  |

arr := Array new: 3.
	
1 to: 3 do:
[:i|
	arr at: i put: (( 1 to: 6 ) atRandom)
].

^ (self new: arr)


]

{ #category : #'Instance Methods' }
Crag >> category [

|sortRoll maxNum numOccur maxOccur totalMax totalNum |

self isCrag
ifTrue:
[ 
	^'Crag'
	
].

self isThirteen
ifTrue:
[ 
	^'Thirteen'
	
].

self isThreeOfAKind 
ifTrue:
[ 
	^'Three-Of-A-Kind'
	
].

sortRoll := roll asSortedCollection.

((sortRoll at: 1) = 1) & ((sortRoll at: 2) = 2) & ((sortRoll at: 3) = 3) 
ifTrue: 
[ 
	^'Low Straight'	
].

((sortRoll at: 1) = 4) & ((sortRoll at: 2) = 5) & ((sortRoll at: 3) = 6) 
ifTrue: 
[ 
	^'High Straight'	
].

((sortRoll at: 1) = 1) & ((sortRoll at: 2) = 3) & ((sortRoll at: 3) = 5) 
ifTrue: 
[ 
	^'Odd Straight'	
].

((sortRoll at: 1) = 2) & ((sortRoll at: 2) = 4) & ((sortRoll at: 3) = 6) 
ifTrue: 
[ 
	^'Even Straight'	
].

maxNum := roll inject: 0 into: [:a :c | a max: c].
maxOccur := roll occurrencesOf: maxNum.
totalMax := maxNum * maxOccur.

1 to: (roll size) do:
[:i|  
		totalNum := 0.
		numOccur := roll occurrencesOf: (roll at: i).
		totalNum := (roll at: i) * numOccur.
		
		totalNum > totalMax 
		ifTrue:
		[  
			maxNum := (roll at: i)
		] 
	
].

			maxNum = 6
			ifTrue:
			[
				Transcript show: 'Sixes'; cr.  
				^'Sixes'
			].
			
			maxNum = 5
			ifTrue:
			[ 
				Transcript show: 'Fives'; cr. 
				^'Fives' 
			].
		
			maxNum = 4
			ifTrue:
			[
				Transcript show: 'Fours'; cr.  
				^'Fours' 
			].
		
			maxNum = 3
			ifTrue:
			[ 
				Transcript show: 'Threes'; cr. 
				^'Threes' 
			].
		
			maxNum = 2
			ifTrue:
			[
				Transcript show: 'Twos'; cr.  
				^'Twos' 
			].
			Transcript show: 'Ones'; cr. 
			^'Ones' 

]

{ #category : #'Instance Methods' }
Crag >> getRoll [
	^roll
]

{ #category : #'Instance Methods' }
Crag >> isCrag [
	|sum|
	
	sum := 0. 
	roll do: [:a | sum := sum + a]. 
	
	(sum ~= 13)
	ifTrue:
	[ 
		^false
	]. 
	
	
	1 to: (roll size) do:
	[:i|  
		(i+1) to: (roll size) do:
		[:j| 
			(roll at: i) = (roll at: j)
			ifTrue:
			[  
				^true
			]
		
		]  
	].
^false
]

{ #category : #'Instance Methods' }
Crag >> isStraight [

|sortRoll|

sortRoll := roll asSortedCollection.

((sortRoll at: 1) = 1) & ((sortRoll at: 2) = 2) & ((sortRoll at: 3) = 3) 
ifTrue: 
[ 
	^true	
].

((sortRoll at: 1) = 4) & ((sortRoll at: 2) = 5) & ((sortRoll at: 3) = 6) 
ifTrue: 
[ 
	^true	
].

((sortRoll at: 1) = 1) & ((sortRoll at: 2) = 3) & ((sortRoll at: 3) = 5) 
ifTrue: 
[ 
	^true	
].

((sortRoll at: 1) = 2) & ((sortRoll at: 2) = 4) & ((sortRoll at: 3) =6) 
ifTrue: 
[ 
	^true	
].

^false
]

{ #category : #'Instance Methods' }
Crag >> isThirteen [
|sum|
	
sum := 0. 
roll do: [:a | sum := sum + a]. 

(self isCrag)
ifFalse: 
[ 
	sum = 13
	ifTrue: 
	[
		^true
	]
].
^false
]

{ #category : #'Instance Methods' }
Crag >> isThreeOfAKind [

^((roll asSet size) = 1)
]

{ #category : #'Instance Methods' }
Crag >> score [

	| max sum  y total |
	self isCrag ifTrue: [ ^ 50 ].

	self isThirteen ifTrue: [ ^ 26 ].

	self isThreeOfAKind ifTrue: [ ^ 25 ].

	self isStraight ifTrue: [ ^ 20 ].
	
	max := roll inject: 0 into: [ :a :c | a max: c ].
	sum := (roll occurrencesOf: max) * max. 
	
	1 to: (roll size) do: [ :i |
		y := roll occurrencesOf: (roll at: i). 
		total := (roll at: i) * y.
		
		total > max
		ifTrue: 
		[ 
			sum := total
		].
		
	].
	^ sum
]

{ #category : #'Instance Methods' }
Crag >> setRoll: dice [
	roll := dice.
]
