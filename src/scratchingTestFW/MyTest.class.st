Class {
	#name : #MyTest,
	#superclass : #TFTestCase,
	#category : #scratchingTestFW
}

{ #category : #accessing }
MyTest >> SecondTest [
	| a |
	a := 1.
	a := a+ 1.
	^ self assertDelta: 2 and: a
]

{ #category : #accessing }
MyTest >> firstTest [
	| a |
	a := 1.
	^ self assertDelta: 1 and: a
]

{ #category : #accessing }
MyTest >> thirdTest [

	| a |
	a := 1.
	^ self assertDelta: a and: 1
]
