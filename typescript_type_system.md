---
tags:
  - typescript
  - type-system
---
# Utility Types
## Partial

## Required
## Readonly
## Omit
## Pick
## Record

# Satisfies
The **`satisfies` operator** in TypeScript (introduced in [TypeScript 4.9](https://www.typescriptlang.org/docs/handbook/release-notes/typescript-4-9.html)) allows you to **validate that an expression matches a specific type without modifying or widening the inferred type** of that expression. [1](https://www.typescriptlang.org/docs/handbook/release-notes/typescript-4-9.html)

It safely acts as a pre-assignment type check: the **value beats the type**. 

---

The Problem It Solves

Traditionally, if you wanted to ensure an object conformed to a type, you would use a colon `:` type annotation. However, this **widens** the type to the target definition, causing TypeScript to forget the exact, specific shape of your data. 

```typescript
type Palette = Record<string, string | [number, number, number]>;

// The type is widened to string | [number, number, number]
const colors: Palette = {
  primary: "#ff0000",
  secondary: [0, 255, 0]
};

// ❌ ERROR: TypeScript thinks colors.primary could be an array,
// so you cannot safely use string methods without a type guard.
// Hover over primary to see what type it's infered as.
colors.primary.toLowerCase(); 
```

```typescript
const colors = {
  primary: "#ff0000",
  secondary: [0, 255, 0]
} satisfies Palette;

// SUCCESS: TypeScript validates that the structure matches 'Palette',
// BUT it remembers that 'primary' is exactly a string.
colors.primary.toLowerCase(); // Works perfectly!
```