## Reproduce 

From `./aik`
```
aiken check
```

Result
```
    ┍━ mre_fuzz_fail/x ━━━━━━━━━━
    │ FAIL [after ? test] special
    │ × fuzzer failed unexpectedly
    │ | Out of Bounds
    │
    │ index: 35
    │ bytestring: 0102040810204080
    │ possible: 0 - 7
    ┕ with --seed=94433522 → 1 tests | 0 passed | 1 failed

      Summary 0 checks, 1 error, 0 warnings
```
