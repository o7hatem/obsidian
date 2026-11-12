---
tags:
  - prisma
  - database
---
# To-One Relation Operators

For a relation where only one recored is related , Prisma uses things like:

### 1. `is`

```ts
where: {
  profile: {
    is: {
      active: true
    }
  }
}
```

### 2. `isNot`

```ts
where: {
  profile: {
    isNot: {
      active: true
    }
  }
}
```

However, you can definitely omit them so it becomes the regular-looking
```ts
where: {
  profile: {
    active: true
  }
}
```

Nevertheless, it can come in handy
```ts
// Select all records where it has no profile
where: {
  profile: {
    is: null
  }
}
```

# To-Many Relation Operators

### 1. `none`

Matches records where **zero** related records satisfy the condition.

```typescript
// Employees with no job record for this club.
where: {
  employeeJobRecord: {
    none: {
      clubId: clubId,
    },
  },
}
```

---

### 2. `some`

Matches records where **at least one** related record satisfies the condition.

```typescript
// Employees with at least one job record for this club.
where: {
  employeeJobRecord: {
    some: {
      clubId,
    },
  },
}
```

For example:

```
Alice → club-A, club-B   
Bob   → club-B           
```

with `some: { clubId: "club-A" }`.

---

### 3. `every`

Matches records where **every** related record satisfies the condition.

```
where: {
  employeeJobRecord: {
    every: {
      clubId,
    },
  },
}
```

> "Employees where all their job records belong to this club."

> [!important]
> `every` has a logical edge case: an employee with **zero** related records also satisfies `every`, because there isn't a related record that violates the condition.
>  
>  So if you want:
>  
>  "Has at least one job record, and all of them belong to this club"
>  
>  you'd typically combine:
>  ```typescript
>  where: {
>     employeeJobRecord: {
> 	    some: {},
> 	    every: {
> 		    clubId,
> 		},
> 	},
> ```




