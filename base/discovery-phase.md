# Discovery Phase Requirements

**Purpose**: Define the systematic process for analyzing existing codebase patterns before implementing new features.

## Why Discovery First?

Before implementing any feature, we must:
- **Find existing patterns** to maintain consistency
- **Identify reusable components** to avoid duplication
- **Understand architecture** to make aligned decisions
- **Document findings** to preserve knowledge across sessions

## Discovery Scope

### 1. Component Patterns
Search for similar UI components that perform comparable actions:
- Buttons with destructive actions (delete, remove, clear)
- Confirmation dialogs/modals
- Action buttons on detail/view pages
- Loading states and disabled states

**Output**: List of relevant components with file paths and brief descriptions.

### 2. API Integration Patterns
Identify how the codebase handles API calls:
- API client structure and location
- Common hooks for data mutations (e.g., `useMutation`, custom hooks)
- Error handling patterns (toast, notification, inline errors)
- Loading state management

**Output**: Pattern summary with code examples.

### 3. Navigation Patterns
Understand how the app handles navigation after actions:
- Routing library and version (React Router, Next.js, etc.)
- Navigation after CRUD operations
- History management patterns
- List refresh mechanisms

**Output**: Navigation approach with examples.

### 4. State Management
Identify state management approach:
- Local state vs. global state patterns
- Context usage
- State libraries (Redux, Zustand, etc.)
- Cache invalidation patterns

**Output**: State management summary.

### 5. UI/UX Patterns
Find existing UI/component library usage:
- Component library (Material-UI, Ant Design, custom, etc.)
- Modal/dialog components
- Button variants and styling
- Consistent naming conventions

**Output**: UI component inventory with import paths.

### 6. Test Patterns
Identify testing approach and patterns:
- Test framework and libraries (Jest, React Testing Library, Vitest, etc.)
- Test file naming conventions (`.test.ts`, `.spec.tsx`, `__tests__/`, etc.)
- Common test patterns for components with user interactions
- Mock patterns for API calls
- Test utilities and helpers
- Coverage expectations

**Output**: Testing approach summary with example test patterns.

## Discovery Output Format

All findings must be documented in: `<feature-folder>/discovery-findings.md`

### Required Structure

```markdown
# Discovery Findings - [Feature Name]

**Date**: [Date]
**Analyzed by**: Codebase Analyzer Subagent

## Summary
[2-3 sentence overview of key findings]

## 1. Similar Components Found
[List components with paths and descriptions]

## 2. API Integration Pattern
[Describe the pattern with code example]

## 3. Navigation Pattern
[Describe how navigation works with example]

## 4. State Management Approach
[Describe state handling with example]

## 5. UI Components to Reuse
[List reusable components with import paths]

## 6. Test Patterns
[Describe testing approach, frameworks, and patterns with examples]

## 7. Code Examples
[Include 2-3 relevant code snippets from existing codebase]

## 8. Recommendations
[List 3-5 specific recommendations for implementation]
```

## Success Criteria

Discovery is complete when:
- ✅ All 6 scope areas are analyzed (including test patterns)
- ✅ Findings document is created in feature folder
- ✅ At least 2-3 concrete code examples are provided
- ✅ Test patterns and examples are documented
- ✅ Specific implementation recommendations are included
- ✅ Human has reviewed and approved findings
