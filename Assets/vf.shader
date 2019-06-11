Shader "Sbin/vf" {
	SubShader{
		pass {
		//CG代码写到限定范围内
		CGPROGRAM		
			#include "UnityCG.cginc"
			//CG类似类的声明 都要小写不然不报错也不显示
				#pragma vertex vert  
				#pragma fragment frag
				//定义宏
				#define MACROFL FL4(fl4.ab,fl3.zy);
                typedef float4 FL4;//声明别名
			   //结构体  2018新版本不能为空
				struct v2f {
					  float4 pos:POSITION;
					  float2 uv:TEXCOORD0;
					  };
				//顶点    //变量 传入 2阶向量 //传出一个四阶 pos
			void vert(in float2 objPos:POSITION,out float4 pos : POSITION,out float4 col : COLOR)
			{
				  pos = float4(objPos,0,1);
				  col = pos;//也可以这样赋值 不过frag里的col赋值会覆盖这个
				  
			}
			//COLOR=COLOR0 片段着色器
			void frag(inout float4 col:COLOR)
			{
				//col = float4(0,1,0,1);

				fixed r = -0.5;
				fixed g = -0.5;
				fixed b = 0;
				fixed a = 0;
				//CG里的构造器 
				col = float4(r,g,b,a);

				bool bl = false;
				col = bl ? col : fixed4(0,1,0,1);//true是黑 false是绿

				//int 一般会被当作float使用
				//描述是几维向量
				float2 fl2 = float2(1,0);
				float3 fl3 = float3(1,0,1);
				float4 fl4 = float4(1,1,0,1);

				//Swizzle操作 
				//float4 fl=float4(fl2,0,1);//红色
				//float4 fl=float4(fl2.xy,0,1);//xyzw 或者 rgba按照一定顺序去取可以截取这个值
				//float4 fl=float4(fl4.wzyx);//紫色
				 //float4 fl=float4(fl4.ab,fl3.zy);//紫色
				  //宏的使用
				 FL4 fl = MACROFL //紫色
				 col = fl;

				 //CG的基本类型 根据不同精度定义的数据类型 CG不含有指针
				 //fixed1=fixed 描述的是9位整数被规格化到-1到1 就是2的8次方 256跟颜色的最大值对应
				 //fixed2=fixed(1,0);
				 //float可以变为float2 float3 float4 没有五阶
				 //half half2 half3 half4
				 //fixed fixed2 fixed3 fixed4
				  //2行4列的矩阵 通常用4x4不会报错但是会黄色警告
				 // float2x4 M2x4={1,0,0,1,0,1,0,1};//便于阅读也可以{(1,0,0,1),(0,1,0,1)}
					float4x4 M2x4 = {1,0,0,1,0,1,0,1,0,0,0,0,0,0,0,0};
				  col = M2x4[0];//取矩阵第一行 红色     
				  col = M2x4[1];//取矩阵第二行 绿色
				  //数组 
				  float arr[4] = {1,0.5,0.5,1};//橙红色
				  col = float4(arr[0],arr[1],arr[2],arr[3]);
				  //结构体赋值 改值操作
				  v2f o;
				  o.pos = fl4;
				  o.uv = fl2;
			   }
			   ENDCG
			   }
	}

}