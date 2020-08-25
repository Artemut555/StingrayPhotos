import controls.Button;
import controls.FocusablePanel;

Rectangle {
    id: mainMenu;
    focus: true;
    anchors.fill: mainWindow;
    color: "#FFFFFF";
 
    signal CodeEvent(); 
    
    Text {
	y: 220;
        x: 70;
        color: "#000000";
        font: Font {
            family: "Proxima Nova";
            bold: false;
            pixelSize: 100;
	}
        text: "Stingray Photos";
    }

    Text {
        x: 65;
        anchors.verticalCenter: parent.verticalCenter;
        color: "#000000";
        font: Font {
            family: "Proxima Nova";
            bold: true;
            pixelSize: 40;
	}
        text: " Чтобы загрузить фотографии, нужно зайти на специальный \n сайт с телефона или компьютера. Там нужно ввести код, \n который вы сейчас получите, и загрузить фотографии. ";
    }

    FocusablePanel {
        id: menuButton;
	y: 430;
        x: 70;
	width: 220;
	height: 45;
	color: "#000000";

	Text {
            id: subText;
	    anchors.verticalCenter: parent.verticalCenter;
            anchors.horizontalCenter: parent.horizontalCenter;
            color: "#FFFFFF";
            text: "Получить код";
            font: Font {
                family: "Proxima Nova";
                bold: false;
                pixelSize: 40;
            }
	}

        onSelectPressed: {
            pageStack.url = "apps/StingrayPhotos/img/Error.png";
            if (pageStack.codeRecieved != 1) {
	        pageStack.code = 0;
	        var request = new XMLHttpRequest();

	        //getting code for website
	        request.open("GET", "http://84.201.129.186:8000/get_key/", true);
	        request.onreadystatechange = function() {
	    	    if (request.readyState !== XMLHttpRequest.DONE)
		        return;
		        if (request.status === 200) {
			    log("response was received");
			    pageStack.code = JSON.parse(request.responseText)["key"];
		        } else
			    log("unhandled status", request.status);
	        }
		request.send();
            }
            log("StartButton PRESSED!");
            parent.CodeEvent();
        }
    }
}

