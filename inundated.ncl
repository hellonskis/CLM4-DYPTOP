load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
begin

f = addfile("/home1/02668/aresovsk/CESM_CHANGE/surfdat_new.nc","r"); pointer to file
t = f->MONTHLY_UND(0,{-90:90},{0:358})     ; read in data


;*******************************************
; create plot
;*******************************************

wks = gsn_open_wks("pdf","MONTHLY_UND_06-01.gulf_coast.pdf") ; open ce.ps file
; choose colormap
gsn_define_colormap(wks,"BlAqGrYeOrRe")
res = True ; resource varb
res@cnLevelSelectionMode = "ExplicitLevels" ; set explicit contour levels
;res@cnLevels = (/0.000,0.001,0.002,0.003,0.004,0.005,0.006,0.007,0.008,0.009,0.01,0.011,0.012,0.013,0.014,0.015,0.016,0.017,0.018,0.019,0.02,0.021,0.022,0.023,0.024,0.025,0.026,0.027,0.028/) ; set levels for specific humidity
;res@cnLevels = (/-40,-30,-20,-10,0,10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,210,220/) ; set levels for Wm-2
;res@cnLevels = (/-60,-50,-40,-30,-20,-10,0,10,20,30,40,50,60,70,80,90,100,110,120,130,140,150/) ; set levels for Wm-2
;res@cnLevels = (/-30,-25,-20,-15,-10,-5,0,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,105/) ; set levels for Wm-2
;res@cnLevels = (/260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300/) ; set levels for temp K winter
res@cnLevels = (/275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315/)-273 ; set levels for temp K to C summer
;res@cnLevels = (/260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310/)-273 ; set levels for temp K to C 
;res@gsnRightString = "~S~o~N~C" ; degrees C
res@cnFillOn = True ; turn on color
res@cnLinesOn = False ; no cn lines
res@cnLevelSpacingF = 0.1 ; cn spacing
res@gsnSpreadColors = True ; full colors
res@lbAutoLabelStride = True ; nice lb labels

res@mpMaxLatF = 35
res@mpMinLatF = 20
res@mpMaxLonF = 270
res@mpMinLonF = 250

gsnAddCyclic = False

plot = gsn_csm_contour_map(wks,t,res)
end



