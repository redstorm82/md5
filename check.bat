echo this is %%cd%%  %cd%     
echo this is %%~dp0 %~dp0   
@rem ���û�������ļ����� filename %1����MD5���㣬���Ϊ��md5 filename ����Ȼ�����ݻ�ȡ�� %%i�� %%j������
@rem %%i md5
@rem %%j filename
for /F "tokens=1* delims=." %%a in ("%1") do (
@for /f "tokens=1-2 delims= " %%i in ('md5.exe %1') do @(
		@rem %%i md5
		@rem %%j filename		
		@rem echo %%i 
 		@rem echo %%j
		@rem �Ա�MD5����ͬ���������ͬ�򱨴��˳�

		if %%j equ %%i @(			
			@echo check file %%j Pass��MD5 is %%i
		) else @(
			@echo Error check file %%j Fail��org MD5 is %%j  ��get %%i
			@goto end 
		)
	)
)
:end
pause
@rem �㷨����
@rem �ļ�����ʽ���� filename_sign_md5value.*
@rem 1.��������ļ�����MD5У�鲢��ȡMD5ֵ
@rem 2.�Ա��ļ����е�MD5�͵�1�����ɵ�MD5ֵ����ͬ��У��ͨ������ͬ��У��ʧ��


