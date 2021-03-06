$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type rb_random from radiobutton within w_main
end type
type rb_right from radiobutton within w_main
end type
type rb_left from radiobutton within w_main
end type
type rb_bottom from radiobutton within w_main
end type
type st_4 from statictext within w_main
end type
type rb_top from radiobutton within w_main
end type
type cb_6 from commandbutton within w_main
end type
type cb_5 from commandbutton within w_main
end type
type cb_4 from commandbutton within w_main
end type
type cb_3 from commandbutton within w_main
end type
type st_3 from statictext within w_main
end type
type st_2 from statictext within w_main
end type
type cb_browser from commandbutton within w_main
end type
type st_1 from statictext within w_main
end type
type cb_1 from commandbutton within w_main
end type
type sle_time from singlelineedit within w_main
end type
type sle_speed from singlelineedit within w_main
end type
type sle_pic from singlelineedit within w_main
end type
type uo_slideshow from uo_photoslideshow within w_main
end type
end forward

global type w_main from window
integer width = 2313
integer height = 1712
boolean titlebar = true
string title = "Photo Slideshow"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
rb_random rb_random
rb_right rb_right
rb_left rb_left
rb_bottom rb_bottom
st_4 st_4
rb_top rb_top
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
st_3 st_3
st_2 st_2
cb_browser cb_browser
st_1 st_1
cb_1 cb_1
sle_time sle_time
sle_speed sle_speed
sle_pic sle_pic
uo_slideshow uo_slideshow
end type
global w_main w_main

type prototypes
Subroutine Sleep(Long lMilliSec) Library "Kernel32.dll"
end prototypes

type variables
boolean ib_exit, ib_waitexit, ib_stop
end variables
on w_main.create
this.rb_random=create rb_random
this.rb_right=create rb_right
this.rb_left=create rb_left
this.rb_bottom=create rb_bottom
this.st_4=create st_4
this.rb_top=create rb_top
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.st_3=create st_3
this.st_2=create st_2
this.cb_browser=create cb_browser
this.st_1=create st_1
this.cb_1=create cb_1
this.sle_time=create sle_time
this.sle_speed=create sle_speed
this.sle_pic=create sle_pic
this.uo_slideshow=create uo_slideshow
this.Control[]={this.rb_random,&
this.rb_right,&
this.rb_left,&
this.rb_bottom,&
this.st_4,&
this.rb_top,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.st_3,&
this.st_2,&
this.cb_browser,&
this.st_1,&
this.cb_1,&
this.sle_time,&
this.sle_speed,&
this.sle_pic,&
this.uo_slideshow}
end on

on w_main.destroy
destroy(this.rb_random)
destroy(this.rb_right)
destroy(this.rb_left)
destroy(this.rb_bottom)
destroy(this.st_4)
destroy(this.rb_top)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cb_browser)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.sle_time)
destroy(this.sle_speed)
destroy(this.sle_pic)
destroy(this.uo_slideshow)
end on

event timer;Timer(0)
ib_exit = True
If rb_top.Checked Then
	uo_slideshow.of_slideshowtop( )
ElseIf rb_bottom.Checked Then
	uo_slideshow.of_slideshowbottom()
ElseIf rb_left.Checked Then
	uo_slideshow.of_slideshowleft()
ElseIf rb_right.Checked Then
	uo_slideshow.of_slideshowright( )
ElseIf rb_random.Checked Then
	
	Randomize ( 0 )
	Choose Case Rand ( 4 )
		Case 1
			uo_slideshow.of_slideshowtop( )
		Case 2
			uo_slideshow.of_slideshowbottom()
		Case 3
			uo_slideshow.of_slideshowleft()
		Case 4
			uo_slideshow.of_slideshowright( )
	End Choose
End If

ib_exit = False
If ib_waitexit Then
	Close(This)
Else
	If Not ib_stop Then
		Timer(Integer(sle_time.Text))
	End If
End If




end event

event closequery;
If ib_exit Then 
	ib_waitexit = True
	Return 1
End If
end event

event open;uo_slideshow.of_addphoto( "car.bmp")
uo_slideshow.of_addphoto( "car2.bmp")
uo_slideshow.of_addphoto( "pmit.bmp")
end event

type rb_random from radiobutton within w_main
integer x = 1317
integer y = 1472
integer width = 334
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Random"
end type

type rb_right from radiobutton within w_main
integer x = 1061
integer y = 1472
integer width = 229
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Right"
end type

type rb_left from radiobutton within w_main
integer x = 841
integer y = 1472
integer width = 229
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Left"
end type

type rb_bottom from radiobutton within w_main
integer x = 512
integer y = 1472
integer width = 302
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Bottom"
end type

type st_4 from statictext within w_main
integer x = 37
integer y = 1472
integer width = 197
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Type:"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_top from radiobutton within w_main
integer x = 256
integer y = 1472
integer width = 256
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Top"
boolean checked = true
end type

type cb_6 from commandbutton within w_main
integer x = 1975
integer y = 1212
integer width = 197
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "clear"
end type

event clicked;uo_slideshow.of_clearphoto( )
end event

type cb_5 from commandbutton within w_main
integer x = 1975
integer y = 1340
integer width = 197
integer height = 96
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Stop"
end type

event clicked;ib_stop = True
Timer(0)
end event

type cb_4 from commandbutton within w_main
integer x = 1755
integer y = 1340
integer width = 197
integer height = 96
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Start"
end type

event clicked;ib_stop = False
Timer(Integer(sle_time.Text))

end event

type cb_3 from commandbutton within w_main
integer x = 658
integer y = 1340
integer width = 206
integer height = 96
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Speed"
end type

event clicked;uo_slideshow.of_setspeed( long(sle_speed.text))
end event

type st_3 from statictext within w_main
integer x = 1134
integer y = 1344
integer width = 233
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Time:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_main
integer x = 37
integer y = 1344
integer width = 197
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Speed:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_browser from commandbutton within w_main
integer x = 1609
integer y = 1212
integer width = 123
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;String docname, named
Integer Value

Value = GetFileOpenName("Select Image File", + docname, named, "Image", "BMP Files (*.bmp),*.bmp")
If Value = 1 Then
	sle_pic.Text = docname
End If


end event

type st_1 from statictext within w_main
integer x = 37
integer y = 1216
integer width = 197
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Photo:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_main
integer x = 1755
integer y = 1212
integer width = 197
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ADD"
end type

event clicked;If Len(sle_pic.Text) = 0 Then Return
uo_slideshow.of_addphoto( sle_pic.Text)
MessageBox("Warning","Success")

end event

type sle_time from singlelineedit within w_main
integer x = 1390
integer y = 1344
integer width = 329
integer height = 84
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "5"
borderstyle borderstyle = stylelowered!
end type

type sle_speed from singlelineedit within w_main
integer x = 256
integer y = 1344
integer width = 402
integer height = 84
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "25"
borderstyle borderstyle = stylelowered!
end type

type sle_pic from singlelineedit within w_main
integer x = 256
integer y = 1216
integer width = 1353
integer height = 84
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type uo_slideshow from uo_photoslideshow within w_main
integer x = 73
integer y = 64
integer width = 2126
integer height = 1068
integer taborder = 10
end type

on uo_slideshow.destroy
call uo_photoslideshow::destroy
end on

