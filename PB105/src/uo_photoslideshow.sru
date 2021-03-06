$PBExportHeader$uo_photoslideshow.sru
forward
global type uo_photoslideshow from userobject
end type
type p_2 from picture within uo_photoslideshow
end type
type p_1 from picture within uo_photoslideshow
end type
end forward

global type uo_photoslideshow from userobject
integer width = 1906
integer height = 1004
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
event timer pbm_timer
p_2 p_2
p_1 p_1
end type
global uo_photoslideshow uo_photoslideshow

type prototypes
Subroutine Sleep(Long lMilliSec) Library "Kernel32.dll"



end prototypes

type variables
String is_pic[]
Boolean ib_flagtop
Int ii_pic
Long il_speed

end variables

forward prototypes
public subroutine of_addphoto (string as_photo)
public subroutine of_clearphoto ()
public subroutine of_setspeed (long al_speed)
public subroutine of_slideshowtop ()
public subroutine of_slideshowright ()
public subroutine of_slideshowleft ()
public subroutine of_slideshowbottom ()
end prototypes

public subroutine of_addphoto (string as_photo);//====================================================================
// Function: uo_photoslideshow.of_addphoto()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	string	as_photo	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/06/15
//--------------------------------------------------------------------
// Usage: uo_photoslideshow.of_addphoto ( string as_photo )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

If Not IsNull(as_photo) And Len(Trim(as_photo)) > 0 Then
	is_pic[UpperBound(is_pic) + 1] = as_photo
End If

end subroutine

public subroutine of_clearphoto ();//====================================================================
// Function: uo_photoslideshow.of_clearphoto()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/06/15
//--------------------------------------------------------------------
// Usage: uo_photoslideshow.of_clearphoto ( )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String ls_temp[]

is_pic = ls_temp

end subroutine

public subroutine of_setspeed (long al_speed);//====================================================================
// Function: uo_photoslideshow.of_setspeed()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	long	al_speed	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/06/15
//--------------------------------------------------------------------
// Usage: uo_photoslideshow.of_setspeed ( long al_speed )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

If al_speed > width then  il_speed = width
If al_speed < 1 Then il_speed = 1
il_speed = al_speed
end subroutine

public subroutine of_slideshowtop ();//====================================================================
// Function: uo_photoslideshow.of_slideshowtop()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/06/15
//--------------------------------------------------------------------
// Usage: uo_photoslideshow.of_slideshowtop ( )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long ll_y, ll_ypic
Boolean lb_flag

If UpperBound(is_pic) <= 0 Then Return
ii_pic += 1
If ii_pic > UpperBound(is_pic) Then ii_pic = 1

ll_ypic = 0 - height - 5
If ib_flagtop Then
	p_1.Move(1 , ll_ypic)
	p_1.PictureName = is_pic[ii_pic]
	p_1.BringToTop = True
	p_2.BringToTop = False
	//Yield()
	For ll_y = ll_ypic  To 1
		//Yield()
		p_1.Draw( 1 , ll_y)
		//Yield()
		If lb_flag Then Exit
		sleep(1)
		ll_y = ll_y + il_speed
		If ll_y > 1 Then
			lb_flag = True
			ll_y = 1
		End If
	Next
	//Yield()
	ib_flagtop = False
Else
	p_2.Move( 1 ,ll_ypic)
	p_2.PictureName = is_pic[ii_pic]
	p_1.BringToTop = False
	p_2.BringToTop = True
	//Yield()
	For ll_y = ll_ypic  To 0
		//Yield()
		p_2.Draw( 1 , ll_y)
		//Yield()
		If lb_flag Then Exit
		sleep(1)
		ll_y = ll_y + il_speed
		If ll_y > 1 Then
			lb_flag = True
			ll_y = 1
		End If
	Next
	//Yield()
	ib_flagtop = True
End If




end subroutine

public subroutine of_slideshowright ();//====================================================================
// Function: uo_photoslideshow.of_slideshowright()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/06/15
//--------------------------------------------------------------------
// Usage: uo_photoslideshow.of_slideshowright ( )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long ll_x
Boolean lb_flag

If UpperBound(is_pic) <= 0 Then Return
ii_pic += 1
If ii_pic > UpperBound(is_pic) Then ii_pic = 1

If ib_flagtop Then
	p_1.Move( Width + 10 , 1)
	p_1.PictureName = is_pic[ii_pic]
	p_1.BringToTop = True
	p_2.BringToTop = False
	//Yield()
	For ll_x = Width + 20  To 0 Step  -1
		Yield()
		p_1.Draw( ll_x , 1)
		//Yield()
		If lb_flag Then Exit
		sleep(1)
		ll_x = ll_x - il_speed
		If ll_x < 1 Then
			lb_flag = True
			ll_x = 1
		End If
	Next
	//Yield()
	ib_flagtop = False
Else
	p_2.Move( Width + 10 , 1)
	p_2.PictureName = is_pic[ii_pic]
	p_1.BringToTop = False
	p_2.BringToTop = True
	//Yield()
	For ll_x = Width + 10  To 0 Step -1
		//Yield()
		p_2.Draw( ll_x , 1)
		//Yield()
		If lb_flag Then Exit
		sleep(1)
		ll_x = ll_x - il_speed
		If ll_x < 1 Then
			lb_flag = True
			ll_x = 1
		End If
	Next
	//Yield()
	ib_flagtop = True
End If




end subroutine

public subroutine of_slideshowleft ();
//====================================================================
// Function: uo_photoslideshow.of_slideshowleft()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/06/15
//--------------------------------------------------------------------
// Usage: uo_photoslideshow.of_slideshowleft ( )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long ll_x, ll_xpic
Boolean lb_flag

If UpperBound(is_pic) <= 0 Then Return
ii_pic += 1
If ii_pic > UpperBound(is_pic) Then ii_pic = 1

ll_xpic = 0 - Width - 5
If ib_flagtop Then
	p_1.Move( ll_xpic , 1)
	p_1.PictureName = is_pic[ii_pic]
	p_1.BringToTop = True
	p_2.BringToTop = False
	//Yield()
	For ll_x = ll_xpic  To 1
		//Yield()
		p_1.Draw( ll_x , 1)
		//Yield()
		If lb_flag Then Exit
		sleep(1)
		ll_x = ll_x + il_speed
		If ll_x > 1 Then
			lb_flag = True
			ll_x = 1
		End If
	Next
	//Yield()
	ib_flagtop = False
Else
	p_2.Move( ll_xpic , 1)
	p_2.PictureName = is_pic[ii_pic]
	p_1.BringToTop = False
	p_2.BringToTop = True
	//Yield()
	For ll_x = ll_xpic  To 1
		//Yield()
		p_2.Draw( ll_x , 1)
		//Yield()
		If lb_flag Then Exit
		sleep(1)
		ll_x = ll_x + il_speed
		If ll_x > 1 Then
			lb_flag = True
			ll_x = 1
		End If
	Next
	//Yield()
	ib_flagtop = True
End If




end subroutine

public subroutine of_slideshowbottom ();//====================================================================
// Function: uo_photoslideshow.of_slideshowbottom()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/06/15
//--------------------------------------------------------------------
// Usage: uo_photoslideshow.of_slideshowbottom ( )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long ll_y, ll_ypic
Boolean lb_flag

If UpperBound(is_pic) <= 0 Then Return
ii_pic += 1
If ii_pic > UpperBound(is_pic) Then ii_pic = 1

ll_ypic = height + 5
If ib_flagtop Then
	p_1.Move(1 , ll_ypic)
	p_1.PictureName = is_pic[ii_pic]
	p_1.BringToTop = True
	p_2.BringToTop = False
	//Yield()
	For ll_y = ll_ypic  To 0 step -1
		//Yield()
		p_1.Draw( 1 , ll_y)
		//Yield()
		If lb_flag Then Exit
		sleep(1)
		ll_y = ll_y - il_speed
		If ll_y < 1 Then
			lb_flag = True
			ll_y = 1
		End If
	Next
	//Yield()
	ib_flagtop = False
Else
	p_2.Move( 1 ,ll_ypic)
	p_2.PictureName = is_pic[ii_pic]
	p_1.BringToTop = False
	p_2.BringToTop = True
	//Yield()
	For ll_y = ll_ypic  To 0 step -1
		//Yield()
		p_2.Draw( 1 , ll_y)
		//Yield()
		If lb_flag Then Exit
		sleep(1)
		ll_y = ll_y - il_speed
		If ll_y < 1 Then
			lb_flag = True
			ll_y = 1
		End If
	Next
	//Yield()
	ib_flagtop = True
End If




end subroutine

on uo_photoslideshow.create
this.p_2=create p_2
this.p_1=create p_1
this.Control[]={this.p_2,&
this.p_1}
end on

on uo_photoslideshow.destroy
destroy(this.p_2)
destroy(this.p_1)
end on

event constructor;p_1.move(1,1)
p_2.move(1,1)

p_1.resize( width,height)
p_2.resize( width,height)

p_1.bringtotop = True
p_2.bringtotop = False

il_speed = 10
end event

type p_2 from picture within uo_photoslideshow
integer x = 110
integer y = 64
integer width = 1829
integer height = 1044
string picturename = "background.bmp"
boolean focusrectangle = false
end type

type p_1 from picture within uo_photoslideshow
integer width = 1920
integer height = 1012
string picturename = "background.bmp"
boolean focusrectangle = false
end type

