// This tests whether we accept fixits from warnings without filtering.
// The particular diagnostics used are not important.

// RUN: rm -rf %t.out && mkdir -p %t.out
// RUN: %swift -parse -target %target-triple %s -fixit-all -emit-fixits-path %t.remap
// RUN: env TMPDIR=%t.out c-arcmt-test %t.remap | arcmt-test -verify-transformed-files %s.result

func ftest1() {
  let myvar = 0
}

func foo() -> Int {
  do {
  } catch var err {
    goo(err)
  }
}
func goo(_ e: Error) {
	
}

@warn_unused_result(message="test message")
func warn_unused_result_removal() -> Int { return 5 }
