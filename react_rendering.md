---
tags:
  - react
---
# What causes a component to re-render?

There are multiple reasons causing a component to re-render:
1. Its state changes. Whenever you call a state setter, the components get re-rendered.
2. Its props change. 
3. The context the component depends on gets different values.
4. The parent re-rendered. All the children of the re-rendered component also get rendered again.