---
tags:
  - typescript
  - type-system
---
A **type predicate** in TypeScript is a special return type that tells TypeScript: “If this function returns `true`, you can treat the value as this more specific type.”

```ts
function isString(value: unknown): value is string {
  return typeof value === "string";
}
```


Full example: 
```ts
type Cat = {
	meow(): void;
};

type Dog = {
	bark(): void;
};

type Bird = {
	chirp(): void;
};

function isCat(animal: Cat | Dog | Bird): animal is Cat {
	return "meow" in animal;
}

function isDog(animal: Cat | Dog | Bird): animal is Dog {
	return "meow" in animal;
}

function makeSound(animal: Cat | Dog | Bird) {
	console.log("isCat: ", isCat(animal));
	if (isCat(animal)) {
		animal.meow(); // TypeScript knows it's Cat
	} else if (isDog(animal)) {
		animal.bark(); // TypeScript knows it's Dog
	} else {
		animal.chirp(); // Typescript knows it's Bird
	}
}
```

## Cleaner Approach

In case you need more than more function with a specific type predicate, you can use a generic function.

```ts
function isDefined<T>(value: T | undefined): value is T {
  return value !== undefined;
}
```

Then, to use it:

```ts
// Each item in the array will be defined as of type <T | undefined>
// And will return of type <T> only
return data.filter(isDefined);
```