简单if判断
if(value > Tex.x)
{
  Tex.x = 0 ;
}
else
{
  Tex.x = 1 ;
}
return Tex;

value : 一维浮点变量。
Tex：一维浮点常量；输入noise贴图的某个通道。
作用举例：溶解效果。

--------------------------------------------------------------

UV偏移
float2 NewUV;
NewUV = UV.xy * Tilling.xy +(Offset.xy * Time.x * Speed.x) ;
return NewUV;

--------------------------------------------------------------