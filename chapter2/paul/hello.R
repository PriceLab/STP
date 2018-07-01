cat("Hello World\n")
print("Hello World")
print(noquote("Hello World"))

greeting <- "Hello"
object <- "World"

cat(paste(greeting, object, "\n"))
cat(paste(greeting, object, "\n", sep=""))
cat(paste0(greeting, object, "\n"))

print(sprintf("%s %s", greeting, object))
print(noquote(sprintf("%s %s", greeting, object)))

printf <- function(...){
   print(noquote(sprintf(...)))
   }

printf("%s %s", "hello", "convenience function!")




