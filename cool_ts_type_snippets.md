---
tags:
  - typescript
  - type-system
---

Force a specific pattern and type
```typescript
const theme = {
  background: "#ffffff",
  text: "red" 
} satisfies Record<string, `#${string}`>;
```


