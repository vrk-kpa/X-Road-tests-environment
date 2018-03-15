with open("/var/lib/tomcat8/conf/server.xml") as f:
	newText=f.read().replace('8080', '8081')

with open("/var/lib/tomcat8/conf/server.xml", "w") as f:
	f.write(newText)
