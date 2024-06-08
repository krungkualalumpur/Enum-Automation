import json
import sys
import pandas

input_file = sys.argv[1]
output_file = sys.argv[2]

with open(output_file, 'w') as outputFile:
    outputFile.write("--This is an auto generated script, please do not modify this!\n")
    outputFile.write("--!strict")
    outputFile.write("\n--services")
    outputFile.write("\n--packages")
    outputFile.write("\n--modules")
    outputFile.write("\n--types")

    outputFile.write("\nexport type CustomEnum <N> = {\n\tName : N,\n\tGetEnumItems : (self : CustomEnum<N>) -> {[number] : CustomEnumItem<CustomEnum<N>, string>}\n}\n")
    #outputFile.write("\nexport type CustomEnumItem <E, N> = {\n\tName : N,\n\tValue : number,\n\tEnumType : E\n}\n")
    outputFile.write("\nexport type CustomEnumItem <E, N> = {\n\tName : string,\n\tValue : number,\n\tEnumType : E\n}\n")

    with open(input_file, 'r') as inputFile:
        content = inputFile.read()
        tupleFromJSON = json.loads(content)
        for k in tupleFromJSON:
            content = tupleFromJSON[k]
            outputFile.write("type " + k + "Enum = " + 'CustomEnum<"' + k + '">\n')
            outputFile.write("export type " + k + ' = CustomEnumItem<' + k + 'Enum, string>\n\n')
            #for val in content:
                #outputFile.write("\n\t" + val + " : {")
                #outputFile.write("\n\t\t" + 'Name : "' + val + '",')
                #outputFile.write("\n\t\t" + 'Value : number,')    
                #outputFile.write("\n\t\t" + 'EnumType : "' + str(k) + '",')    
                #outputFile.write("\n\t},")
                #num = int(num) + 1
           # outputFile.write("\n}\n")
           # outputFile.write("export type " + k + " = CustomEnumItem<" + k + "Enum ,N>\n")
        outputFile.write('export type CustomEnums = {')
        for k in tupleFromJSON:
            content = tupleFromJSON[k]
            num = 1
            outputFile.write('\n\n\t' + k + ' : \t{\t\t')
            for val in content:
                outputFile.write("\n\t\t" + val + ' : CustomEnumItem <' + k + 'Enum, "' + val+'"' + ">,")
            outputFile.write('\n\t} & ' + k + 'Enum,') 
        outputFile.write('\n\n}') 
        #outputFile.write('\n}')
            

    outputFile.write("\n--constants")
    outputFile.write("\n--remotes")
    outputFile.write("\n--local function\n\n")

    with open(input_file, 'r') as inputFile:
        content = inputFile.read()  
        tupleFromJSON = json.loads(content) 
        for k in tupleFromJSON: 

            num = 1 
            content = tupleFromJSON[k] 
            outputFile.write("\nlocal " + k + " = " + "{")
            outputFile.write("\n\t" + 'Name = "' + k + '" :: any,')
            outputFile.write("\n\t" + 'GetEnumItems = function(self)')  
            outputFile.write('\n\t\tlocal t = {}\n\t\tfor _,v in pairs(self) do\n\t\t\tif type(v) == "table" then \n\t\t\t\t table.insert(t, v)  \n\t\t\tend\n\t\tend')  
            outputFile.write('\n\t\treturn t\n\tend,')  
            
            outputFile.write('\n}\n')
            #print(k, content)
            for val in content:
                outputFile.write("\n" + k + "." + val + " = {")
                outputFile.write("\n\t" + 'Name = "' + val + '" :: any,')
                outputFile.write("\n\t" + 'Value = ' + str(num) + ',')    
                outputFile.write("\n\t" + 'EnumType = ' + k)
                outputFile.write("\n}\n")
                num = int(num) + 1

    outputFile.write("\nlocal CustomEnum = {\t")
    with open(input_file, 'r') as inputFile:
        content = inputFile.read()  
        tupleFromJSON = json.loads(content) 
        for k in tupleFromJSON: 
            num = 1 
            content = tupleFromJSON[k] 
            outputFile.write('\n\t' + k + ' = ' + k + ' :: any,')


    outputFile.write("\n} :: CustomEnums")

    outputFile.write("\n\nreturn CustomEnum")
    
#print(text.split(","))
#output = str(input("input a str: "))
#print(output)
