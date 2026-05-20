* Modernized convenience copy for paper-2002-06.
* Changes relative to code/original/Highway5.do: normalized line endings and the input path below.
* Original code and data are preserved under code/original and data/original.

* from time series data (1988)
* state year highway gsp totpub pvtcap area roway tcapo tmant
* highway - highway capital
* gsp - gross state product
* totpub - total public capital (incl. highways)
* pvtcap - total private capital
* area - area in square miles
* roway - right of way capital outlay
* tcapo - total capital outlay
* tmant - total maintenance
* from highway statistics 1993
* u - urban, r - rural, i - interstate, l - local, t - total, f -freeway
* cap - capital, mnt - maintenance
* mil - miles , gt4  greater than 4 lanes, le4 less than or equal to four
* lane miles in lane miles
* passveh - % passenger vehiles
* trusing - % single truck
* trucomb - % combination truck
* vmt - vehicle miles traveled (annual, millions)
* alaska newyork californ southeast midwest northeast - dummies
* stadmh - state administered highways
* ladmrd - locally administered roads
* fedroad - federally administered roads
* pgsal93 - state government salaries
* pbitcon - price bituminous concrete
* prestl - price reinforcing steel
* pststl - price structural steel
* pstcon - price structural concrete
* pop90 - 1990 population (thsd)
* area - area in sq. miles
* popdens = pop90*1000/area
* bondrate = rating of moodys 1994, p307 1995 stat abstract of us
*"al" 1988 8905.74 53547 20204.46 66008.17 52423 41714000 4.70e+08 3.42e+08 125348 77005 202353 7008 87510 94518 29484 238395 267879 7412 55938 63350 154832 315400 470232 14420 143448 157868 602 72226 72828 297 21 19063 19381 92209 43 254 0 602 56

*data list file c:\highways\highway5.txt free / state (a4) year
*   highway gsp totpub pvtcap area roway tcapo tmant
*   capui   capul   caput   mntui  mntul   mntut
*   capri   caprl   caprt   mntri  mntrl   mntrt
*   capti   captl   captt   mntti  mnttl   mnttt
*   milri   milrl   milrt   milui   miluf   milul  milut miltt
*   umilgt4    umille4   rmilgt4  rmille4
*   rpassveh rtrusing   rtrucom  upassveh  utrusing   utrucomb
*   alaska  newyork     californ   southeas   midwest  northeas
*   vmtri   vmtrl   vmtrt  vmtui   vmtuf   vmtul   vmtut
*   cstadmh   cladmrd   cfedroad   ctal
*   mstadmh   mladmrd   mredroad   mtal
*   adm_misc    law_safe   interest   bondret
*   tdisb
*   pgsal93 pgsal94 pbcon93 pexcav93 prestl93 pststl93
*   pstcon93 pop90 sqmiles popdens bondrate (a4)
 
*save outfile=c:\highways\highway5.x
clear
use "../../data/original/Highway5.dta", clear

generate irate = 0.07
 
replace irate = 0.0555 if  bondrate == "X" 
replace irate = 0.0475 if  bondrate == "AAA"
replace irate = 0.0495 if  bondrate == "AA1"
replace irate = 0.0515 if  bondrate == "AA" 
replace irate = 0.0535 if  bondrate == "A1"
replace irate = 0.0555 if  bondrate == "A"
replace irate = 0.0575 if  bondrate == "BBA1"  
replace irate = 0.0595 if  bondrate == "BBB"  


* interest rate, assume = bondrate

* means variables=irate by x
 
generate totcap=capri+caprl+capui+capul
generate milrlsq = milrl * milrl
generate milrisq = milri * milri
 
* highinf = inflator 1988 to 1993 (assume 20%)
 
generate highinf = 1.2 * highway
generate capnew = 1000*highinf*irate
generate totexp = capnew+mntri+mntrl+mntui+mntul+adm_misc+law_safe

 
generate lnvmtri=ln(vmtri)
generate lnvmtrl=ln(vmtrl)
generate lnvmtui=ln(vmtui+vmtuf)
generate lnvmtul=ln(vmtul)
generate lnmilri=ln(milri)
generate lnmilrl=ln(milrl)
generate lnmilui=ln(milui+miluf)
generate lnmilul=ln(milul)
 
generate vmttot=vmtri+vmtrl+vmtui+vmtul+vmtuf
generate miletot=milri+milrl+milui+milul+miluf
 
generate vcri = (vmtri/milri)
generate vcrl = (vmtrl/milrl)
generate vcui = ((vmtui+vmtuf)/(milui+miluf))
generate vcul = (vmtul/milul)
 
generate lnvcri = ln(vmtri/milri)
generate lnvcrl = ln(vmtrl/milrl)
generate lnvcui = ln((vmtui+vmtuf)/(milui+miluf))
generate lnvcul = ln(vmtul/milul)
 
generate lnrtruc=ln((rtrucom/100)*(vmtri+vmtrl))
generate lnutruc=ln((utrucomb/100)*(vmtui+vmtuf+vmtul))
generate rtruc=((rtrucom/100)*(vmtri+vmtrl))
generate ortruc=1/((rtrucom/100)*(vmtri+vmtrl))
generate rtruc2=((rtrucom/100)*(vmtri+vmtrl))^2
 
generate utruc=((utrucomb/100)*(vmtui+vmtuf+vmtul))
generate outruc=1/((utrucomb/100)*(vmtui+vmtuf+vmtul))
generate utruc2=((utrucomb/100)*(vmtui+vmtuf+vmtul))^2
generate rtrusing=rtusing
generate rtrus=((rtrusing/100)*(vmtri+vmtrl))
generate ortrus=1/((rtrusing/100)*(vmtri+vmtrl))
generate rtrus2=((rtrusing/100)*(vmtri+vmtrl))^2
 
generate utrus=((utrusing/100)*(vmtui+vmtuf+vmtul))
generate outrus=((utrusing/100)*(vmtui+vmtuf+vmtul))
generate utrus2=((utrusing/100)*(vmtui+vmtuf+vmtul))^2
 
generate rcar=((rpassveh/100)*(vmtri+vmtrl))
generate orcar=((rpassveh/100)*(vmtri+vmtrl))
generate rcar2=((rpassveh/100)*(vmtri+vmtrl))^2
 
generate ucar=((upassveh/100)*(vmtui+vmtuf+vmtul))
generate oucar=((upassveh/100)*(vmtui+vmtuf+vmtul))
generate ucar2=((upassveh/100)*(vmtui+vmtuf+vmtul))^2
 
generate lnrmgt4=ln(rmilgt4)
generate lnrmle4=ln(rmille4)
generate lnumgt4=ln(umilgt4)
generate lnumle4=ln(umille4)
generate lnmigt4=ln(rmilgt4+umilgt4)
generate lnmile4=ln(rmille4+umille4)
generate miles = milri+milrl+milui+miluf+milul
generate traffic= utruc+rtruc+utrus+rtrus+ucar+rcar
generate purbmil= (milui+miluf+milul)/(milri+milrl+milui+miluf+milul)
generate umiles=milui+miluf+milul
generate rmiles=milri+milrl
generate mill=milrl+milul
generate lnmill =ln(mill)
generate mili4=umille4+rmille4
generate mili5=umilgt4+rmilgt4
generate lnmili4=ln(mili4)
generate lnmili5=ln(mili5)
generate pfwy=(milui+miluf+milri)/(umiles+rmiles)
generate lnpfwy=ln(pfwy)
generate uwidth=(umille4*3+umilgt4*6)/(umille4+umilgt4)
generate rwidth=(rmille4*3+rmilgt4*6)/(rmille4+rmilgt4)
generate width=((umille4+rmille4)*4+milul*3+milrl*2+(rmilgt4+umilgt4)*7)/(umille4+umilgt4+rmilgt4+rmille4+milul+milrl)
   
generate lnuwidth=ln(uwidth)
generate lnrwidth=ln(rwidth)
generate purbtraf= (utruc+utrus+ucar)/(utruc+rtruc+utrus+rtrus+ucar+rcar)
generate urbtraf= (utruc+utrus+ucar)
generate rurtraf= (rtruc+rtrus+rcar)
 
generate ptruck= 1-(ucar+rcar)/(utruc+rtruc+utrus+rtrus+ucar+rcar)
generate truck= utruc+rtruc+utrus+rtrus
generate urbtruck=utruc+utrus
generate rurtruck=rtruc+rtrus
generate miles2=miles*miles
generate traffic2=traffic*traffic
 
generate rvc=(rurtraf*1000000/(365*24))/(rmille4*4*2000+rmilgt4*8*2000)
generate uvc=(urbtraf*1000000/(365*24))/(umille4*4*2000+rmilgt4*8*2000)
 

generate auto=ucar+rcar
generate comb=utruc+rtruc
generate sing=utrus+rtrus
generate lnumiles=ln(umiles)
generate lnrmiles=ln(rmiles)

generate lnauto=ln(auto)
generate lncomb=ln(comb)
generate lnsing=ln(sing)
generate lnpurbm=ln(purbmil)
generate lnmiles=ln(miles)
 
generate x=1
 
*means variables= pgsal93 pgsal94 pbcon93 pexcav93 prestl93 pststl93
*   pstcon93 popdens by x
 
* meansgenerated for 41 cases passing selects
 
generate mgsal93=26441
generate mgsal94=27117
generate mbcon93=25.9261
generate mexcav93=3.0039
generate mrestl93=0.5074
generate mststl93=0.8809
generate mstcon93=266.311
generate mpopdens=142.64
 


generate pexcav=pexcav93/mexcav93
generate psurf=pbcon93/mbcon93
generate pstruc=pststl93/mststl93+pstcon93/mstcon93+prestl93/mrestl93
generate pdens=popdens/mpopdens
generate plabor=pgsal93/mgsal93
generate pconst=pexcav+psurf+pstruc
 

generate lnpexcav=ln(pexcav)
generate lnpsurf=ln(psurf)
generate lnplabor=ln(plabor)
generate lnpstruc=ln(pstruc)
generate lnpdens=ln(pdens)
generate lnpconst=ln(pconst)
 
generate pkap = capnew/miles
generate lnpkap=ln(pkap)
generate lnirate=ln(irate)
generate lnwidth=ln(width)
generate pgt4=(rmilgt4+umilgt4)/(rmilgt4+rmille4+umilgt4+umille4)
generate lnpgt4=ln(pgt4)
generate mpsqm=miles/area
generate lnmpsqm=ln(mpsqm)
generate varexp=totexp-capnew
generate lnvarexp=ln(varexp)
generate lntotexp=ln(totexp)
 
generate h=(auto*auto+sing*sing+comb*comb)/((auto+sing+comb)*(auto+sing+comb))
generate lnh=ln(h)
 
generate vmt=auto+comb+sing
generate lnvmt=ln(vmt)
 
generate iaa=lnauto*lnauto
generate iac=lnauto*lncomb
generate ias=lnauto*lnsing
generate ial=lnauto*lnplabor
generate iau=lnauto*lnpsurf
generate iai=lnauto*lnirate
generate iam=lnauto*lnmiles
 
generate icc=lncomb*lncomb
generate ics=lncomb*lnsing
generate icl=lncomb*lnplabor
generate icu=lncomb*lnpsurf
generate ici=lncomb*lnirate
generate icm=lncomb*lnmiles
 
generate iss=lnsing*lnsing
generate isl=lnsing*lnplabor
generate isu=lnsing*lnpsurf
generate isi=lnsing*lnirate
generate ism=lnsing*lnmiles
 
generate ill=lnplabor*lnplabor
generate ilu=lnplabor*lnpsurf
generate ili=lnplabor*lnirate
generate ilm=lnplabor*lnmiles
 
generate iuu=lnpsurf*lnpsurf
generate iui=lnpsurf*lnirate
generate ium=lnpsurf*lnmiles
 
generate iii=lnirate*lnirate
generate iim=lnirate*lnmiles
 
generate imm=lnmiles*lnmiles
 


regress lntotexp lnauto lncomb lnsing lnplabor lnpsurf lnirate  if adm_misc > 0 & law_safe > 0 & highway > 0 & mntri > 0 & mntrl > 0 & mntui > 0 & mntul > 0 & auto > 0 & comb > 0 & sing > 0 & totexp > 0  & plabor > 0 & psurf > 0
 
regress lntotexp lnauto lncomb lnsing lnplabor lnpsurf lnirate iaa iac ias iau iai iam icc ics icu ici icm iss isu isi ism iuu iui ium iii iim imm if adm_misc > 0 & law_safe > 0 & highway > 0 & mntri > 0 & mntrl > 0 & mntui > 0 & mntul > 0 & auto > 0 & comb > 0 & sing > 0 & totexp > 0  & plabor > 0 & psurf > 0
 
