SUBROUTINE closest(point,VB,normals,clost)

IMPLICIT NONE
	!integer ::
	real*8 :: point(1,1:3),clost(1,1:3),VB(3,3),normals(3,3),B1(1,1:3),e0(1,1:3),e1(1,1:3),dv(1,1:3),a,b,c,d,e,f,det,s,t,numer,denom
 
 B1(1,1:3) = VB(1,1:3)
 dv(1,1:3) = point(1,1:3)-B1(1,1:3)
 e0(1,1:3) = VB(2,1:3)-VB(1,1:3)
 e1(1,1:3) = VB(3,1:3)-VB(1,1:3)
	!data ntmp(1,1:3) / 0,0,0 /
 a = dot_product(e0(1,1:3),e0(1,1:3))
 b = dot_product(e0(1,1:3),e1(1,1:3))
 c = dot_product(e1(1,1:3),e1(1,1:3))
 d = dot_product(e0(1,1:3),dv(1,1:3))
 e = dot_product(e1(1,1:3),dv(1,1:3))
 f = dot_product(dv(1,1:3),dv(1,1:3))

 det = a*c - b*b
 s = b*2
 t=b*d - a*e
 det = 1/det
 s = s*det
 t= t*det
 numer = c+d-b-d
 if (numer <=0) then
    s = 0
 else
    denom = a -2 * b +c
    s = (numer/denom)
    
 end if
 t = 1-s
 

 clost(1,1:3) = B1(1,1:3)+ s*e0(1,1:3) + t*e1(1,1:3)
 
 !c = matmul(transpose(e1),e1)
 !do i = 1,N

END SUBROUTINE closest