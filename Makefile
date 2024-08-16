.PHONY: build
build:
	javac -d bin -cp /ulib/antlr-4.13.2-complete.jar ./src/*.java ./src/AST/*.java ./src/AST/Cons/*.java ./src/AST/Expr/*.java ./src/AST/Stmt/*.java ./src/Frontend/*.java ./src/Parser/*.java ./src/util/*.java ./src/util/Decl/*.java ./src/util/error/*.java ./src/util/Scope/*.java ./src/util/Type/*.java

.PHONY: run
run:
	java -cp ./src:/ulib/antlr-4.13.2-complete.jar Main

.PHONY: testall
testall:
	time bash ./testcases/sema/scripts/test_all.bash "java -cp ./src:/ulib/antlr-4.13.2-complete.jar Main" ./testcases/sema