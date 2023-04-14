echo "building"
dotnet build --no-restore --configuration Release 

echo "deploying site"
cd bin\Release\netcoreapp3.1
scp *.* ptuser@20.82.178.73:~/www/dotnet08/
cd ..\..\..
scp -r wwwroot ptuser@20.82.178.73:~/www/dotnet08/

echo "restarting service"
ssh ptuser@20.82.178.73 sudo systemctl restart dotnet08.service