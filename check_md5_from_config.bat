@rem 行遍历文件config.txt
@rem %%i md5
@rem %%j filename
@for /f  "tokens=1-2 delims= " %%i in (config.txt) do @(
	@rem 对文件执行md5.exe %%j运算，并的得到MD5值到%%k中
	@for /f "tokens=1 delims= " %%k in ('md5.exe %%j') do @(
		@rem echo get %%k
		@rem echo %%i 
 		@rem echo %%j
		@rem 对比MD5，相同则继续，不同则报错退出
		@if %%i equ %%k @(			
			@echo check file %%j Pass，MD5 is %%i
		) else @(
			@echo Error check file %%j Fail，org MD5 is %%i ，get %%k
			@goto end 
		)
	)
)
:end
pause
@rem 算法描述
@rem 1.先读取配置文件中描述那些文件需要MD5校验，以及对应的MD5值
@rem file1-MD5 file1 
@rem file12-MD5 file2 
@rem 2.根据配置文件，依次对相关文件进行MD5计算，并同原有的MD5对比，相同则校验通过，不同则校验失败
