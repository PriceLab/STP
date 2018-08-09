library(jsonlite)
json <- '[{"data":{"id": "Aishah"}}]'

   # this writes just the text, but see below for
   # the form we actually need, producing a file
   # which can be directly consumed by your
   # html file
fromJSON(json)
write(json, "network.json")

full.text <- sprintf('graph=%s;', json)
write(full.text, "fullText.js")

