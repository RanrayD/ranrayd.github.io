@echo off
chcp 65001 > nul
echo ==========================================
echo       Ranray's Blog - 自动发布工具
echo ==========================================
echo.

:: 1. 添加所有更改
echo [1/3] 正在扫描文件更改...
git add .

:: 2. 提交更改
echo.
set /p msg="请输入本次更新说明 (直接回车默认使用 'Update content'): "
if "%msg%"=="" set msg=Update content

echo [2/3] 正在保存更改...
git commit -m "%msg%"

:: 3. 推送到 GitHub
echo.
echo [3/3] 正在发布到 GitHub (可能需要几秒钟)...
git push

echo.
if %errorlevel% equ 0 (
    echo ==========================================
    echo           发布成功！
    echo   请等待 1-2 分钟后访问网站查看效果
    echo ==========================================
) else (
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    echo           发布似乎出了点问题
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
)

pause
