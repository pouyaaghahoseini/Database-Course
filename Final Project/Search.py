keyword="wikicat_Iranian_Majlis_Representatives"
LabelsFile = open("D:\\AUT\\Term 4\\DB\\Yago\\yagoLabels.tsv","r",encoding='utf-8')
TypesFile =open("D:\\AUT\\Term 4\\DB\\Yago\\yagoTypes.tsv","r",encoding='utf-8')
FactsFile =open("D:\\AUT\\Term 4\\DB\\Yago\\yagoFacts.tsv","r",encoding='utf-8')
polititians = open('C:\\Users\\Pouya\\PycharmProjects\\YagoDB\\Iranian Polititian And Types',"r",encoding='utf-8')
Everything= open('D:\\AUT\\Term 4\\DB\\Yago\\Answer\\Everything.tsv',"r",encoding='utf-8')
Subjects = set()
for line in TypesFile:
    if (keyword in line and "Iran" in line):
        print(line)
for line in FactsFile:
    if (keyword in line):
        print(line)

for line in Everything:
    splited = line.split()
    next(Everything)
    Subjects.add(splited[1])
print(Subjects.__len__())

fas = open('D:\\AUT\\Term 4\\DB\\Yago\\Answer\\fas.tsv',"r",encoding='utf-8')
havefas=0
for line in fas:
    for S in Subjects:
        if S in line:
            print(line)
            havefas+=1
            Subjects.remove(S)
            break

print(havefas)
print(Subjects.__len__())


facts=open('D:\\AUT\\Term 4\\DB\\Yago\\Answer\\Facts.tsv',"r",encoding='utf-8')
for line in facts:
    splited=line.split()
    Subjects.add(splited[1])

Allpolititians = open('D:\\AUT\\Term 4\\DB\\Yago\\Answer\\AllPolititians.tsv',"w+",encoding='utf-8')

for S in Subjects:
    print(S)
    Allpolititians.writelines(S+"\n")
print(Subjects.__len__())
Allpolititians.close()

Allpolititians = open('D:\\AUT\\Term 4\\DB\\Yago\\Answer\\AllPolititians.tsv',"r",encoding='utf-8')
Labels= open('D:\\AUT\\Term 4\\DB\\Yago\\yagoLabels.tsv','r',encoding='utf-8')

EveryPolitianShit = open('D:\\AUT\\Term 4\\DB\\Yago\\Answer\\Everything.tsv',"w+",encoding='utf-8')

for F in FactsFile:
    for S in Subjects:
        if S in F:
            EveryPolitianShit.writelines(F+"\n")

for T in TypesFile:
    for S in Subjects:
        if S in T:
            EveryPolitianShit.writelines(T+"\n")

#Create FAS
fas = open('D:\\AUT\\Term 4\\DB\\Yago\\Answer\\fas.tsv',"w+",encoding='utf-8')
for line in LabelsFile:
    if "@fas" in line:
        print(line)
        fas.writelines(line)
