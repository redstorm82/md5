@rem �б����ļ�config.txt
@rem %%i md5
@rem %%j filename
@for /f  "tokens=1-2 delims= " %%i in (config.txt) do @(
	@rem ���ļ�ִ��md5.exe %%j���㣬���ĵõ�MD5ֵ��%%k��
	@for /f "tokens=1 delims= " %%k in ('md5.exe %%j') do @(
		@rem echo get %%k
		@rem echo %%i 
 		@rem echo %%j
		@rem �Ա�MD5����ͬ���������ͬ�򱨴��˳�
		@if %%i equ %%k @(			
			@echo check file %%j Pass��MD5 is %%i
		) else @(
			@echo Error check file %%j Fail��org MD5 is %%i ��get %%k
			@goto end 
		)
	)
)
:end
pause
@rem �㷨����
@rem 1.�ȶ�ȡ�����ļ���������Щ�ļ���ҪMD5У�飬�Լ���Ӧ��MD5ֵ
@rem file1-MD5 file1 
@rem file12-MD5 file2 
@rem 2.���������ļ������ζ�����ļ�����MD5���㣬��ͬԭ�е�MD5�Աȣ���ͬ��У��ͨ������ͬ��У��ʧ��
