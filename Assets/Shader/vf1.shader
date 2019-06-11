Shader "Sbin/vf1" {
  SubShader {
    pass{   
    CGPROGRAM
	#pragma vertex vert
  #pragma fragment frag
    //自定义函数
   #include "sbin.cginc"
   
   void vert(in float2 objPos:POSITION,out float4 pos:POSITION,out float4 col:COLOR)
   {
    pos=float4(objPos,0,1);
    col=pos;
   }
 
    void frag(inout float4 col:COLOR)
    {
	    Func(col);
      //维度必须相同传递 没有维度不行 
      float arr[2]={0.5,0.5};
      //我的Func2挂掉了 说我的GPU不支持明暗编辑器 把上面自动生成的提示删了就好了
      col.x= Func2(arr);
    }

	
    ENDCG
  }
}
  
}