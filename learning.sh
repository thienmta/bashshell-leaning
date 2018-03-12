echo "Nhập tên folder cha mới: ";
read ten_folder_cha
echo "Bạn vừa tạo folder cha có tên: $ten_folder_cha ";

thumuchientai=$(pwd)
thuhientai=$(date +%a)

ngayhientai=$(date +%Y-%m-%d)
ngay=$(date -d "now + 0 day" '+%Y-%m-%d')

#kiểm tra tồn tại thư mục có tên vừa tạo đã tồn tại chưa
#Nếu tồn tại -> xác nhận xóa để tạo mới

if [ -d /$thumuchientai/$ten_folder_cha ];
then
	echo "Thư mục đã tồn tại, bạn xác nhân xóa để ghi đè?";
	sudo rm -r /$thumuchientai/$ten_folder_cha;
	sudo mkdir /$thumuchientai/$ten_folder_cha;
else
	
	sudo mkdir /$thumuchientai/$ten_folder_cha;
	echo "Thư mục chưa tồn tại -> đã thêm mới. ";
fi

# in ra thứ, ngày hiện tại
echo "Thứ   hiện tại: "$thuhientai;
echo "Ngày hiện tại: "$ngayhientai;

thu[0]="T2"
thu[1]="T3"
thu[2]="T4"
thu[3]="T5"
thu[4]="T6"
thu[5]="T7"
thu[6]="CN"


dem=0

#for((i=0;i<=6;i++))
#{
#	soanh=$(($i+2));
#	imagelink=$(wget --user-agent 'Mozilla/5.0' -qO - "www.google.be/search?q=thien&tbm=isch" | sed 's/</\n</g' | 	grep '<img' | head -#n"$soanh" | tail -n1 | sed 's/.*src="\([^"]*\)".*/\1/');
#	wget $imagelink --output-document $i.jpeg;
#}


for((i=0;i<7;i++))
{
	
	if [[ $thuhientai == ${thu[$i]} ]];
	then
		dem=$i;
		soanh=2;
		for((j=$dem-1;j>=0;j--))
		{
			
			ngay=$(date -d "now - $j day" '+%Y-%m-%d');
			sudo mkdir /$thumuchientai/$ten_folder_cha/$ngay;
			cd /$thumuchientai/$ten_folder_cha/$ngay/;
			sudo chmod 777 .;
			imagelink=$(wget --user-agent 'Mozilla/5.0' -qO - "https://www.google.com.vn/search?q=thien&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjcu6K6wuPZAhWKu48KHYfjBQsQ_AUICigB&biw=1319&bih=678#imgrc=Sx-0GnFmW8LUoM:" | sed 's/</\n</g' | 	grep 				'<img' | head -n"$soanh" | tail -n1 | sed 's/.*src="\([^"]*\)".*/\1/');
			wget $imagelink;
			#sudo touch /$thumuchientai/$ten_folder_cha/$ngay/"$j".jpeg;
			#sudo cp $thumuchientai/"$j".jpeg /$thumuchientai/$ten_folder_cha/$ngay/"$j".jpeg;
			((soanh++));
		}

		
		for((j=$dem;j<7;j++))
		{
			
			#tt=$((6-$j));
			ngay=$(date -d "now + $j day" '+%Y-%m-%d');
			sudo mkdir /$thumuchientai/$ten_folder_cha/$ngay;
			cd /$thumuchientai/$ten_folder_cha/$ngay/;
			sudo chmod 777 .;
			imagelink=$(wget --user-agent 'Mozilla/5.0' -qO - "https://www.google.com.vn/search?q=thien&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjcu6K6wuPZAhWKu48KHYfjBQsQ_AUICigB&biw=1319&bih=678#imgrc=Sx-0GnFmW8LUoM:" | sed 's/</\n</g' | 	grep 				'<img' | head -n"$soanh" | tail -n1 | sed 's/.*src="\([^"]*\)".*/\1/');
			wget $imagelink;
			#sudo touch /$thumuchientai/$ten_folder_cha/$ngay/"$j".jpeg;
			#sudo cp $thumuchientai/"$j".jpeg /$thumuchientai/$ten_folder_cha/$ngay/"$j".jpeg;
			((soanh++));
		}
	fi
}


echo "Đã tạo xong 7 thư mục con, mỗi thư mục chứa 1 ảnh khác nhau!   ";

#www.google.be/search?q=thien&tbm=isch



















