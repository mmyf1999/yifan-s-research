**论文代码
//因变量
//  ln申请绿色总量 ln申请差额  研发人员rate sumfine比总资产e3
//自变量
 // sumfine比总资产e3  sumfine比总资产原始
//控制变量
  global control  Size Lev Cashflow 企业成长性_w 历史绩效  市场势力517  资本密集度 管理层持股 PC   ListAge

  //描述性统计
  //logout,save(基本统计描述)word replace:tabstat  ln申请绿色总量 ln申请差额  研发人员rate sumfine比总资产e3 $control ,s(N p10 mean p90 sd ) f(%12.3f) c(s)
 
 sumfine原始_w比总资产e3 
 
 reg F.E得分增加 $control  i.year i.indid i.pid sumfine比总资产e3,cluster(id)
 reg ln总减技术环境转型1000比word_count $control  i.year i.indid i.pid sumfine比总资产e3,cluster(id)
 reg F.总减技术比word_count $control  i.year i.indid i.pid sumfine比总资产e3,cluster(id)
 
 
 **机制
 reg sum新闻除100 $control  i.year i.indid i.pid sumfine比总资产e3 ,cluster(id)
 est sto m1
 reg ln申请绿色总量 $control  i.year i.indid i.pid sum新闻除100 ,cluster(id)
 est sto m2
 reg 研发人员rate $control  i.year i.indid i.pid sumfine比总资产e3 ,cluster(id)
 est sto m3
 reg ln申请绿色总量 $control  i.year i.indid i.pid 研发人员rate ,cluster(id)
 est sto m4
 
  reg F.E得分增加 $control  i.year i.indid i.pid sumfine比总资产e3,cluster(id)
   est sto m5
  
 esttab  m5 using  "D:\2025course\1论文myf\stata输出\机制检验1.rtf",b(%12.3f) se(%12.3f)  r2 nogap compress   star(* 0.1 ** 0.05 *** 0.01) replace
 
 
 reg sum新闻除100 $control  i.year i.indid i.pid 受罚次数 ,cluster(id)
 est sto m5
 reg 研发人员rate $control  i.year i.indid i.pid 受罚次数,cluster(id)
 est sto m6
 esttab  m5 m6  using  "D:\2025course\1论文myf\stata输出\受罚次数机制检验.rtf",b(%12.3f) se(%12.3f)  r2 nogap compress   star(* 0.1 ** 0.05 *** 0.01) replace
 
 
 
本省当年 bysort pid year:egen 本省受罚次数= sum(受罚次数)
bysort pid year:egen 本省最大受罚次数= max(受罚次数)
bysort pid year indid :egen 本省本行最大受罚强度= max(sumfine比总资产e3)
bysort pid year indid :egen 本省本行最大罚款金额= max(sumfine)
bysort pid year indid :egen 本省本行平均罚款金额= mean(sumfine)
 
//基准回归*************
reg ln申请绿色总量   sumfine比总资产e3 if( Size!=. & Lev!=. & Cashflow!=. & 企业成长性!=. & 历史绩效!=. &  市场势力!=. &  资本密集度!=. & 管理层持股!=. & PC!=. &   ListAge!=. ),cluster(id)

reg ln申请绿色总量  $control sumfine比总资产e3 ,cluster(id)
est sto m1
reg ln申请绿色总量  $control i.year  i.pid sumfine比总资产e3,cluster(id)
est sto m2
reg ln申请绿色总量 $control  i.year i.indid i.pid sumfine比总资产e3,cluster(id)
est sto m3
reg F.ln申请绿色总量  $control sumfine比总资产e3 ,cluster(id) 
est sto m4
reg F.ln申请绿色总量  $control i.year  i.pid sumfine比总资产e3 ,cluster(id)
est sto m5
reg F.ln申请绿色总量  $control i.year i.indid i.pid sumfine比总资产e3,cluster(id)
est sto m6
esttab  m1 m2 m3 m4 m5 m6 using  "D:\2025course\1论文myf\stata输出\基准回归.rtf",b(%12.3f) se(%12.3f)  r2 nogap compress   star(* 0.1 ** 0.05 *** 0.01) 

probit 绿色创新dum2  Lev Cashflow 企业成长性_w 历史绩效  市场势力517  资本密集度 管理层持股 PC   ListAge  i.year i.indid i.pid 处罚加强 ,cluster(id)  //+**

***重污染与非重污染的异质性
reg ln申请绿色总量 $control  i.year i.indid i.pid sumfine比总资产e3,cluster(id)
est sto m3
reg ln申请绿色总量 $control  i.year i.indid i.pid sumfine比总资产e3 if(重污染==0),cluster(id) 
est sto m7
reg ln申请绿色总量 $control  i.year i.indid i.pid sumfine比总资产e3 if(重污染==1),cluster(id) 
est sto m8
esttab m3 m7 m8 using  "D:\2025course\1论文myf\stata输出\基准回归异质性分析.rtf",b(%12.3f) se(%12.3f)  r2 nogap compress   star(* 0.1 ** 0.05 *** 0.01) 

****1130版本机制
 reg ln申请绿色总量  $control i.year i.indid i.pid  sumfine比总资产e3 cover coverxsumfine比总资产e3,cluster(id)  //-**  用均值
est sto m25  
reg ln申请绿色总量  $control i.year i.indid i.pid  sumfine比总资产e3 分析师关注01均 分析师关注01均xsumfine比总资产e3 ,cluster(id)   //用均值为** 
est sto m26
reg ln申请绿色总量  $control i.year i.indid i.pid  sumfine比总资产e3 分析师关注01均 分析师关注01均xsumfine比总资产e3 ,cluster(id) 
reg ln申请绿色总量  $control i.year i.indid i.pid  sumfine比总资产e3 esg增加 esg增加xsumfine比总资产e3 ,cluster(id) 
est sto m101
esttab  m101  using  "D:\2025course\1论文myf\stata输出\内部管理.rtf",b(%12.3f) se(%12.3f)  r2 nogap compress   star(* 0.1 ** 0.05 *** 0.01) 

//KZ指数   FC指数可做融资约束
//声誉评级降低。
reg 社会责任得分增长 $control  i.year i.indid i.pid sumfine比总资产e3,cluster(id) //-***
reg greenrate  $control i.year i.indid i.pid 受罚次数 ,cluster(id) //-* 这可能是可以思考的点。重罚还是多次

reghdfe ln绿色申请 before* policy after*  周边污染  人均GDP GDP 第三产业占地区生产总值的比重_全市 金融从业人口比 ln外资 进出口总额比GDP , absorb(year 城市) vce(cluster 城市) 


tobit ln申请绿色总量 $control  i.year i.indid i.pid lnsumfine比总资产e3, ll(0)

xtreg 申请绿色总量 Size Lev Cashflow 企业成长性 历史绩效  市场势力  资本密集度 管理层持股 PC   ListAge   sumfine比总资产e3   i.year, fe  //-**

. xtreg  申请绿色专利总数_w Size Lev  Cashflow 企业成长性 历史绩效  市场势力  资本密集度 管理层持股 PC   ListAge   sumfine比总资产e3_w  i.year, fe

reg F.ln申请绿色总量 $control  i.year i.indid i.pid 本省最大受罚次数 if(sumfine==0),cluster(id) //-**

reg ln总减技术环境转型1000比word_count $control  i.year i.indid i.pid sumfine比总资产e3,cluster(id) //+*,psm***

//溢出效应
 bysort year pid:egen 本省最大受罚次数=max( 受罚次数 )
. bysort year pid:egen 本省最大受罚金额=max( sumfine )
. bysort year pid:egen 本省最大受罚强度=max( sumfine比总资产e3 )
. bysort year pid:egen 本省平均受罚强度=mean( sumfine比总资产e3 )
. bysort year pid indid:egen 本省本行最大受罚次数=max( 受罚次数 )
. bysort year pid indid :egen 本省本行最大受罚金额=max( sumfine )
. bysort year pid indid:egen 本省本行最大受罚强度=max( sumfine比总资产e3 )
. bysort year pid indid :egen 本省本行平均受罚强度=mean( sumfine比总资产e3 )

reg ln申请绿色总量 $control  i.year i.indid i.pid L.本省最大受罚次数 if(sumfine==0),cluster(id)
est sto m61
reg ln申请绿色总量 $control  i.year i.indid i.pid L.本省最大受罚金额 if(sumfine==0),cluster(id)
est sto m62
reg ln申请绿色总量 $control  i.year i.indid i.pid L.本省最大受罚强度 if(sumfine==0),cluster(id)
est sto m63
reg ln申请绿色总量 $control  i.year i.indid i.pid L.本省平均受罚强度 if(sumfine==0),cluster(id)  //**
est sto m64
reg ln申请绿色总量 $control  i.year i.indid i.pid L.本省本行最大受罚次数 if(sumfine==0),cluster(id)  //*
est sto m65
reg ln申请绿色总量 $control  i.year i.indid i.pid L.本省本行最大受罚金额 if(sumfine==0),cluster(id)  //***
est sto m66
reg ln申请绿色总量 $control  i.year i.indid i.pid L.本省本行平均受罚强度 if(sumfine==0),cluster(id)  //***
est sto m67
reg ln申请绿色总量 $control  i.year i.indid i.pid L.本省本行最大受罚强度 if(sumfine==0),cluster(id)  //***
est sto m68

esttab   m64 m65  m66 m67 m68 using  "D:\2025course\1论文myf\stata输出\外溢效应.rtf",b(%12.3f) se(%12.3f)  r2 nogap compress   star(* 0.1 ** 0.05 *** 0.01) 


reg ln申请绿色总量 $control  i.year i.indid i.pid L.本省本行最大受罚次数 if(sumfine==0),cluster(id) //+*
reg ln申请绿色总量 $control  i.year i.indid i.pid L.本省本行最大受罚强度 if(sumfine==0),cluster(id)  //+*
reg ln申请绿色总量 $control  i.year i.indid i.pid L.本省本行最大罚款金额 if(sumfine==0),cluster(id)  //+***
reg ln申请绿色总量 $control  i.year i.indid i.pid L.本省本行平均罚款金额 if(sumfine==0),cluster(id)  //+***
reg ln申请绿色总量 $control  i.year i.indid i.pid L.本省本行平均受罚强度 if(sumfine==0),cluster(id)  //+***

reg ln申请绿色总量 $control  i.year i.indid i.pid L.本省平均受罚次数 if(sumfine==0),cluster(id)
est sto m61
reg ln申请绿色总量 $control  i.year i.indid i.pid L.本省平均受罚强度 if(sumfine==0),cluster(id)
est sto m62
reg ln申请绿色总量 $control  i.year i.indid i.pid L.本省本行平均受罚次数 if(sumfine==0),cluster(id)
est sto m63
reg ln申请绿色总量 $control  i.year i.indid i.pid L.本省本行平均受罚强度 if(sumfine==0),cluster(id)
est sto m64
esttab   m61 m62  m63 m64  using  "D:\2025course\1论文myf\stata输出\同伴效应.rtf",b(%12.3f) se(%12.3f)  r2 nogap compress   star(* 0.1 ** 0.05 *** 0.01) 

//营业成本
reg 营业成本1比总资产增长 $control  i.year i.indid i.pid sumfine比总资产e3 ,cluster(id) 
est sto m81
reg 营业成本1比总资产增长 $control  i.year i.indid i.pid sumfine比总资产e3 if(国企==1),cluster(id) 
est sto m82
reg 营业成本1比总资产增长 $control  i.year i.indid i.pid sumfine比总资产e3 if(国企==0),cluster(id) 
est sto m83
esttab   m81 m82 m83  using  "D:\2025course\1论文myf\stata输出\成本.rtf",b(%12.3f) se(%12.3f)  r2 nogap compress   star(* 0.1 ** 0.05 *** 0.01) 

reg 营业成本1比总资产增长 Size Lev Cashflow 企业成长性_w 历史绩效 市场势力517  资本密集度 管理层持股 PC   ListAge  i.year i.indid i.pid sumfine比总资产e3  if(国企==1),cluster(id)


//机制分析**********************
 **引导效应
 reg 研发人员rate $control   i.year  i.pid i.indid sumfine比总资产e3,cluster(id)  //+***
  est sto m10
 reg 研发人员rate $control   i.year  i.pid i.indid sumfine比总资产e3 if(重污染==0),cluster(id) //*
  est sto m11
 reg 研发人员rate $control   i.year  i.pid i.indid sumfine比总资产e3 if(重污染==1),cluster(id) //**
 est sto m12
 reg  F.研发人员rate $control  i.indid i.year i.pid  sumfine比总资产e3  ,cluster(id)  //**
  est sto m13
 reg  F.研发人员rate $control  i.indid i.year i.pid  sumfine比总资产e3  if(重污染==0),cluster(id)
 est sto m14
 reg  F.研发人员rate $control  i.indid i.year i.pid  sumfine比总资产e3  if(重污染==1),cluster(id)
 est sto m15
  esttab  m10 m11 m12 m13 m14 m15 using  "D:\2025course\1论文myf\stata输出\引导效应.rtf",b(%12.3f) se(%12.3f)  r2 nogap compress   star(* 0.1 ** 0.05 *** 0.01) 
  
 reg ln研发支出占总资产 $control  i.year i.indid i.pid sumfine比总资产e3,cluster(id) //*  重污染**
   est sto m71
 reg ln研发支出占总资产 $control  i.year i.indid i.pid sumfine比总资产e3 if(重污染==0),cluster(id)
    est sto m72
 reg ln研发支出占总资产 $control  i.year i.indid i.pid sumfine比总资产e3 if(重污染==1),cluster(id)
  est sto m73
   reg F.ln研发支出占总资产 $control  i.year i.indid i.pid sumfine比总资产e3,cluster(id) //*  重污染**
   est sto m74
 reg F.ln研发支出占总资产 $control  i.year i.indid i.pid sumfine比总资产e3 if(重污染==0),cluster(id)
    est sto m75
 reg F.ln研发支出占总资产 $control  i.year i.indid i.pid sumfine比总资产e3 if(重污染==1),cluster(id)
     est sto m76
	 esttab  m71 m72 m73 m74 m75 m76  using  "D:\2025course\1论文myf\stata输出\引导效应2.rtf",b(%12.3f) se(%12.3f)  r2 nogap compress   star(* 0.1 ** 0.05 *** 0.01)  

reg 研发支出万 $control  i.year i.indid i.pid sumfine比总资产e3 ,cluster(id)  //+*
reg 研发人员数量 $control  i.year i.indid i.pid sumfine比总资产e3 ,cluster(id)	 //+**

  **进一步研究*******************************
  //强弱引导效应
reg ln申请差额 $control   i.year  i.pid i.indid sumfine比总资产e3,cluster(id)  //+**
  est sto m16
// reg ln申请差额 $control   i.year  i.pid i.indid sumfine比总资产e3 if(重污染==0),cluster(id)  //不显著
//  est sto m17
// reg ln申请差额 $control   i.year  i.pid i.indid sumfine比总资产e3 if(重污染==1),cluster(id)  //不显著
// est sto m18
 reg  F.ln申请差额 $control  i.indid i.year i.pid  sumfine比总资产e3  ,cluster(id)  //**
  est sto m19
 //reg  F.ln申请差额 $control  i.indid i.year i.pid  sumfine比总资产e3  if(重污染==0),cluster(id) //不显著
// est sto m20
// reg  F.ln申请差额 $control  i.indid i.year i.pid  sumfine比总资产e3  if(重污染==1),cluster(id)  //不显著
// est sto m21
  esttab  m16  m19  using  "D:\2025course\1论文myf\stata输出\强弱引导效应.rtf",b(%12.3f) se(%12.3f)  r2 nogap compress   star(* 0.1 ** 0.05 *** 0.01) 
  

reg sum新闻  $control  i.year i.indid i.pid sumfine比总资产e3,cluster(id)

//环境社会治理：esg
 reg ln申请绿色总量  $control i.year i.indid i.pid sumfine比总资产e3 esg增加 esg增加xsumfine比总资产e3 ,cluster(id)  //+*

//调节效应
//政府环保补助
reg ln申请绿色总量  $control i.year i.indid i.pid sumfine比总资产e3 环保补助比总资产01 环保补助比总资产0132xsumfine比总资产e3 ,cluster(id)
est sto m22
reg ln申请绿色总量  $control i.year i.indid i.pid sumfine比总资产e3 环保补助比总资产01 环保补助比总资产0132xsumfine比总资产e3 if(重污染==0),cluster(id)
est sto m23
reg ln申请绿色总量  $control i.year i.indid i.pid sumfine比总资产e3 环保补助比总资产01 环保补助比总资产0132xsumfine比总资产e3 if(重污染==1),cluster(id)
est sto m24
  esttab  m22  m23 m24  using  "D:\2025course\1论文myf\stata输出\补助调节效应.rtf",b(%12.3f) se(%12.3f)  r2 nogap compress   star(* 0.1 ** 0.05 *** 0.01) 

 //媒体关注 
 reg ln申请绿色总量  $control i.year i.indid i.pid  sumfine比总资产e3 cover coverxsumfine比总资产e3,cluster(id)  //-**  用均值
est sto m25  
reg ln申请绿色总量  $control i.year i.indid i.pid  sumfine比总资产e3 分析师关注01均 分析师关注01均xsumfine比总资产e3 ,cluster(id)   //用均值为** 
est sto m26
esttab  m25  m26  using  "D:\2025course\1论文myf\stata输出\媒体关注调节效应.rtf",b(%12.3f) se(%12.3f)  r2 nogap compress   star(* 0.1 ** 0.05 *** 0.01) 



 
  //异质性分析 ln申请绿色发明 ln申请绿色实用 ln申请发明专利 ln申请实用专利 
reg ln申请绿色发明  $control i.year i.indid i.pid sumfine比总资产e3 ,cluster(id) 
est sto m27
reg ln申请绿色发明  $control i.year i.indid i.pid sumfine比总资产e3 if(重污染==0),cluster(id) 
est sto m28
reg ln申请绿色发明  $control i.year i.indid i.pid sumfine比总资产e3 if(重污染==1),cluster(id) 
est sto m29
reg ln申请绿色实用  $control i.year i.indid i.pid sumfine比总资产e3 ,cluster(id) 
est sto m30
reg ln申请绿色实用  $control i.year i.indid i.pid sumfine比总资产e3 if(重污染==0),cluster(id) 
est sto m31
reg ln申请绿色实用  $control i.year i.indid i.pid sumfine比总资产e3 if(重污染==1),cluster(id) 
est sto m32
esttab  m27  m28 m29 m30 m31 m32  using  "D:\2025course\1论文myf\stata输出\申请绿色异质性.rtf",b(%12.3f) se(%12.3f)  r2 nogap compress   star(* 0.1 ** 0.05 *** 0.01) 

reg ln申请发明差额  $control i.year i.indid i.pid sumfine比总资产e3 ,cluster(id) 
est sto m33
reg ln申请发明差额  $control i.year i.indid i.pid sumfine比总资产e3 if(重污染==0),cluster(id) 
est sto m34
reg ln申请发明差额  $control i.year i.indid i.pid sumfine比总资产e3 if(重污染==1),cluster(id) 
est sto m35
reg ln申请实用差额  $control i.year i.indid i.pid sumfine比总资产e3 ,cluster(id) 
est sto m36
reg ln申请实用差额  $control i.year i.indid i.pid sumfine比总资产e3 if(重污染==0),cluster(id) 
est sto m37
reg ln申请实用差额 $control i.year i.indid i.pid sumfine比总资产e3 if(重污染==1),cluster(id) 
est sto m38
esttab  m33  m34 m35 m36 m37 m38  using  "D:\2025course\1论文myf\处理好的数据\申请专利差额异质性.rtf",b(%12.3f) se(%12.3f)  r2 nogap compress   star(* 0.1 ** 0.05 *** 0.01) 

*****稳健性检验
 //2 更改指标 获得专利数量

reg greenrate  $control i.year i.indid i.pid sumfine比总资产e3,cluster(id)
est sto m40  //比例1
reg greenrateget  $control i.year i.indid i.pid sumfine比总资产e3,cluster(id)
est sto m41  //比例2
reg ln获得绿色总量 $control i.year i.indid i.pid sumfine比总资产e3,cluster(id)
est sto m42

reg ln申请绿色总量 $control i.year i.indid i.pid sumfine比营业收入e3,cluster(id)
est sto m43
reg ln申请绿色总量 $control i.year i.indid i.pid 受罚次数,cluster(id)
est sto m44
reg ln申请绿色总量 $control i.year i.indid i.pid 处罚加强,cluster(id)
est sto m45
esttab   m40 m41 m42 m43 m44 m45 using  "D:\2025course\1论文myf\处理好的数据\稳健性改指标.rtf",b(%12.3f) se(%12.3f)  r2 nogap compress   star(* 0.1 ** 0.05 *** 0.01)  replace

reg ln申请绿色总量 sumfine比总资产e3 $control i.year i.indid i.pid if(pid!=9 & pid!=1 & pid!=2 & pid!=22),cluster(id)  //剔除直辖市
est sto m44

reg ln申请绿色总量 sumfine比总资产e3 $control i.year i.indid i.pid,cluster(id)
est sto m3

//企业战略问题  简直完美，促进了防御型企业的绿色创新，而对于进攻型企业的促进作用不明显。


reg ln申请绿色总量 $control  i.indid i.year i.pid  sumfine比总资产e3 if( quan企业战略指数==1 ), cluster(id) //+**
est sto m44
reg ln申请绿色总量 $control  i.indid i.year i.pid  sumfine比总资产e3 if( quan企业战略指数==2 ), cluster(id) //+*
est sto m45
reg ln申请绿色总量 $control  i.indid i.year i.pid  sumfine比总资产e3 if( quan企业战略指数==3 ), cluster(id)
est sto m46
//绿色高管问题
reg ln申请绿色总量 $control  i.indid i.year i.pid  sumfine比总资产e3 if( 绿色高管==0), cluster(id)
est sto m47
reg ln申请绿色总量 $control  i.indid i.year i.pid  sumfine比总资产e3 if( 绿色高管==1 ), cluster(id)
est sto m48
esttab  m44 m45 m46 m47 m48  using  "D:\2025course\1论文myf\stata输出\稳健性绿色高管.rtf",b(%12.3f) se(%12.3f)  r2 nogap compress   star(* 0.1 ** 0.05 *** 0.01) 

reg ln申请绿色总量 $control  i.year i.indid i.pid sumfine比总资产e3 if(重污染==1),cluster(id)  //重污染样本
reg ln申请绿色总量 $control  i.year i.indid i.pid sumfine比总资产e3 if(indid>5 & indid<47),cluster(id)  //工业企业样本


绿色高管等于0的可以，大于0的调节效应，可能是样本太少了，不显著。

//工具变量
ivregress 2sls ln申请绿色总量 ( sumfine比总资产e3 = 受罚次数) $control i.year i.indid i.pid , robust first 
estat firststage
//
ivregress 2sls ln申请绿色总量 ( sumfine比总资产e3 = L.同年同行同地其他企业的均值比总资产e3 ) $control i.year i.indid i.pid,robust first   这个不可以，但没用稳健标准误。

reg sumfine比总资产e3 $control  i.indid i.pid SO2除e3,cluster(id)  //-***
test SO2除e3=0
predict xsumfine
reg ln申请绿色总量  $control  i.indid i.pid xsumfine ,cluster(id) //***


//** 
ivreg2  ln申请绿色总量 ( sumfine比总资产e3 = 受罚次数) $control i.year i.indid i.pid , robust first
heckman ln申请绿色总量   sumfine比总资产e3   $control i.year i.indid i.pid,  select(受罚01 =受罚次数  $control i.year i.indid i.pid) twostep

//改换模型
DiD
 reg ln申请绿色总量 处罚加强 $control i.year i.indid i.pid,cluster(id)
 reg F.ln申请绿色总量 处罚加强 $control i.year i.indid i.pid,cluster(id) 

 //信息披露问题
 reg   ln申请绿色总量  $control i.year i.indid i.pid sumfine比总资产e3去0 ,cluster(id)
 est sto m50
 reg F.ln申请绿色总量  $control i.year i.indid i.pid sumfine比总资产e3去0 ,cluster(id)
 est sto m51
 esttab  m50 m51 using  "D:\2025course\1论文myf\处理好的数据\去除观测值为0.rtf",b(%12.3f) se(%12.3f)  r2 nogap compress   star(* 0.1 ** 0.05 *** 0.01) 

 //样本选择问题
 heckman两步法
 heckman ln申请绿色总量   sumfine比总资产e3   $control i.year i.indid i.pid,  select(受罚01 =L.受罚次数  L.ln申请绿色总量 $control i.year i.indid i.pid) twostep 
 
   heckman ln申请绿色总量   sumfine比总资产e3   $control i.year i.indid i.pid,  select(受罚01 =L.受罚次数  L.同行同地其他企业的均值比总资产e3 $control i.year i.indid i.pid) twostep //**
heckman ln申请绿色总量   sumfine比总资产e3   $control i.year i.indid i.pid,  select(受罚01 =  L.同行同地其他企业的均值比总资产e3 $control i.year i.indid i.pid) twostep  //**


   heckman ln申请绿色总量   sumfine比总资产e3   $control i.year i.indid i.pid,  select(受罚01 =L.受罚次数  L.同年同行同地其他企业的均值比总资产e3去非罚 $control i.year i.indid i.pid) twostep //+***
    heckman ln申请绿色总量   sumfine比总资产e3   $control i.year i.indid i.pid,  select(受罚01 = L.同年同行同地其他企业的均值比总资产e3去非罚 $control i.year i.indid i.pid) twostep  //+***   这个是论文的

***竞争性政策

reg ln申请绿色总量  $control i.year i.indid i.pid 环境税 sumfine比总资产e3,cluster(id)
est sto m1
reg ln申请绿色总量  $control i.year i.indid i.pid 排污权交易2007开始 sumfine比总资产e3,cluster(id)
est sto m2
reg ln申请绿色总量  $control i.year i.indid i.pid 碳排放权2013开始 sumfine比总资产e3,cluster(id)
est sto m3
reg ln申请绿色总量  $control i.year i.indid i.pid  sumfine比总资产e3 if(环境税==0),cluster(id)
est sto m4
reg ln申请绿色总量  $control i.year i.indid i.pid  sumfine比总资产e3 if 排污权交易2007开始==0,cluster(id)
est sto m5
reg ln申请绿色总量  $control i.year i.indid i.pid  sumfine比总资产e3 if 碳排放权2013开始==0,cluster(id)
est sto m6
esttab  m1 m2 m3 m4 m5 m6 using  "D:\2025course\1论文myf\stata输出\排除竞争性假说回归.rtf",b(%12.3f) se(%12.3f)  r2 nogap compress   star(* 0.1 ** 0.05 *** 0.01) 



**PSM  显著
set seed 2023
gen ranorder=runiform()
sort ranorder

//psmatch2 受罚01 $control ,outcome(ln申请绿色总量) n(1) ate ties logit common //**

**k近邻匹配
psmatch2 受罚01 $control 重污染,outcome(ln申请绿色总量) n(5) ate ties logit common //***
pstest, both
psgraph

 
sum _pscore
dis 0.25*r(sd)

**卡尺内1对5
psmatch2 受罚01 $control 重污染,outcome(ln申请绿色总量) n(5) cal(0.02) ate ties logit common	//卡尺内一对5
 pstest, both
**半径匹配（卡尺匹配）
psmatch2 受罚01 $control 重污染,outcome(ln申请绿色总量) n(5) radius cal(0.02) ate ties logit common
 pstest, both	
**核匹配（使用默认的核函数与带宽）
psmatch2 受罚01 $control 重污染,outcome(ln申请绿色总量)  kernel ate ties logit common	
 pstest, both
**样条匹配
bootstrap r(att) r(atu) r(ate),reps(500): 
psmatch2 受罚01 $control 重污染,outcome(ln申请绿色总量) spline ate ties logit common
 pstest, both
	
//其他可考虑的回归 
reg AQI $control  i.year i.id 本省平均受罚强度 ,cluster(id) //***
 reg 研发投入比利润1  $control i.year i.indid i.pid  sumfine比总资产e3 if(国企==1),cluster(id)  //+**
 reg 研发投入比利润1  $control i.year i.indid i.pid  sumfine比总资产e3 if(重污染==1),cluster(id) //*
  reg 研发人员rate $control   i.year  i.pid i.indid sumfine比总资产e3,cluster(id)  //+***
  reg  F.研发人员rate $control  i.indid i.year i.pid  sumfine比总资产e3  ,cluster(id)  //**
  reg ln环保投资额 $control i.year i.indid i.pid  sumfine比总资产e3,cluster(id)  //***
   reg  营业成本增长 $control  i.indid i.year i.pid  sumfine比总资产e3 if(重污染==1),cluster(id) //**
   reg F.ln申请绿色总量_w  i.year i.indid i.pid Size_w Lev_w Cashflow_w 历史绩效_w 管理层持股_w PC_w 市场势力_w 企业成长性_w 资本密集度_w ListAge_w 国企_w sumfine比总资产e3去0_w补0,cluster(pid) //*