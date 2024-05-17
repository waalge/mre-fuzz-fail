use aiken/list
use aiken/math
use aiken/fuzz

type A = Int
type B = Int
type C = List<Int>
type D = Int

pub type Scenario {
  a : A,
  b : B,
  c: C, 
  d: D,
}


const bil = 1_000_000_000

pub fn fuzz_borrow() -> Fuzzer<Pair<Int,Scenario>> {
  fuzz.list_between(fuzz.int_between(1 * bil, 50 * bil), 1, 10)
    |> fuzz.and_then(
        fn(vaults_in) {
          let total = vaults_in |> list.foldl(0, fn(x, y) { x + y })
          let max = vaults_in |> list.foldl(0, fn(x, y) { math.max(x, y) })
          fuzz.map4(
            fuzz.int(),
            fuzz.int(),
            fuzz.int(),
            fuzz.int_between(total - max, total),
            fn(x, a, b, c) { Pair(x, Scenario(a, b, vaults_in, c) )},
          )
        },
      )
}

test special(ss via fuzz_borrow()) {
  ss.2nd.d > 0 
}

