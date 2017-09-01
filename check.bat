echo this is %%cd%%  %cd%     
echo this is %%~dp0 %~dp0   
@rem 对用户输入的文件名称 filename %1进行MD5运算，结果为（md5 filename ），然后将数据获取到 %%i， %%j变量中
@rem %%i md5
@rem %%j filename
for /F "tokens=1* delims=." %%a in ("%1") do (
@for /f "tokens=1-2 delims= " %%i in ('md5.exe %1') do @(
		@rem %%i md5
		@rem %%j filename		
		@rem echo %%i 
 		@rem echo %%j
		@rem 对比MD5，相同则继续，不同则报错退出

		if %%j equ %%i @(			
			@echo check file %%j Pass，MD5 is %%i
		) else @(
			@echo Error check file %%j Fail，org MD5 is %%j  ，get %%i
			@goto end 
		)
	)
)
:end
pause
@rem 算法描述
@rem 文件名格式定义 filename_sign_md5value.*
@rem 1.对输入的文件进行MD5校验并获取MD5值
@rem 2.对比文件名中的MD5和第1步生成的MD5值，相同则校验通过，不同则校验失败


