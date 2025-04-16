// src/lib/utils.test.ts
// src/lib/utils.ts
export function dummyFunction(input: string): string {
    return input
}





describe('utils', () => {
  describe('dummyFunction', () => {
    it('should return the input string', () => {
      const input = 'test';
      const result = dummyFunction(input);
      expect(result).toBe(input);
    });
  });
});
```
```typescript
//src/lib/utils.ts
export function dummyFunction(input: string): string {
    return input
}