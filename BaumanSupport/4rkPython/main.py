f = open('in.txt')
f1 = open('in1.txt')
f2 = open('out.txt','w')

#1

line = 0;line1 = 0;
line = f.readline()
line1 = f1.readline()
while(True):
    if line1=='':
        f2.write(line.replace("\n","")+"\n")
        for line in f:
            f2.write(line.replace("\n","")+"\n")
        break
    elif line == '':
        f2.write(line1.replace("\n","")+"\n")
        for line1 in f:
            f2.write(line1.replace("\n","")+"\n")
        break
    if line<=line1:
        f2.write(line.replace("\n","")+"\n")
        line = f.readline()
    else:
        f2.write(line1.replace("\n","")+"\n")
        line1=f1.readline()
f.close()
f1.close()
f2.close()

#2
import roman
f2 = open('out.txt','r')
f3 = open('out1.txt','w')
for line in f2:
    f3.write('{:^30}'.format(roman.toRoman(int(line)))+"\n")
f3.close()
f2.close()