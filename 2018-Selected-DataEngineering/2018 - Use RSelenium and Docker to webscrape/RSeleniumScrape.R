##Install package and import
#install.packages("RSelenium")
library(RSelenium)

#Training yourself, uncomment below
#vignette("basics", package = "RSelenium")

## Basic Approach -- Standalone Script
#Starting the server - run the startup.sh on your mac as admin 
#browser <- remoteDriver(port = 5555)

#browser$open()
#browser$navigate("https://eecweb.eec.state.ma.us/childcaresearch/morethan300.aspx?lat=null%20&long=null&r=null&programtype=ALL%20CARE&zip=undefined&city=undefined")
#elem <- browser$findElement(using = 'css selector', 'body > object')
#for(c in 1:24){
#  elem$clickElement()
#  Sys.sleep(2)
#}

######## Advanced approach - Docker  #######
# Run the startupdocker.sh script, be sure the server is running
# Remember to chmod +x startupdocker.sh at the Terminal 
#
############################################

#Load Selenium 
library(RSelenium)
remDr <- remoteDriver(port=4445L) #Connect to Selenium at port 4445 - see startupdocker.sh for info

#Open the webpage
remDr$open()

#Check status of the webpage (AKA is it down?)
remDr$getStatus() #Note we're using headless (no GUI) firefox


#Open the page
remDr$navigate("https://eecweb.eec.state.ma.us/childcaresearch/morethan300.aspx?lat=null%20&long=null&r=null&programtype=ALL%20CARE&zip=undefined&city=undefined")
#Check that we got the page 
remDr$getCurrentUrl()

pages <- 1:423  #We know we have 423 unique pages to scrape

#Find all links
links <- remDr$findElements(using = "tag name" ,"a")
text <- sapply(links, function(x){x$getElementAttribute('href')})


for (i in length(links)) {
  print(links$getAttribute("href"))
}
#Find all the show text values on the first page 
elem <- remDr$findElements(using = "link text", "Show Detail")
for(i in 1:length(elem)){
  #print(i)
  element <- elem[i]
  html <- element$getElementAttribute("outerHTML") 
}


elem[2]

for(i in 1:length(pages)){
  elem <- remDr$findElements(using = "link text", "Show Detail")
  elem$highlightElement()
  remDr$screenshot(display = TRUE)
  Sys.sleep(2)
  
}


## Save out the data for page 1

#elemtxt <- elem$getElementAttribute("href") # gets us the HTML

#Loop using rvest
remDr$executeScript("javascript:__doPostBack('GridView1','Page$2')")
  elem <- remDr$findElements(using = "link text", "Show Detail")

remDr$screenshot(display = TRUE)
  