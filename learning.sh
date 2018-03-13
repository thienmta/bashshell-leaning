folderNow=$(pwd)
dayNow1=$(date +%a)
searchName=""

function main(){
	createNewFolderSearchName;
	isExistNewFolder;
	for((i=0;i<7;i++))
	{
		createFolder
	}
}

function createNewFolderSearchName(){
	echo "Nhập tên folder cha mới: ";
	read newFolderName;
	echo "Bạn vừa tạo folder cha có tên: $newFolderName. Nhap tiep ten search:";
	read searchName;
}

function isExistNewFolder(){
	if [ -d /$folderNow/$newFolderName ];
	then
		sudo rm -r /$folderNow/$newFolderName;
	fi
	sudo mkdir /$folderNow/$newFolderName;
}

function createFolderByDay(){
	day=$1;
	sudo mkdir /$folderNow/$newFolderName/$day;
	cd /$folderNow/$newFolderName/$day/;
	sudo chmod 777 .;
}

function downloadImageBySearchName(){
	imagelink=$(wget --user-agent 'Mozilla/5.0' -qO - "https://www.google.com.vn/search?q="$2"&tbm=isch" | sed 's/</\n</g' | 	grep 				'<img' | head -n"$1" | tail -n1 | sed 's/.*src="\([^"]*\)".*/\1/');
	wget $imagelink;
}

function createFolder(){
	for((i=0; i<7; i++))
	{
		count=$(expr $i - $dayNow + 1);
		day=$(date -d "now +$count day" '+%Y-%m-%d');
		createFolderByDay $day;
		downloadImageBySearchName $(expr $i + 2) $searchName;
	}
}
main