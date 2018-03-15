file = open('ip_address_bridge.txt', 'r')
str = file.read()
str_ipadd = str.split(" ")[5]
print str_ipadd.split("/")[0]
f = open('lxd', 'w')
f.write("server=/lxd/" + str_ipadd.split("/")[0])
f.close

