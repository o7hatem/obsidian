---
tags:
  - mafateeh
---
# Wrong letter entered

There are few ways to about what to do when a user enters a wrong letter
1. Not registering the keystroke and let them keep entering letters until they enter the correct one to move on to the next one.  (reference: ratatype)
	* Con: The user doesn't learn to use the backspace.
2. Let them type a wrong letter and let them continue writing the rest of the lesson. (reference: monkeytype)
3. Let them type a wrong letter and let them continue writing the rest of the lesson. But, they *must* go back and delete the wrongly-entered letter to continue on. (reference: typeracer)

# Change Letters Colors
There are two ways
1. For every keystroke re-render the entire paragraph to see which one was 1) not been typed yet 2) been typed correctly 3) been typed incorrectly
2. Give each span/letter a data attribute with an index and only retrieve the index of latest type stroke and compare it with the target character in the `lessonText`
	* Pro: Solve the problem with the first solution of not needing to re-render the entire paragraph.

