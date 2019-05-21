load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl" 
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl" 
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
begin
  
  mm = getenv("ZWT_CH4_UNSAT")
  f_list = systemfunc("ls /work/02668/aresovsk/cesm1_2_1/scripts/cnt45bgc_spinupoff_2000/run/UNSET/lnd/hist/cnt45bgc_spinupoff_2000.clm2.h0.200*.nc")
  f  = addfiles(f_list,"r")   

  inun = f[:]->ZWT

; printVarSummary(inun)
  inund  = inun({time|:},{lat|29:30},{lon|270:271})
; print(inund)

; inund1 = dim_max_n_Wrap(inund,(/1,2/))
print(inund)
exit

;reg = (/\
;"Gulf Coast",\)
;nreg = dimsizes(reg)
;wesn = (/ \
;(/ 252.0, 281.0, 29.0, 33.0/)

;mask out ocean?

printVarSummary(ch4)
exit
;  month=(/"January","February","March","April","May","June","July","Aug","Sep","Oct","Nov","Dec","DJF","MAM","JJA","SON"/)

; g = addfile("fracdata_360x720_070122.nc","r")
; frac = tofloat(g->LANDFRAC)
;  mon = toint(mm)
;  ch4 = f->FCH4                
; sif = sif(::-1,:)
; lat = f->latitude(::-1)
; sif = where( frac.lt.0.8, sif@_FillValue, sif)
; zave = dim_avg(sif)             
;  res = True
;  res@tiMainString = month(mon-1)+"Monthly CH4 flux avg"
;  res@tiYAxisString = "CH4 flux in kgC/m2/s"
;  wks  = gsn_open_wks("ps","tmp")      
;  plot = gsn_xy(wks,lat,zave(:),res)

;wesn = (/ \ 
;(/ 252.0, 281.0, 29.0, 33.0/)
      
end
