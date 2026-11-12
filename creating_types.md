---
tags:
  - typescript
  - type-system
---
# Create a type from an object

^3d9371

```ts
const user = {
  name: "Alice",
  age: 25,
  isAdmin: false,
};

type User = typeof user;
```

Now `User` is equivalent to:

```ts
type User = {
  name: string;
  age: number;
  isAdmin: boolean;
};
```


# Create a type from an array of objects
If you want to create a type that encapslates the array, you can go ahead as use `typeof` directly as in [[Creating types#^3d9371 | Create a type from an object]].

If you want to only have the properties of the items you can do the following:

```ts
const users = [
  { id: 1, name: "Alice" },
  { id: 2, name: "Bob" },
];

type User = (typeof users)[number];
// { id: number; name: string }
```


# Create a union type from an object's values

```ts
const statuses = {
  PENDING: "pending",
  SUCCESS: "success",
  FAILED: "failed",
} as const;

type Status = typeof statuses[keyof typeof statuses];
// "pending" | "success" | "failed"
```
