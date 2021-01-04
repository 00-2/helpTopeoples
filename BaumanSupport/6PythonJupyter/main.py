import pandas as pd


arr = []
dForCodeTH={}
for i in range(1,11):
    d = {};
    if i<10:
        i='0'+str(i)
    fileName = '{}_2019.xls'.format(i)
    df = pd.read_excel(fileName)
    for j in range(len(df)):
        dForCodeTH[df.iloc[j]['Наименование товара']]=df.iloc[j]['Код  ТН ВЭД ЕАЭС']
        tmpD = {'ctd':df.iloc[j]['млн.долл.США'], 'volume':df.iloc[j]['тыс.тонн']}
        d[df.iloc[j]['Наименование товара']] = tmpD
    arr.append(d)
d = {};dM={};
i = 0
for tmpD in arr:
    i+=1
    dM[i] = {'ctd':0, 'volume':0}
    for key in tmpD:
        for key1 in tmpD[key]:
            d[key] = {'ctd':0, 'volume':0, 'maxMonth':0, 'maxVolume':0}
i = 0
totalVolume = 0
totalCtd = 0
arrOftotals = {}
for tmpD in arr:
    i+=1
    for key in tmpD:
        for key1 in tmpD[key]:
            if tmpD[key][key1] != '-' and  pd.notna(tmpD[key][key1]):
                d[key][key1] += tmpD[key][key1]
                if key1 in ['volume','ctd']:
                    dM[i][key1] += tmpD[key][key1]
                    if key1 == 'volume':
                        totalVolume +=tmpD[key][key1]
                    else:
                        totalCtd+=tmpD[key][key1]
                    if key1=='volume' and d[key]['maxVolume']<tmpD[key][key1]:
                        d[key]['maxVolume']=tmpD[key][key1]
                        d[key]['maxMonth'] = i
    arrOftotals[i]={}; arrOftotals[i]={'totalVolume':totalVolume, 'totalCtd':totalCtd};totalVolume=0;totalCtd=0;
dResult = {'Код  ТН ВЭД ЕАЭС':{},
'Наименование товара':{},
'тыс.тонн':{},
'млн.долл.США':{},
'Макс объем/номер месяца':{},
}


i = 0;
for key in d:
    i+=1
    dResult['Наименование товара'][i] = key
    dResult['тыс.тонн'][i] = d[key]['volume']
    dResult['млн.долл.США'][i] = d[key]['ctd']
    dResult['Код  ТН ВЭД ЕАЭС'][i] = dForCodeTH[key]
    dResult['Макс объем/номер месяца'][i] = "V:{}/N:{}".format(int(d[key]['maxVolume']),d[key]['maxMonth'])
df = pd.DataFrame(dResult)
df.to_excel("custom_all.xlsx")
df['тыс.тонн'].hist()
df['млн.долл.США'].hist()

"""
print(d)
print(dM)
print(totalCtd)
print(totalVolume)"""