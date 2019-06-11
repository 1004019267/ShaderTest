    
    //函数必须在调用之前 或者在之前声明
   void Func(out float4 c)
	 {
     //CG参数以值拷贝进行传递
     c=float4(0,1,0,1);
	 }
   float Func2(float arr[2])
   {
     float sum=0;
     for (int i=0;i<arr.Length;i++)
     {
       sum+=arr[i];
     }
     return sum;
   }
  